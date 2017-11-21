(function(){
  
  	// Set some variables
	var feedback_container_length = document.getElementsByClassName('feedback_container').length;

	var feedback_cta = document.querySelectorAll('#feedbackToggle');
	var feedback_length = feedback_cta.length;

	var flag = null;

	// Initialise
	function init_accordion(){
		if (feedback_container_length !== 0 || feedback_container_length > 0) {
			feedback_events();
		} else {
			return;
		}
	}

	// Events
	function feedback_events(){
		// Open single
		for (var i =0; i < feedback_length; i++) {
			feedback_cta[i].addEventListener('click', toggle_feedback, false);
		}
	}

	// Toggle single topic
	function toggle_feedback(){
		var self = this;
		var fb_forms = document.querySelectorAll('.feedback_container');
		var feedback = self.parentNode;
		var feedback_inner = self.nextElementSibling;

		// Remove classes
		for (i = 0; i < fb_forms.length; ++i) {

			// Reset 'Open all'
			flag = false;

			// Add class
			if ( feedback.className === 'feedback_container visible' ) {
				feedback.classList.remove('visible');
				feedback_inner.style.height = '0px';
				self.classList.remove('open');
			} else { // Remove class
				feedback.classList.add('visible');
				feedback_inner.style.height = feedback_inner.scrollHeight + 'px';
				self.classList.add('open');
			}

			var visible = document.querySelectorAll('.visible');

		}
	};

	init_accordion();

}).call(this);
