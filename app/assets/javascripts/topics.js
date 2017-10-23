// On document load
// document.addEventListener('DOMContentLoaded',function() {

	var toggle_cta = document.getElementsByClassName("topic-toggle");
	var toggle_length = toggle_cta.length;

	console.log('toggle_length ' + toggle_length);


	// Events
	for (i =0; i < toggle_length; i++) {
		toggle_cta[i].addEventListener('click', toggle_topics, false);
	}

	// Toggle topics
	function toggle_topics(){
		var theClass = this.className;  // "this" is the element clicked
		console.log( theClass );
	};


// }, false);
