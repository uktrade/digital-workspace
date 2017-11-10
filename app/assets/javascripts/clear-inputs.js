(function() {

	var search_element_el = document.getElementsByClassName('search-element');

	if (!search_element_el.length) {
		return;
	}

	for(i = 0; i < search_element_el.length; i++) {
		
		var self = search_element_el[i];
		var input_value = self.value
		if(input_value)
		  self.classList.add('focus');
		console.log(input_value);

		search_element_el[i].addEventListener('click', function(){
			var self = this;
			var input_value = self.value
			self.classList.add('focus');
		});

		search_element_el[i].addEventListener('focus', function(){
			var self = this;
			var input_value = self.value

			self.classList.add('focus');
		});

		search_element_el[i].addEventListener('blur', function(){
			var self = this;
			var input_value = self.value

			if (input_value !== '') {
				console.log('blur add class');
				self.classList.add('focus');
			} else {
				console.log('blur remove class');
				self.classList.remove('focus');
			}
		});
	}

}).call(this);
