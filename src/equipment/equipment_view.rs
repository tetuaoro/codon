use crate::{
	app::LoginAction,
	components::{
		button::{Button, ButtonVariant},
		pagination::Pagination,
		select::{MultiSelect, MultiSelectOption},
	},
	equipment::{EquipmentData, Heading, Row, THead},
	error_template::ErrorTemplate,
	icons::EquipmentLogo,
	login::Login,
};

use leptos::*;
use leptos_router::*;

stylance::import_style!(css, "equipment.module.css");

#[component]
pub fn Equipment() -> impl IntoView {
	// let delete_equipment = create_server_action::<DeleteEquipment>();

	let query = use_query_map();
	let query_field = create_rw_signal(query.with(|p| p.get("field").cloned().unwrap_or(String::from("id"))));
	let query_order = create_rw_signal(query.with(|p| p.get("order").cloned().unwrap_or(String::from("asc"))));
	let query_page = create_rw_signal({
		let page = query.with(|p| p.get("page").cloned().unwrap_or(String::from("1"))).parse::<u16>().unwrap_or(1);
		if page > 0 {
			page
		} else {
			1
		}
	});
	let query_ipp = create_rw_signal({
		let ipp =
			query.with(|p| p.get("items_per_page").cloned().unwrap_or(String::from("25"))).parse::<u8>().unwrap_or(25);
		if ipp > 0 {
			ipp
		} else {
			1
		}
	});
	let query_archived = create_rw_signal({
		query.with(|p| p.get("archive").cloned().unwrap_or(String::from("false"))).parse::<bool>().unwrap_or(false)
	});

	let field_filter = create_rw_signal(vec![
		String::from("id"),
		String::from("equipment_type"),
		String::from("name"),
		String::from("status"),
		String::from("location"),
		String::from("notes"),
	]);

	let login_action = use_context::<LoginAction>().expect("No login action found in context");

	let equipment_data = create_resource(
		move || (/*delete_equipment.version().get(),*/login_action.version().get()),
		move |_| {
			get_equipment_data(query_field.get(), query_order.get(), query_page.get(), query_ipp.get(), query_archived.get())
		},
	);

	view! {
		<Heading>
			<EquipmentLogo />
			" Equipment"
		</Heading>
		<Suspense fallback=move || view! { <p>Loading equipment...</p> }>
			<ErrorBoundary fallback=|errors| {
				view! { <ErrorTemplate errors /> }
			}>
				{move || {
					view! {
						{equipment_data
							.get()
							.map(move |data| match data {
								Err(error) => {
									if error.to_string().contains("User not authenticated") {
										view! { <Login redirect="/equipment" /> }
									} else {
										view! { <pre class="error">Server Error: {error.to_string()}</pre> }.into_view()
									}
								}
								Ok((equipment, row_count)) => {
									let hidden_fields = vec![
										(String::from("field"), query_field.get()),
										(String::from("order"), query_order.get()),
										(String::from("archive"), query_archived.get().to_string()),
									];
									view! {
										<Pagination
											action=String::from("/equipment")
											page_key="page"
											ipp_key="items_per_page"
											query_page
											query_ipp
											row_count
											hidden_fields=hidden_fields.clone()
										/>
										<div class=css::filter>
											"Columns: "
											<MultiSelect
												value=field_filter
												options=create_rw_signal(
													EquipmentData::get_fields()
														.into_iter()
														.map(|(id, name)| MultiSelectOption::new(name, id))
														.collect::<Vec<MultiSelectOption<String>>>(),
												)
											/>
											<Button
												variant=ButtonVariant::Outlined
												on_click=move |_| {
													field_filter
														.set(
															EquipmentData::get_fields()
																.into_iter()
																.map(|(id, _)| id)
																.collect::<Vec<String>>(),
														);
												}
											>
												All
											</Button> <form action="/equipment" method="get" class=css::filter_switch>
												<input type="hidden" name="field" value=query_field.get() />
												<input type="hidden" name="order" value=query_order.get() />
												<input type="hidden" name="page" value=query_page.get() />
												<input type="hidden" name="items_per_page" value=query_ipp.get() />
												<input
													type="hidden"
													name="archive"
													value=(!query_archived.get()).to_string()
												/>
												<button type="submit">
													Archived:
													<div class=format!(
														"input_shadow {} fake_switch-{}",
														css::fake_switch,
														query_archived.get().to_string(),
													)>
														<div />
													</div>
												</button>
											</form>
										</div>
										<div class=css::table_wrapper>
											<table class=css::table>
												<thead>
													<tr>
														<THead
															action="/equipment"
															items=EquipmentData::get_fields()
															query_field
															query_order
															field_filter
														>
															<input type="hidden" name="page" value=query_page.get() />
															<input
																type="hidden"
																name="items_per_page"
																value=query_ipp.get()
															/>
															<input
																type="hidden"
																name="archive"
																value=query_archived.get().to_string()
															/>
														</THead>
													</tr>
												</thead>
												<tbody>
													{if equipment.is_empty() {
														view! {
															<tr>
																<td colspan=EquipmentData::get_fields()
																	.len()>"No equipment found."</td>
															</tr>
														}
															.into_view()
													} else {
														view! { <Row equipment field_filter /> }.into_view()
													}}
												</tbody>
											</table>
										</div>
										<Pagination
											action=String::from("/equipment")
											page_key="page"
											ipp_key="items_per_page"
											query_page
											query_ipp
											row_count
											hidden_fields
										/>
									}
										.into_view()
								}
							})
							.unwrap_or_default()}
					}
				}}
			</ErrorBoundary>
		</Suspense>
	}
}

