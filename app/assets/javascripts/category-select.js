// On document load
document.addEventListener('DOMContentLoaded',function() {

	var category_select = document.getElementById("select_category");

	if (typeof(category_select) != 'undefined' && category_select != null) {
		category_select.onchange=category_page;
	}

	function category_page(event) {
		if( event.target.value )
			location.assign(event.target.value);
	}
}, false);
