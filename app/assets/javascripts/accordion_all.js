(function() {

	// Set some variables
	var accordion_all_cta = document.getElementsByClassName('accordion-open-all');
	var accordion_all_length = accordion_all_cta.length;
	var acc_all_flag = false;

	// console.log('accordion_open_all_cta ' + accordion_open_all_cta);

	// Initialise
	function init_accordion_all(){
		if (typeof(accordion_all_cta) != 'undefined' && accordion_all_cta != null) {
			accordion_all_events();
		}
	}

	// Events
	function accordion_all_events(){
		// Open all
			accordion_all_cta[0].addEventListener('click', toggle_all_accordion, false);
	}

	// Toggle all topics
	function toggle_all_accordion(){
		var self = this;
		var accordions = document.querySelectorAll('.accordion-inner'), i;

		// Set flags
		if (self.acc_all_flag !== true) {
			self.acc_all_flag = true;
			self.acc_single_flag = false;
		} else {
			self.acc_all_flag = false;
			// self.acc_single_flag = true;
		}

		for (i = 0; i < accordions.length; ++i) {
				if (self.acc_all_flag === true) {		// open
					self.innerHTML = 'Close all';
					accordions[i].parentNode.classList.add('visible');
					accordions[i].style.height = accordions[i].scrollHeight + 'px';
				} else {														// close
					self.innerHTML = 'Open all';
					accordions[i].parentNode.classList.remove('visible');
					accordions[i].style.height = '0px';
				}
		}
	};

	init_accordion_all();

}).call(this);
