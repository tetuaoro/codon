use crate::{
	components::{pagination::Pagination, table::TableHead},
	equipment::{EquipmentData, Row},
	error_template::ErrorTemplate,
	icons::EquipmentLogo,
};

use leptos::*;
use leptos_router::*;

stylance::import_style!(css, "equipment.module.css");

#[component]
pub fn Equipment() -> impl IntoView {
	let delete_equipment = create_server_action::<DeleteEquipment>();

	let query = use_query_map();
	let query_field = create_rw_signal(
		query.with(|p| p.get("field").cloned().unwrap_or(String::from("id"))),
	);
	let query_order = create_rw_signal(
		query.with(|p| p.get("order").cloned().unwrap_or(String::from("asc"))),
	);
	let query_page = create_rw_signal(
		query
			.with(|p| p.get("page").cloned().unwrap_or(String::from("1")))
			.parse::<u16>()
			.unwrap_or(1),
	);
	let query_ipp = create_rw_signal(
		query
			.with(|p| p.get("items_per_page").cloned().unwrap_or(String::from("25")))
			.parse::<u8>()
			.unwrap_or(25),
	);
	let items = create_rw_signal(0);

	let equipment_data = create_resource(
		move || (delete_equipment.version().get()),
		move |_| {
			get_equipment_data(
				query_field.get(),
				query_order.get(),
				query_page.get(),
				query_ipp.get(),
			)
		},
	);

	view! {
		<h1>
			<EquipmentLogo />
			" Equipment"
		</h1>
		<A href="add/">Add new</A>
		<Transition fallback=move || view! { <p>Loading equipment...</p> }>
			<ErrorBoundary fallback=|errors| {
				view! { <ErrorTemplate errors /> }
			}>
				{move || {
					let equipment_list = {
						move || {
							equipment_data
								.get()
								.map(move |data| match data {
									Err(e) => {
										view! {
											<pre class="error">Server Error: {e.to_string()}</pre>
										}
											.into_view()
									}
									Ok(equipment) => {
										if equipment.is_empty() {
											view! {
												<tr>
													<td colspan=EquipmentData::get_fields()
														.len()>"No equipment found."</td>
												</tr>
											}
												.into_view()
										} else {
											items.set(equipment.len());
											view! { <Row equipment delete_equipment /> }
										}
									}
								})
								.unwrap_or_default()
						}
					};
					view! {
						<Pagination action="/equipment" query_page query_ipp items>
							<input type="hidden" name="field" value=query_field.get() />
							<input type="hidden" name="order" value=query_order.get() />
						</Pagination>
						<table>
							<thead>
								<tr>
									<TableHead
										action="/equipment"
										items=EquipmentData::get_fields()
										query_field
										query_order
									>
										<input type="hidden" name="page" value=query_page.get() />
										<input
											type="hidden"
											name="items_per_page"
											value=query_ipp.get()
										/>
									</TableHead>
									<th colspan="3"></th>
								</tr>
							</thead>
							<tbody>{equipment_list}</tbody>
						</table>
						<Pagination action="/equipment" query_page query_ipp items>
							<input type="hidden" name="field" value=query_field.get() />
							<input type="hidden" name="order" value=query_order.get() />
						</Pagination>
					}
				}}
			</ErrorBoundary>
		</Transition>
	}
}

#[server]
pub async fn get_equipment_data(
	field: String,
	order: String,
	page: u16,
	items_per_page: u8,
) -> Result<Vec<EquipmentData>, ServerFnError> {
	use crate::{db::ssr::get_db, equipment::EquipmentSQLData};

	let order_sanitized = match order.to_lowercase().as_str() {
		"asc" => "ASC",
		"desc" => "DESC",
		_ => "ASC",
	};

	let field_sanitized = match field.to_lowercase().as_str() {
		ref f @ "id"
		| ref f @ "equipment_type"
		| ref f @ "qrcode"
		| ref f @ "create_date"
		| ref f @ "name"
		| ref f @ "status"
		| ref f @ "manufacturer"
		| ref f @ "purchase_date"
		| ref f @ "vendor"
		| ref f @ "cost_in_cent"
		| ref f @ "warranty_expiration_date"
		| ref f @ "location"
		| ref f @ "notes" => String::from(*f),
		_ => String::from("id"),
	};

	let limit = items_per_page as i64;
	let offset = (page as i64 - 1) * items_per_page as i64;

	let query = format!(
		"SELECT * FROM equipment ORDER BY {field_sanitized} {order_sanitized} LIMIT $1 OFFSET $2",
	);

	let equipment_sql_data = sqlx::query_as::<_, EquipmentSQLData>(&query)
		.bind(limit)
		.bind(offset)
		.fetch_all(get_db())
		.await
		.map_err::<ServerFnError, _>(|error| {
			ServerFnError::ServerError(error.to_string())
		})?;

	let equipment_data: Vec<EquipmentData> =
		equipment_sql_data.into_iter().map(Into::into).collect();

	Ok(equipment_data)
}

#[server]
pub async fn delete_equipment(id: i32) -> Result<(), ServerFnError> {
	use crate::db::ssr::get_db;

	use server_fn::error::NoCustomError;
	use std::fs;
	use std::path::PathBuf;

	let qrcode_path: String =
		sqlx::query_scalar("SELECT qrcode FROM equipment WHERE id = $1")
			.bind(id)
			.fetch_one(get_db())
			.await?;

	let file_path = PathBuf::from(format!(
		"{}/public/qrcodes/{}",
		env!("CARGO_MANIFEST_DIR"),
		qrcode_path
	));

	if file_path.exists() {
		fs::remove_file(&file_path).map_err(|error| {
			ServerFnError::<NoCustomError>::ServerError(error.to_string())
		})?;
	}

	Ok(
		sqlx::query!("DELETE FROM equipment WHERE id = $1", id)
			.execute(get_db())
			.await
			.map(|_| ())?,
	)
}
