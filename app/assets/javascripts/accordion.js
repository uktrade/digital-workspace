(function() {

	// Set some variables
	var accordion_container_length = document.getElementsByClassName('accordion-container').length;
	var accordions = document.querySelectorAll('.accordion-inner'), i;

	var accordion_all_cta = document.getElementsByClassName('accordion-open-all');
	var accordion_all_length = accordion_all_cta.length;

	var accordion_cta = document.querySelectorAll('.accordion-header');
	var accordion_length = accordion_cta.length;

	var flag = null;

	// Initialise
	function init_accordion(){
		if (accordion_container_length !== 0 || accordion_container_length > 0) {
			accordion_events();
		} else {
			return;
		}
	}

	// Events
	function accordion_events(){
		// Open all
		accordion_all_cta[0].addEventListener('click', toggle_all, false);

		// Open single
		for (var i =0; i < accordion_length; i++) {
			accordion_cta[i].addEventListener('click', toggle_single, false);
		}
	}

	// Toggle all topics
	function toggle_all(){
		var self = this;

		// Set flags
		if (flag !== true) {
			flag = true;
		} else {
			flag = false;
		}

		for (i = 0; i < accordions.length; ++i) {
				var self = this;

				if (flag === true) {		// open
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

	// Toggle single topic
	function toggle_single(){
		var self = this;
		var accordions = document.querySelectorAll('.accordion');
		var visible = document.querySelectorAll('.visible');
		var accordion = self.parentNode;
		var accordions_inner = document.querySelectorAll('.accordion-inner');
		var accordion_inner = self.parentNode.querySelector(':scope > .accordion-inner');

		// Remove classes
		for (i = 0; i < accordions.length; ++i) {

			// Add class
			if ( accordion.className === 'accordion visible' ) {
				accordion.classList.remove('visible');
				accordion_inner.style.height = '0px';
			} else { // Remove class
				accordion.classList.add('visible');
				accordion_inner.style.height = accordion_inner.scrollHeight + 'px';
			}

			// Reset 'Open all'
			flag = false;
			accordion_all_cta[0].innerHTML = 'Open all';


			// Reset 'Close all'
			if (accordions.length === ( visible.length -1) ) {
				flag = true;
				accordion_all_cta[0].innerHTML = 'Close all';
			}
		}
	};

	init_accordion();

}).call(this);
