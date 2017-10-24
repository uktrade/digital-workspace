(function() {

	var toggle_cta = document.getElementsByClassName("topic-toggle");
	var toggle_length = toggle_cta.length;
	var flag = true;


	function init_topics(){
		if (typeof(toggle_cta) != 'undefined' && toggle_cta != null) {
			topics_events();
		}
	}

	// Events
	function topics_events(){
		for (i =0; i < toggle_length; i++) {
			toggle_cta[i].addEventListener('click', toggle_topics, false);
		}
	}

	// Toggle topics
	function toggle_topics(){
		var theClass = this.className;
		var container = this.parentNode.parentNode.querySelector(':scope > .topics-list-extra');

		this.parentNode.parentNode.classList.toggle("visible");

		if (flag === true) {
			container.style.height = container.scrollHeight + 'px';
			this.innerHTML = 'View less';
			flag = false;
		} else {
			container.style.height = '0px';
			this.innerHTML = 'View more';
			flag = true;
		}
	};

	init_topics();

}).call(this);
