// On document load
document.addEventListener('DOMContentLoaded',function() {
	document.getElementById("select_category").onchange=category_page;
}, false);

function category_page(event) {
	if( event.target.value )
		location.assign(event.target.value);
}
