(function() {

	// Set some variables
	var accordion_cta = document.getElementsByClassName('accordion-header');
	var accordion_open_all_cta = document.getElementsByClassName('accordion-open-all');
	var accordion_length = accordion_cta.length;
	var acc_single_flag = null;
	var acc_all_flag = null;

	// Initialise
	function init_accordion(){
		if (typeof(accordion_cta) != 'undefined' && accordion_cta != null) {
			accordion_events();
		}
	}

	// Events
	function accordion_events(){
		// Open single
		for (var i =0; i < accordion_length; i++) {
			accordion_cta[i].addEventListener('click', toggle_accordion, false);
		}

		// Open all
		accordion_open_all_cta[0].addEventListener('click', toggle_all_accordion, false);
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

	// Toggle all topics
	function toggle_all_accordion(){
		var self = this;
		var accordions = document.querySelectorAll('.accordion-inner'), i;

		if (self.acc_all_flag !== true) {		// open
			self.acc_all_flag = true;
		} else {														// close
			self.acc_all_flag = false;
		}

		for (i = 0; i < accordions.length; ++i) {
				if (self.acc_all_flag !== true) {		// open
					accordions[i].parentNode.classList.add('visible');
					accordions[i].style.height = accordions[i].scrollHeight + 'px';
				} else {														// close
					accordions[i].parentNode.classList.remove('visible');
					accordions[i].style.height = '0px';
				}
		}

		console.log('acc_all_flag after = ' + self.acc_all_flag);
	};

	init_accordion();

}).call(this);
