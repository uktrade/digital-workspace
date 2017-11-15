var filters = document.getElementById('filter-search');

if(filters) {
  var filterBoxes = document.querySelectorAll('.controls, .legend'),
      removeFiltersLinks = document.getElementsByClassName('clear-selected');
      
  for (var i = 0; i < filterBoxes.length; i++) {
    filterBoxes[i].addEventListener("click", function() {
      var headEl = this;
      var thisClasses = headEl.parentNode.parentNode.className;
      if(thisClasses.indexOf('closed') > 0) {
        var newClass = thisClasses.replace(' closed', '');
        headEl.parentNode.parentNode.className = newClass;
      } else {
        var newClass = thisClasses + ' closed';
        headEl.parentNode.parentNode.className = newClass;
      }
    });
  };

  for (var i = 0; i < removeFiltersLinks.length; i++) {
    removeFiltersLinks[i].addEventListener("click", function(){
      var inputs = document.getElementsByTagName("input");
      for(var i = 0; i < inputs.length; i++) {
        if(inputs[i].type == "checkbox") {
          inputs[i].checked = false;
          filters.submit();
        }
      }
    });
  }

  var presetTypesStr = getParameterByName('filter_types'),
      presetNewsStr = getParameterByName('filter_news'),
      presetTopicsStr = getParameterByName('filter_topics');
  if (presetTypesStr) {
    var presetTypes = presetTypesStr.slice(0, -1).split(',');
    presetTypes.forEach(function(type){
      if(document.getElementById(type))
        document.getElementById(type).checked = true;
    });
    if(presetTypes.length > 0) {
      show_remove_filters(removeFiltersLinks);
      document.getElementById('filters_types').className = document.getElementById('filters_types').className.replace(' closed', '');
    }
  }
  if (presetNewsStr) {
    var presetNews = presetNewsStr.slice(0, -1).split(',');
    presetNews.forEach(function(news){
      if(document.getElementById(news))
        document.getElementById(news).checked = true;
    });
    if(presetNews.length > 0) {
      show_remove_filters(removeFiltersLinks);
      document.getElementById('filters_news').className = document.getElementById('filters_news').className.replace(' closed', '');
    }
  }
  if (presetTopicsStr) {
    var presetTopics = presetTopicsStr.slice(0, -1).split(',');
    presetTopics.forEach(function(topic){
      if(document.getElementById(topic))
        document.getElementById(topic).checked = true;
    });
    if(presetTopics.length > 0) {
      show_remove_filters(removeFiltersLinks);
      document.getElementById('filters_topics').className = document.getElementById('filters_topics').className.replace(' closed', '');
    }
  }

  function show_remove_filters(removeFiltersLinks, ){
    for (var i = 0; i < removeFiltersLinks.length; i++) {
      var inputName = removeFiltersLinks[i].getAttribute('name'),
          thisCheckboxes = document.querySelectorAll('[name=' + inputName + ']'),
          checkedEls = [];
      thisCheckboxes.forEach(function(elem){
        if (elem.checked == true) {
          checkedEls.push(elem);
        }
      });
      if (checkedEls.length > 0) {
        removeFiltersLinks[i].classList.remove('js-hidden');
      } else {
        removeFiltersLinks[i].classList.add('js-hidden');
      }
    }
  }

  var inputs = document.getElementsByTagName("input"),
      checkboxes = [],
      types = [],
      news = [],
      topics = [],
      types_input = document.getElementById('filter_types'),
      news_input = document.getElementById('filter_news'),
      topics_input = document.getElementById('filter_topics');

  for(var i = 0; i < inputs.length; i++) {
    if(inputs[i].type == "checkbox") {
      checkboxes.push(inputs[i]);
    }
  }

  checkboxes.forEach(function(elem) {
      elem.addEventListener("change", function() {
          types = [];
          news = [];
          topics = [];
          checkboxes.forEach(function(elem) {
            if(elem.checked) {
              if(elem.name.includes('filter_types')) {
                types.push(elem.value);
              }
              if(elem.name.includes('filter_news')) {
                news.push(elem.value);
              }
              if(elem.name.includes('filter_topics')) {
                topics.push(elem.value);
              }
            }

            types_input.value = '';
            for(i = 0; i < types.length; i++) {
              types_input.value += types[i] + ',';
            }
            news_input.value = '';
            for(i = 0; i < news.length; i++) {
              news_input.value += news[i] + ',';
            }
            topics_input.value = '';
            for(i = 0; i < topics.length; i++) {
              topics_input.value += topics[i] + ',';
            }
          });
          show_remove_filters(removeFiltersLinks);
          filters.submit();
      });
  });
}

function getParameterByName(name, url) {
  if (!url) url = window.location.href;
  name = name.replace(/[\[\]]/g, "\\$&");
  var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
      results = regex.exec(url);
  if (!results) return null;
  if (!results[2]) return '';
  return decodeURIComponent(results[2].replace(/\+/g, " "));
}
