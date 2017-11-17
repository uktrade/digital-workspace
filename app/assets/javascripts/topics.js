(function() {

	// Set some variables
	var toggle_cta = document.getElementsByClassName("topic-toggle");
	var toggle_length = toggle_cta.length;
	var flag = null;

	// Initialise
	function init_topics(){
		
		if (typeof(toggle_cta) != 'undefined' && toggle_cta != null) {
			topics_events();
			get_cookies();
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
			set_cookies(self.id, container.style.height);
			self.wait = setTimeout( function (){
				self.parentNode.parentNode.classList.add('in');
				clearTimeout(self.wait);
			}, 100);
		} else {				// close
			self.parentNode.parentNode.classList.remove('visible');
			container.style.height = '0px';
			self.innerHTML = 'View more';
			self.flag = false;
			rem_cookies(self.id);
			self.wait = setTimeout( function (){
				self.parentNode.parentNode.classList.remove('in');
				clearTimeout(self.wait);
			}, 100);
		}
	};

	function set_cookies(i, height) {
		// Cookies
		var date = new Date();
		var slug = (window.location.pathname).replace(/\//g, '');
		var name = 'accordion_topics_'+slug+'_'+i;
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
		var pattern_a = /accordion_topics_(\d*)/;
		// var pattern_a = /^((?!accordion_single_selection_).)*$/;
		var selections_array = [];

		// Collect selections
		for (i = 0; i < key_val_pairs.length; ++i) {
			var result = pattern_a.test(key_val_pairs[i]);
			if (result === true) {
				if(key_val_pairs[i].includes(slug)){
					var values = key_val_pairs[i].split('=');
					var valuesArr = values[1].split('sh-');
					var number = valuesArr[0];
					var selected = number;
					var height = valuesArr[1];
					if(height.indexOf('px') < 0) {
						height = height + 'px';
					}
					var element = document.getElementById(selected);
					var container = element.parentNode.parentNode.querySelector(':scope > .topics-list-extra');
					element.parentNode.parentNode.classList.add('visible');
					container.style.height = height;
					element.innerHTML = 'View less';
					element.flag = true;
					element.wait = setTimeout( function (){
						element.parentNode.parentNode.classList.add('in');
						clearTimeout(element.wait);
					}, 100);
				}
			}
		}
	}

	function rem_cookies(i) {
		// Cookies
		var date = new Date();
		var slug = (window.location.pathname).replace(/\//g, '');
		var name = 'accordion_topics_'+slug+'_'+i;
		var value = i;
		date.setTime( date.getTime() + 60 * 60 * 24 * 1000 );
		var expires = "; expires="+date.toGMTString(); // expires after 24 hours
		var expires = "; expires=Thu, 01 Jan 1970 00:00:00 UTC"; // For deleting cookie when testing

		// Set cookie
		document.cookie = name+"="+value+expires+"; path=/;";
	}

	init_topics();

}).call(this);
