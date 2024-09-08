use leptos::*;

stylance::import_style!(css, "icons.module.css");

#[component]
pub fn VesselLogo() -> impl IntoView {
	view! {
		<svg
			xmlns="http://www.w3.org/2000/svg"
			fill="none"
			viewBox="0 0 870 870"
			class=css::logo
		>
			<path
				stroke="currentColor"
				stroke-linecap="round"
				stroke-width="15"
				d="M162.075 523.886v272.859c0 12.843 10.454 23.255 23.35 23.255 12.895 0 23.349-10.412 23.349-23.255V523.886m-46.699-55.554v-53.553m46.699 4.201v49.352m451.415 54.52v273.893c0 12.843 10.453 23.255 23.349 23.255 12.895 0 23.349-10.412 23.349-23.255V522.852m0-103.872v48.161M527.358 99.711V69.638c0-10.846 8.828-19.638 19.717-19.638h40.472c10.89 0 19.717 8.792 19.717 19.638V99.71m-398.49 68.631v-94.57C208.774 60.643 219.46 50 232.642 50h108.962c13.182 0 23.868 10.643 23.868 23.772v94.57m-156.698 0h156.698m-156.698 0v65.114m156.698-65.114v65.114m0 0H208.774m156.698 0v57.88m-156.698-57.88v57.88m0 0h156.698m-156.698 0v59.946m156.698-59.946v59.946m0 0v116.892m0-116.892H208.774m0 65.631v-65.631M435 167.826h92.358M435 214.336h172.264M435 259.812h172.264M198.396 417.946h473.208c81.957 0 148.396-66.171 148.396-147.798v-20.671c0-81.627-66.439-147.799-148.396-147.799H198.396C116.439 101.678 50 167.85 50 249.477v20.671c0 81.627 66.439 147.798 148.396 147.798Zm-43.585 103.356h560.378c12.608 0 22.83-10.18 22.83-22.738v-6.202c0-12.558-10.222-22.738-22.83-22.738H154.811c-12.608 0-22.83 10.18-22.83 22.738v6.202c0 12.558 10.222 22.738 22.83 22.738Z"
			/>
		</svg>
	}
}

#[component]
pub fn Vessel() -> impl IntoView {
	view! {
		<svg
			xmlns="http://www.w3.org/2000/svg"
			fill="none"
			viewBox="0 0 300 300"
			class=css::icon
		>
			<path
				stroke="currentColor"
				stroke-linecap="round"
				stroke-width="10"
				d="M245.929 177.395H53.071m2.5-.445v-30.098m24.056 1.136v28.962m0 0v-62.87m0 62.87v-52.931m0 52.931v-52.261m-7.984 59.404V278M227 278v-94.263m16.071-35.749v28.552M181.286 38.109v-10.35c0-3.733 3.038-6.759 6.785-6.759H202c3.748 0 6.786 3.026 6.786 6.759v10.35M79.627 74.704V29.18c0-4.518 3.678-8.181 8.215-8.181h37.5c4.536 0 8.214 3.663 8.214 8.181v45.523m-53.929 0h53.929m-53.929 0v39.376m53.929-39.376v39.376m0 0H79.627m53.929 0v62.816M79.627 114.08v9.939m0-9.939v10.609m0-.67v.67m0 22.588v-22.588M149.5 68.537h31.786M149.5 95.205h59.286M68.071 147.633H230.93c28.206 0 51.071-22.774 51.071-50.867v-7.114c0-28.093-22.865-50.867-51.071-50.867H68.071C39.865 38.785 17 61.56 17 89.653v7.114c0 28.093 22.865 50.867 51.071 50.867Z"
			/>
		</svg>
	}
}
