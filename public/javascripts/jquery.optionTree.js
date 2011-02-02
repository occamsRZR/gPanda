/*
 * jQuery optionTree Plugin
 * version: 1.2
 * @requires jQuery v1.3 or later
 *
 * Dual licensed under the MIT and GPL licenses:
 *   http://www.opensource.org/licenses/mit-license.php
 *   http://www.gnu.org/licenses/gpl.html
 *
 * @version $Id: jquery.optionTree.js 8 2010-10-06 08:48:31Z kkotowicz $
 * @author  Krzysztof Kotowicz <kkotowicz at gmail dot com>
 * @see http://code.google.com/p/jquery-option-tree/
 * @see http://blog.kotowicz.net/search/label/option
 */

/**
 * Converts passed JSON option tree into dynamically created <select> elements allowing you to
 * choose nested options.
 *
 * @param String tree options tree
 * @param array options additional options (optional)
 */
(function($){
$.fn.optionTree = function(tree, options) {

    options = $.extend({
        choose: 'Choose...', // string with text or function that will be passed current level and returns a string
        preselect: {},
        select_class: '',
        leaf_class: 'final',
        empty_value: '', // what value to set the input to if no valid option was selected
        on_each_change: false, // URL to lazy load (JSON, 'id' parameter will be added) or function. See deafult_lazy_load
        set_value_on: 'leaf', // leaf - sets input value only when choosing leaf node. 'each' - sets value on each level change.
                              // makes sense only then indexed=true
        indexed: false,
    }, options || {});

    var cleanName = function (name) {
        return name.replace(/_*$/, '');
    };

    var removeNested = function (name) {
        $("select[name^='"+ name + "']").remove();
    };

    var setValue = function(name, value) {
        $("input[name='" + cleanName(name) + "']").val(value).change();
    }

    // default lazy loading function
    var default_lazy_load = function(value) {
        var input = this;
        $.getJSON(options.lazy_load, {id: value}, function(tree) {
            for (var prop in tree) {
                if (tree.hasOwnProperty(prop)) { // tree not empty
                    $(input).optionTree(tree, options);
                    return;
                }
            }
            // tree empty, call value switch
            $(input).optionTree(value, options);
        });
    }

    if (typeof options.on_each_change == 'string') { // URL given as an onchange
        options.lazy_load = options.on_each_change;
        options.on_each_change = default_lazy_load;
    }

    var isPreselectedFor = function(clean, v) {
      if (!options.preselect || !options.preselect[clean])
        return false;

      if ($.isArray(options.preselect[clean])) {
        return $.inArray(v, options.preselect[clean]) != -1;
      }

      return (options.preselect[clean] == v);
    }

    return this.each(function() {
        var name = $(this).attr('name') + "_";

        // remove all dynamic options of lower levels
        removeNested(name);

        if (typeof tree == "object") { // many options exists for current nesting level

            // create select element with all the options
            // and bind onchange event to recursively call this function

            var $select = $("<select>").attr('name',name)
            .change(function() {
                if (this.options[this.selectedIndex].value != '') {
                    if ($.isFunction(options.on_each_change)) {
                      removeNested(name + '_');
                        options.on_each_change.apply(this, [this.options[this.selectedIndex].value, tree]);
                    } else {
                      // call with value as a first parameter
                        $(this).optionTree(tree[this.options[this.selectedIndex].value], options);
                    }
                    if (options.set_value_on == 'each') {
                      setValue(name, this.options[this.selectedIndex].value);
                    }
                } else {
                  removeNested(name + '_');
                    setValue(name, options.empty_value);
                }
            });

            var text_to_choose;

            if ($(this).is('input')) {
                $select.insertBefore(this);
            } else {
                $select.insertAfter(this);
            }

            if (jQuery.isFunction(options.choose)) {
                var level = $(this).siblings().andSelf().filter('select').length;
                text_to_choose = options.choose.apply(this, [level]);
            } else {
                text_to_choose = options.choose;
            }

            if (options.select_class)
                $select.addClass(options.select_class);

            $("<option>").html(text_to_choose).val('').appendTo($select);
            var foundPreselect = false;
            $.each(tree, function(k, v) {
                var label, value;
                if (options.indexed) {
                    label = v;
                    value = k;
                } else {
                    label = value = k;
                }
                var o = $("<option>").html(label)
                    .attr('value', value);
                var clean = cleanName(name);
                    if (options.leaf_class && typeof value != 'object') // this option is a leaf node
                        o.addClass(options.leaf_class);

                    o.appendTo($select);
                    if (isPreselectedFor(clean, value)) {
                      o.get(0).selected = true;
                      foundPreselect = true;
                    }
            });

            if (foundPreselect) {
              $select.change();
            }

        } else if (options.set_value_on == 'leaf') { // single option is selected by the user (function called via onchange event())
            if (options.indexed) {
                setValue(name, this.options[this.selectedIndex].value);
            } else {
                setValue(name, tree);
            }
        }
    });

}
})(jQuery);
