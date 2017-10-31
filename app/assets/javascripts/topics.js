(function() {

	// Set some variables
	var toggle_cta = document.getElementsByClassName("topic-toggle");
	var toggle_length = toggle_cta.length;
	var flag = null;

	// Initialise
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
		var self = this;
		var container = self.parentNode.parentNode.querySelector(':scope > .topics-list-extra');

		if (self.flag !== true) {	// open
			self.parentNode.parentNode.classList.add('visible');
			container.style.height = container.scrollHeight + 'px';
			self.innerHTML = 'View less';
			self.flag = true;

			self.wait = setTimeout( function (){
				self.parentNode.parentNode.classList.add('in');
				clearTimeout(self.wait);
			}, 100);
		} else {				// close
			self.parentNode.parentNode.classList.remove('visible');
			container.style.height = '0px';
			self.innerHTML = 'View more';
			self.flag = false;

			self.wait = setTimeout( function (){
				self.parentNode.parentNode.classList.remove('in');
				clearTimeout(self.wait);
			}, 100);
		}
	};

	init_topics();

}).call(this);
