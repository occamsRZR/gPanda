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
(function(e){e.fn.optionTree=function(t,n){n=e.extend({choose:"Choose...",preselect:{},select_class:"",leaf_class:"final",empty_value:"",on_each_change:!1,set_value_on:"leaf",indexed:!1},n||{});var r=function(e){return e.replace(/_*$/,"")},i=function(t){e("select[name^='"+t+"']").remove()},s=function(t,n){e("input[name='"+r(t)+"']").val(n).change()},o=function(t){var r=this;e.getJSON(n.lazy_load,{id:t},function(i){for(var s in i)if(i.hasOwnProperty(s)){e(r).optionTree(i,n);return}e(r).optionTree(t,n)})};typeof n.on_each_change=="string"&&(n.lazy_load=n.on_each_change,n.on_each_change=o);var u=function(t,r){return!n.preselect||!n.preselect[t]?!1:e.isArray(n.preselect[t])?e.inArray(r,n.preselect[t])!=-1:n.preselect[t]==r};return this.each(function(){var o=e(this).attr("name")+"_";i(o);if(typeof t=="object"){var a=e("<select>").attr("name",o).change(function(){this.options[this.selectedIndex].value!=""?(e.isFunction(n.on_each_change)?(i(o+"_"),n.on_each_change.apply(this,[this.options[this.selectedIndex].value,t])):e(this).optionTree(t[this.options[this.selectedIndex].value],n),n.set_value_on=="each"&&s(o,this.options[this.selectedIndex].value)):(i(o+"_"),s(o,n.empty_value))}),f;e(this).is("input")?a.insertBefore(this):a.insertAfter(this);if(jQuery.isFunction(n.choose)){var l=e(this).siblings().andSelf().filter("select").length;f=n.choose.apply(this,[l])}else f=n.choose;n.select_class&&a.addClass(n.select_class),e("<option>").html(f).val("").appendTo(a);var c=!1;e.each(t,function(t,i){var s,f;n.indexed?(s=i,f=t):s=f=t;var l=e("<option>").html(s).attr("value",f),h=r(o);n.leaf_class&&typeof f!="object"&&l.addClass(n.leaf_class),l.appendTo(a),u(h,f)&&(l.get(0).selected=!0,c=!0)}),c&&a.change()}else n.set_value_on=="leaf"&&(n.indexed?s(o,this.options[this.selectedIndex].value):s(o,t))})}})(jQuery);