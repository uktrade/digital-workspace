(function() {

	// Set some variables
	var accordion_cta = document.getElementsByClassName('accordion-header');
	var accordion_length = accordion_cta.length;
	var acc_single_flag = null;

	// Initialise
	function init_accordion_single(){
		if (typeof(accordion_cta) != 'undefined' && accordion_cta != null) {
			accordion_single_events();
		}
	}

	// Events
	function accordion_single_events(){
		// Open single
		for (var i =0; i < accordion_length; i++) {
			accordion_cta[i].addEventListener('click', toggle_accordion, false);
		}
	}

	// Toggle topics
	function toggle_accordion(){
		var self = this;
		var container = self.parentNode.querySelector(':scope > .accordion-inner');

		if (self.acc_single_flag !== true) {	// open
			self.parentNode.classList.add('visible');
			container.style.height = container.scrollHeight + 'px';
			self.acc_single_flag = true;
		} else {															// close
			self.parentNode.classList.remove('visible');
			container.style.height = '0px';
			self.acc_single_flag = false;
		}
	};

	init_accordion_single();

}).call(this);
