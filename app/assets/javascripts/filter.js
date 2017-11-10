var filters = document.getElementById('filter-search');

if(filters) {
  var filterBoxes = document.getElementsByClassName('legend'),
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
      presetThemesStr = getParameterByName('filter_themes');
  if (presetTypesStr) {
    var presetTypes = presetTypesStr.slice(0, -1).split(',');
    presetTypes.forEach(function(type){
      if(document.getElementById(type))
        document.getElementById(type).checked = true;
    });
  }
  if (presetNewsStr) {
    var presetNews = presetNewsStr.slice(0, -1).split(',');
    presetNews.forEach(function(news){
      if(document.getElementById(news))
        document.getElementById(news).checked = true;
    });
  }
  if (presetThemesStr) {
    var presetThemes = presetThemesStr.slice(0, -1).split(',');
    presetThemes.forEach(function(theme){
      if(document.getElementById(theme))
        document.getElementById(theme).checked = true;
    });
  }

  var inputs = document.getElementsByTagName("input"),
      checkboxes = [],
      types = [],
      news = [],
      themes = [],
      types_input = document.getElementById('filter_types'),
      news_input = document.getElementById('filter_news'),
      themes_input = document.getElementById('filter_themes');

  for(var i = 0; i < inputs.length; i++) {
    if(inputs[i].type == "checkbox") {
      checkboxes.push(inputs[i]);
    }
  }

  checkboxes.forEach(function(elem) {
      elem.addEventListener("change", function() {
          types = [];
          news = [];
          themes = [];
          checkboxes.forEach(function(elem) {
            if(elem.checked) {
              if(elem.name.includes('filter_types')) {
                types.push(elem.value);
              }
              if(elem.name.includes('filter_news')) {
                news.push(elem.value);
              }
              if(elem.name.includes('filter_themes')) {
                themes.push(elem.value);
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
            themes_input.value = '';
            for(i = 0; i < themes.length; i++) {
              themes_input.value += themes[i] + ',';
            }
          });
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
