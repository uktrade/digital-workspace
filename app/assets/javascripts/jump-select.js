(function() {

	var select_jump_to = document.getElementById("select_jump_to");

	if (typeof(select_jump_to) != 'undefined' && select_jump_to != null) {
		select_jump_to.onchange=category_page;
	}

	function category_page(event) {
		if( event.target.value )
			location.assign(event.target.value);
	}
}).call(this);
