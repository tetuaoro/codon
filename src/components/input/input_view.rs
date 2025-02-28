use leptos::*;

stylance::import_style!(css, "input.module.css");

#[component]
pub fn Input(
	#[prop(optional)] placeholder: &'static str,
	#[prop(optional)] value: RwSignal<String>,
	#[prop(optional)] name: &'static str,
	#[prop(optional, default = "text")] kind: &'static str,
	#[prop(optional)] disabled: RwSignal<bool>,
	#[prop(optional)] required: bool,
) -> impl IntoView {
	view! {
		<input
			type=kind
			name=name
			class=css::input
			placeholder=placeholder
			value=value
			disabled=disabled
			required=required
		/>
	}
}

#[component]
pub fn MoneyInput(
	#[prop(optional)] value: RwSignal<String>,
	#[prop(optional)] disabled: RwSignal<bool>,
	#[prop(optional)] name: &'static str,
	#[prop(optional)] required: bool,
	#[prop(optional)] placeholder: &'static str,
) -> impl IntoView {
	let dis_class = if disabled.get() { css::money_input_disabled } else { "" };

	view! {
		<div class=format!("{} {} {dis_class}", css::input, css::money_input)>
			<span class=css::money_symbol>$</span>
			<input
				type="number"
				class=format!("{} codon-input-field", css::input_field)
				name=name
				prop:value=value
				on:input=move |event| { value.set_untracked(event_target_value(&event)) }
				disabled=move || disabled.get()
				step="0.01"
				required=required
				placeholder=placeholder
			/>
			<div class=css::money_btns>
				<button
					type="button"
					title="Add to money"
					disabled=move || disabled.get()
					on:click=move |_| {
						if let Ok(amount) = value.get_untracked().parse::<f64>() {
							value.set(format!("{:.2}", (amount + 1.0)));
						}
					}
					class=css::money_btn
				>
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" fill-opacity="0.5">
						<path d="M5 21h14a2 2 0 0 0 2-2V5a2 2 0 0 0-2-2H5a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2zm2-10h4V7h2v4h4v2h-4v4h-2v-4H7v-2z" />
					</svg>
				</button>
				<button
					type="button"
					title="Substract from money"
					disabled=move || disabled.get()
					on:click=move |_| {
						if let Ok(amount) = value.get_untracked().parse::<f64>() {
							value.set(format!("{:.2}", (amount - 1.0)));
						}
					}
					class=css::money_btn
				>
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" fill-opacity="0.5">
						<path d="M5 3a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V5a2 2 0 0 0-2-2H5zm12 10H7v-2h10v2z" />
					</svg>
				</button>
			</div>
		</div>
	}
}

#[component]
pub fn TextArea(
	#[prop(optional)] placeholder: &'static str,
	#[prop(optional)] value: RwSignal<String>,
	#[prop(optional)] disabled: RwSignal<bool>,
	#[prop(optional)] name: &'static str,
	#[prop(optional)] required: bool,
	#[prop(optional)] class: String,
) -> impl IntoView {
	view! {
		<textarea
			class=format!("{} {}", class, css::textarea)
			prop:name=name
			placeholder=placeholder
			disabled=disabled
			required=required
		>
			{value.get()}
		</textarea>
	}
}
