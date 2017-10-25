(function() {

	//Gives Containers equal heights, using the tallest height and applying it to the other containers

	//the function takes two arguments, the class of the container of all to-be-equalized containers, and the class of the containers themselves
	function equalizeContainers(containerClass, targetClass) {

		//Get all containers of to-be-equalized elements...
		var containerElements = document.getElementsByClassName(containerClass);

		//... and iterate through them
		for(var i = 0; i < containerElements.length; i++) {

			// (Re)set the variable for the height of the biggest elements
			var highestElement = 0;

			// Get all to-be-equalized elements within the container
			var targetElements = containerElements[i].getElementsByClassName(targetClass);

			//... and iterate through them
			for(var j = 0; j < targetElements.length; j++) {

				var currentTargetElement = targetElements[j];

				// Set height of the elements auto, so the new "natural" height can be detected
				currentTargetElement.style.height = "auto";

				// Get height of the element
				var currentElementHeight = currentTargetElement.offsetHeight;

				//Compare height of the element to the highest height. If it's higher, this is the new highest height
				if(currentElementHeight > highestElement) {
					highestElement = currentElementHeight;
				}
			}

			//Apply highest height to all to-be-equalized elements
			for(var j = 0; j < targetElements.length; j++) {
				targetElements[j].style.height = highestElement + "px";
			}

		}
	}

	//Do everything on load and on browser-resize

	window.onload = equalizeContainers('eh-container', 'eh-target');

	window.onresize = equalizeContainers('eh-container', 'eh-target');

}).call(this);
