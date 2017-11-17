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
			get_cookies();
		} else {
			return;
		}
	}

	// Events
	function accordion_events(){
		// Open all
		accordion_all_cta[0].addEventListener('click', toggle_all, false);

		// Open single
		for (var i = 0; i < accordion_length; i++) {
			accordion_cta[i].addEventListener('click', toggle_single, false);

			(function(index){
				accordion_cta[i].onclick = function(){
					set_cookies(index);
				}
			})(i);		
		}
	}

	function set_cookies(i) {
		// Cookies
		var date = new Date();
		var name = 'accordion_single_selection_'+i;
		var value = i;
		date.setTime( date.getTime() + 60 * 60 * 24 * 1000 );
		var expires = "; expires="+date.toGMTString(); // expires after 24 hours
		// var expires = "; expires=Thu, 01 Jan 1970 00:00:00 UTC"; // For deleting cookie when testing

		// Set cookie
		document.cookie = name+"="+value+expires+"; path=/;";
	}

	function get_cookies() {
		var cookies = {};
		var key_val_pairs = document.cookie.split(';');
		var pattern_a = /accordion_single_selection_(\d*)/;
		// var pattern_a = /^((?!accordion_single_selection_).)*$/;
		var selections_array = [];

		
		// Collect selections
		for (i = 0; i < key_val_pairs.length; ++i) {
			var result = pattern_a.test(key_val_pairs[i]);
			
			if (result === true) {
				var number = key_val_pairs[i].split('=');
				var selected = number[1];

				selections_array.push(selected);
				accordions[selected].parentNode.classList.add('visible', 'animate-false');
				accordions[selected].style.height = accordions[i].scrollHeight + 'px';
			}
		}
		console.log('selections_array ' + selections_array);
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
		var accordion = self.parentNode;
		var accordions_inner = document.querySelectorAll('.accordion-inner');
		var accordion_inner = self.parentNode.querySelector(':scope > .accordion-inner');

		// Remove classes
		for (var i = 0; i < accordions.length; ++i) {
			// Reset 'Open all'
			flag = false;
			accordion_all_cta[0].innerHTML = 'Open all';

			// Add class
			if ( accordion.className === 'accordion visible' ) {
				accordion.classList.remove('visible');
				accordion_inner.style.height = '0px';
			} else { // Remove class
				accordion.classList.add('visible');
				accordion_inner.style.height = accordion_inner.scrollHeight + 'px';
			}

			var visible = document.querySelectorAll('.visible');

			// Reset 'Close all'
			if (accordions.length === ( visible.length) ) {
				flag = true;
				accordion_all_cta[0].innerHTML = 'Close all';
			}
		}
	};
	
	init_accordion();

}).call(this);
