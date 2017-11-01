(function() {

	var $site_search_el = document.getElementById('site-search-input'),
	    $people_search_el = document.getElementById('people-search-input'),
	    $events = [
	    	'click',
	    	'focus',
	    	'blur'
	    ];

	for(i = 0; i < $events.length; i++) {
		$site_search_el.addEventListener($events[i], function(){
			$value = $site_search_el.value;
			if($value !== '')
				$site_search_el.setAttribute('class', $site_search_el.getAttribute('class') + ' focus');
		});
		$people_search_el.addEventListener($events[i], function(){
			$value = $people_search_el.value;
			if($value !== '')
				$people_search_el.setAttribute('class', $people_search_el.getAttribute('class') + ' focus');
		});
	}

}).call(this);
