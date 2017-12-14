(function() {
if(!("nextElementSibling" in document.documentElement)){
    Object.defineProperty(Element.prototype, "nextElementSibling", {
        get: function(){
            var e = this.nextSibling;
            while(e && 1 !== e.nodeType)
                e = e.nextSibling;
            return e;
        }
    });
}
if (!document.getElementsByClassName) {
    var indexOf = [].indexOf || function(prop) {
        for (var i = 0; i < this.length; i++) {
            if (this[i] === prop) return i;
        }
        return -1;
    };
    getElementsByClassName = function(className, context) {
        var elems = document.querySelectorAll ? context.querySelectorAll("." + className) : (function() {
            var all = context.getElementsByTagName("*"),
                elements = [],
                i = 0;
            for (; i < all.length; i++) {
                if (all[i].className && (" " + all[i].className + " ").indexOf(" " + className + " ") > -1 && indexOf.call(elements, all[i]) === -1) elements.push(all[i]);
            }
            return elements;
        })();
        return elems;
    };
    document.getElementsByClassName = function(className) {
        return getElementsByClassName(className, document);
    };

    if(Element) {
        Element.prototype.getElementsByClassName = function(className) {
            return getElementsByClassName(className, this);
        };
    }
}
})();

!window.addEventListener && Element.prototype && (function (polyfill) {
    // window.addEventListener, document.addEventListener, <>.addEventListener
    // window.removeEventListener, document.removeEventListener, <>.removeEventListener

    function Event() { [polyfill] }

    Event.prototype.preventDefault = function () {
        this.nativeEvent.returnValue = false;
    };

    Event.prototype.stopPropagation = function () {
        this.nativeEvent.cancelBubble = true;
    };

    function addEventListener(type, listener, useCapture) {
        useCapture = !!useCapture;

        var cite = this;

        cite.__eventListener = cite.__eventListener || {};
        cite.__eventListener[type] = cite.__eventListener[type] || [[],[]];

        if (!cite.__eventListener[type][0].length && !cite.__eventListener[type][1].length) {
            cite.__eventListener['on' + type] = function (nativeEvent) {
                var newEvent = new Event, newNodeList = [], node = nativeEvent.srcElement || cite, property;

                for (property in nativeEvent) {
                    newEvent[property] = nativeEvent[property];
                }

                newEvent.currentTarget =  cite;
                newEvent.pageX = nativeEvent.clientX + document.documentElement.scrollLeft;
                newEvent.pageY = nativeEvent.clientY + document.documentElement.scrollTop;
                newEvent.target = node;
                newEvent.timeStamp = +new Date;

                newEvent.nativeEvent = nativeEvent;

                while (node) {
                    newNodeList.unshift(node);

                    node = node.parentNode;
                }

                for (var a, i = 0; (a = newNodeList[i]); ++i) {
                    if (a.__eventListener && a.__eventListener[type]) {
                        for (var aa, ii = 0; (aa = a.__eventListener[type][0][ii]); ++ii) {
                            aa.call(cite, newEvent);
                        }
                    }
                }

                newNodeList.reverse();

                for (var a, i = 0; (a = newNodeList[i]) && !nativeEvent.cancelBubble; ++i) {
                    if (a.__eventListener && a.__eventListener[type]) {
                        for (var aa, ii = 0; (aa = a.__eventListener[type][1][ii]) && !nativeEvent.cancelBubble; ++ii) {
                            aa.call(cite, newEvent);
                        }
                    }
                }

                nativeEvent.cancelBubble = true;
            };

            cite.attachEvent('on' + type, cite.__eventListener['on' + type]);
        }

        cite.__eventListener[type][useCapture ? 0 : 1].push(listener);
    }

    function removeEventListener(type, listener, useCapture) {
        useCapture = !!useCapture;

        var cite = this, a;

        cite.__eventListener = cite.__eventListener || {};
        cite.__eventListener[type] = cite.__eventListener[type] || [[],[]];

        a = cite.__eventListener[type][useCapture ? 0 : 1];

        for (eventIndex = a.length - 1, eventLength = -1; eventIndex > eventLength; --eventIndex) {
            if (a[eventIndex] == listener) {
                a.splice(eventIndex, 1)[0][1];
            }
        }

        if (!cite.__eventListener[type][0].length && !cite.__eventListener[type][1].length) {
            cite.detachEvent('on' + type, cite.__eventListener['on' + type]);
        }
    }

    window.constructor.prototype.addEventListener = document.constructor.prototype.addEventListener = Element.prototype.addEventListener = addEventListener;
    window.constructor.prototype.removeEventListener = document.constructor.prototype.removeEventListener = Element.prototype.removeEventListener = removeEventListener;
})();

(function() {
    // Helpers.
    var trim = function(s) {
            return s.replace(/^\s+|\s+$/g, '');
        },
        regExp = function(name) {
            return new RegExp('(^|\\s+)'+ name +'(\\s+|$)');
        },
        forEach = function(list, fn, scope) {
            for (var i = 0; i < list.length; i++) {
                fn.call(scope, list[i]);
            }
        };

    // Class list object with basic methods.
    function ClassList(element) {
        this.element = element;
    }

    ClassList.prototype = {
        add: function() {
            forEach(arguments, function(name) {
                if (!this.contains(name)) {
                    this.element.className = trim(this.element.className +' '+ name);
                }
            }, this);
        },
        remove: function() {
            forEach(arguments, function(name) {
                this.element.className = trim(this.element.className.replace(regExp(name), ' '));
            }, this);
        },
        toggle: function(name) {
            return this.contains(name) ? (this.remove(name), false) : (this.add(name), true);
        },
        contains: function(name) {
            return regExp(name).test(this.element.className);
        },
        item: function(i) {
            return this.element.className.split(/\s+/)[i] || null;
        },
        // bonus
        replace: function(oldName, newName) {
            this.remove(oldName), this.add(newName);
        }
    };

    // IE8/9, Safari
    // Remove this if statements to override native classList.
    if (!('classList' in Element.prototype)) {
    // Use this if statement to override native classList that does not have for example replace() method.
    // See browser compatibility: https://developer.mozilla.org/en-US/docs/Web/API/Element/classList#Browser_compatibility.
    // if (!('classList' in Element.prototype) ||
    //     !('classList' in Element.prototype && Element.prototype.classList.replace)) {
        Object.defineProperty(Element.prototype, 'classList', {
            get: function() {
                return new ClassList(this);
            }
        });
    }

    // For others replace() support.
    if (window.DOMTokenList && !DOMTokenList.prototype.replace) {
        DOMTokenList.prototype.replace = ClassList.prototype.replace;
    }
})();
