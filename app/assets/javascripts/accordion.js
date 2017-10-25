(function() {

	// Set some variables
	var accordion_cta = document.getElementsByClassName("accordion-header");
	var accordion_length = accordion_cta.length;
	var flag = null;

	// Initialise
	function init_accordion(){
		if (typeof(accordion_cta) != 'undefined' && accordion_cta != null) {
			accordion_events();
		}
	}

	// Events
	function accordion_events(){
		for (i =0; i < accordion_length; i++) {
			accordion_cta[i].addEventListener('click', toggle_accordion, false);
		}
	}

	// Toggle topics
	function toggle_accordion(){
		var self = this;
		var container = self.parentNode.querySelector(':scope > .accordion-inner');

		if (self.flag !== true) {	// open
			self.parentNode.parentNode.classList.add('visible');
			container.style.height = container.scrollHeight + 'px';
			// self.innerHTML = 'View less';
			self.flag = true;
		} else {				// close
			self.parentNode.parentNode.classList.remove('visible');
			container.style.height = '0px';
			// self.innerHTML = 'View more';
			self.flag = false;
		}
	};

	init_accordion();

}).call(this);