#[server(prefix = "/api")]
pub async fn get_equipment_data(
	field: String,
	order: String,
	page: u16,
	items_per_page: u8,
	show_archived: bool,
) -> Result<(Vec<EquipmentData>, i64), ServerFnError> {
	use crate::{auth::get_user, equipment::EquipmentSQLData, permission::Permissions};

	use sqlx::PgPool;

	let pool = use_context::<PgPool>()
		.ok_or_else::<ServerFnError, _>(|| ServerFnError::ServerError(String::from("Database not initialized")))?;
	let user = get_user().await?;

	let auth_query = match user {
		Some(user) => {
			let Permissions::All {
				read: perm,
				write: _,
				create: _,
			} = user.permission_equipment;
			perm.get_query_select_without_where("equipment.id")
		},
		None => return Err(ServerFnError::Request(String::from("User not authenticated"))),
	};

	let order_sanitized = match order.to_lowercase().as_str() {
		"asc" => "ASC",
		"desc" => "DESC",
		_ => "ASC",
	};

	let field_sanitized = match field.to_lowercase().as_str() {
		f @ "id"
		| f @ "equipment_type"
		| f @ "person"
		| f @ "qrcode"
		| f @ "create_date"
		| f @ "name"
		| f @ "status"
		| f @ "manufacturer"
		| f @ "purchase_date"
		| f @ "vendor"
		| f @ "cost_in_cent"
		| f @ "warranty_expiration_date"
		| f @ "location"
		| f @ "notes" => String::from(f),
		_ => String::from("id"),
	};

	let limit = items_per_page as i64;
	let offset = (page as i64 - 1) * items_per_page as i64;
	let status_where = if show_archived {
		""
	} else {
		"AND equipment.status IS DISTINCT FROM 'Archived'"
	};

	let query = format!(
		r#"
			SELECT
				equipment.*,
				people.id AS person_id,
				people.status AS person_status,
				people.preferred_name AS person_preferred_name,
				people.picture AS person_picture
			FROM
				equipment
				JOIN people ON equipment.person = people.id
			WHERE
				equipment.id IS NOT NULL
				{status_where}
				{auth_query}
				{status_where}
			ORDER BY {field_sanitized} {order_sanitized}
			LIMIT $1 OFFSET $2
			"#
	);
	let equipment_sql_data = sqlx::query_as::<_, EquipmentSQLData>(&query)
		.bind(limit)
		.bind(offset)
		.fetch_all(&pool)
		.await
		.map_err::<ServerFnError, _>(|error| ServerFnError::ServerError(error.to_string()))?;

	let equipment_data: Vec<EquipmentData> = equipment_sql_data.into_iter().map(Into::into).collect();

	let row_count: i64 =
		sqlx::query_scalar(&format!("SELECT COUNT(*) FROM equipment WHERE id IS NOT NULL {status_where}"))
			.fetch_one(&pool)
			.await?;

	Ok((equipment_data, row_count))
}

// #[server(prefix = "/api")]
// pub async fn delete_equipment(id: i32) -> Result<(), ServerFnError> {
// 	use crate::{auth::get_user, permission::Permissions};

// 	use server_fn::error::NoCustomError;
// 	use sqlx::PgPool;
// 	use std::{fs, path::PathBuf};

// 	let pool = use_context::<PgPool>().ok_or_else::<ServerFnError, _>(|| ServerFnError::ServerError(String::from("Database not initialized")))?;
// 	let user = get_user().await?;

// 	match user {
// 		Some(user) => {
// 			let Permissions::All {
// 				read: _,
// 				write: perm,
// 				create: _,
// 			} = user.permission_equipment;
// 			let person: i32 =
// 				sqlx::query_scalar("SELECT person FROM equipment WHERE id = $1").bind(id).fetch_one(&pool).await?;
// 			if !perm.has_permission("read", id, person) {
// 				return Err(ServerFnError::Request(String::from("User not authenticated")));
// 			}
// 		},
// 		None => return Err(ServerFnError::Request(String::from("User not authenticated"))),
// 	};

// 	let qrcode_path: String =
// 		sqlx::query_scalar("SELECT qrcode FROM equipment WHERE id = $1").bind(id).fetch_one(&pool).await?;
// 	// TODO: delete all logs and notes as well

// 	let file_path = PathBuf::from(format!("{}/public/qrcodes/{}", env!("CARGO_MANIFEST_DIR"), qrcode_path));

// 	if file_path.exists() {
// 		fs::remove_file(&file_path).map_err(|error| ServerFnError::<NoCustomError>::ServerError(error.to_string()))?;
// 	}

// 	Ok(sqlx::query("DELETE FROM equipment WHERE id = $1").bind(id).execute(&pool).await.map(|_| ())?)
// }
