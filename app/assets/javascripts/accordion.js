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
			enable_animation();
		} else {
			return;
		}
	}

	function enable_animation(){
		window.wait = setTimeout( function (){
			for (i = 0; i < accordions.length; i++) {
				accordions[i].classList.remove('no-animate');
			};
			clearTimeout(window.wait);
		}, 200);
	}

	// Events
	function accordion_events(){
		// Open all
		//accordion_all_cta[0].addEventListener('click', toggle_all, false);
		accordion_all_cta[0].onclick = function() {
			toggle_all();
			return false;
		};

		// Open single
		for (var i = 0; i < accordion_length; i++) {
			//accordion_cta[i].addEventListener('click', toggle_single, false);
			(function(index){
				accordion_cta[i].onclick = function(elem){
					toggle_single(index);
				}
			})(i);		
		}
	}

	function set_cookies(i, height) {
		// Cookies
		var date = new Date();
		var slug = (window.location.pathname).replace(/\//g, '');
		var name = 'accordion_single_selection_'+slug+'_'+i;
		var value = i + 'sh-' + height;
		date.setTime( date.getTime() + 60 * 60 * 24 * 1000 );
		var expires = "; expires="+date.toGMTString(); // expires after 24 hours
		// var expires = "; expires=Thu, 01 Jan 1970 00:00:00 UTC"; // For deleting cookie when testing

		// Set cookie
		document.cookie = name+"="+value+expires+"; path=/;";
	}

	function get_cookies() {
		var cookies = {};
		var slug = (window.location.pathname).replace(/\//g, '');
		var key_val_pairs = document.cookie.split(';');
		var pattern_a = /accordion_single_selection_(\d*)/;
		// var pattern_a = /^((?!accordion_single_selection_).)*$/;
		var selections_array = [];
		// Collect selections
		for (i = 0; i < key_val_pairs.length; ++i) {
			var result = pattern_a.test(key_val_pairs[i]);
			if (result === true) {
				if(key_val_pairs[i].indexOf(slug) >= 0){
					var values = key_val_pairs[i].split('=');
					var valuesArr = values[1].split('sh-');
					var number = valuesArr[0];
					var selected = number;
					var height = valuesArr[1];
					if(height.indexOf('px') < 0) {
						height = height + 'px';
					}
					selections_array.push(selected);
					accordions[selected].parentNode.classList.add('visible');
					accordions[selected].style.height = height;
				}
			}
		}

		//console.log('selections_array ' + selections_array);
	}

	function rem_cookies(i) {
		// Cookies
		var date = new Date();
		var slug = (window.location.pathname).replace(/\//g, '');
		var name = 'accordion_single_selection_'+slug+'_'+i;
		var value = i;
		date.setTime( date.getTime() + 60 * 60 * 24 * 1000 );
		var expires = "; expires="+date.toGMTString(); // expires after 24 hours
		var expires = "; expires=Thu, 01 Jan 1970 00:00:00 UTC"; // For deleting cookie when testing

		// Set cookie
		document.cookie = name+"="+value+expires+"; path=/;";
	}

	// Toggle all topics
	function toggle_all(){
		//var self = this;
		var self = accordion_all_cta[0];

		// Set flags
		if (flag !== true) {
			flag = true;
		} else {
			flag = false;
		}

		for (i = 0; i < accordions.length; ++i) {
			//var self = this;

			if (flag === true) {		// open
				self.innerHTML = 'Close all';
				accordions[i].parentNode.classList.add('visible');
				accordions[i].style.height = accordions[i].scrollHeight + 'px';
				set_cookies(i, accordions[i].style.height);
			} else {														// close
				self.innerHTML = 'Open all';
				accordions[i].parentNode.classList.remove('visible');
				accordions[i].style.height = '0px';
				rem_cookies(i);
			}
		}
	};

	function toggle_single(index){
		var headers = document.getElementsByClassName('accordion-header');
		var elem = headers[index];

		var accordion_classes = elem.parentNode.className;
		rem_cookies(index);

		if ((accordion_classes.indexOf('visible')) === -1) {
			var sH = elem.nextElementSibling.scrollHeight;
			set_cookies(index, sH);
		}

		var self = elem;
		var accordions = document.querySelectorAll('.accordion');
		var accordion = self.parentNode;
		var accordions_inner = document.querySelectorAll('.accordion-inner');
		var accordion_inner = self.nextElementSibling;

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
	}

	// Toggle single topic - old version, deprecated for above
	// version, which adds support for IE8
	// function toggle_single(){
	// 	var self = elem;
	// 	var accordions = document.querySelectorAll('.accordion');
	// 	var accordion = self.parentNode;
	// 	var accordions_inner = document.querySelectorAll('.accordion-inner');
	// 	var accordion_inner = self.nextElementSibling;

	// 	// Remove classes
	// 	for (var i = 0; i < accordions.length; ++i) {
	// 		// Reset 'Open all'
	// 		flag = false;
	// 		accordion_all_cta[0].innerHTML = 'Open all';

	// 		// Add class
	// 		if ( accordion.className === 'accordion visible' ) {
	// 			accordion.classList.remove('visible');
	// 			accordion_inner.style.height = '0px';
	// 		} else { // Remove class
	// 			accordion.classList.add('visible');
	// 			accordion_inner.style.height = accordion_inner.scrollHeight + 'px';
	// 		}

	// 		var visible = document.querySelectorAll('.visible');

	// 		// Reset 'Close all'
	// 		if (accordions.length === ( visible.length) ) {
	// 			flag = true;
	// 			accordion_all_cta[0].innerHTML = 'Close all';
	// 		}
	// 	}
	// };
	
	init_accordion();

}).call(this);
