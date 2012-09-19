// This [jQuery](http://jquery.com/) plugin implements an `<iframe>`
// [transport](http://api.jquery.com/extending-ajax/#Transports) so that
// `$.ajax()` calls support the uploading of files using standard HTML file
// input fields. This is done by switching the exchange from `XMLHttpRequest` to
// a hidden `iframe` element containing a form that is submitted.
// The [source for the plugin](http://github.com/cmlenz/jquery-iframe-transport)
// is available on [Github](http://github.com/) and dual licensed under the MIT
// or GPL Version 2 licenses.
// ## Usage
// To use this plugin, you simply add a `iframe` option with the value `true`
// to the Ajax settings an `$.ajax()` call, and specify the file fields to
// include in the submssion using the `files` option, which can be a selector,
// jQuery object, or a list of DOM elements containing one or more
// `<input type="file">` elements:
//     $("#myform").submit(function() {
//         $.ajax(this.action, {
//             files: $(":file", this),
//             iframe: true
//         }).complete(function(data) {
//             console.log(data);
//         });
//     });
// The plugin will construct a hidden `<iframe>` element containing a copy of
// the form the file field belongs to, will disable any form fields not
// explicitly included, submit that form, and process the response.
// If you want to include other form fields in the form submission, include them
// in the `data` option, and set the `processData` option to `false`:
//     $("#myform").submit(function() {
//         $.ajax(this.action, {
//             data: $(":text", this).serializeArray(),
//             files: $(":file", this),
//             iframe: true,
//             processData: false
//         }).complete(function(data) {
//             console.log(data);
//         });
//     });
// ### The Server Side
// If the response is not HTML or XML, you (unfortunately) need to apply some
// trickery on the server side. To send back a JSON payload, send back an HTML
// `<textarea>` element with a `data-type` attribute that contains the MIME
// type, and put the actual payload in the textarea:
//     <textarea data-type="application/json">
//       {"ok": true, "message": "Thanks so much"}
//     </textarea>
// The iframe transport plugin will detect this and attempt to apply the same
// conversions that jQuery applies to regular responses. That means for the
// example above you should get a Javascript object as the `data` parameter of
// the `complete` callback, with the properties `ok: true` and
// `message: "Thanks so much"`.
// ### Compatibility
// This plugin has primarily been tested on Safari 5, Firefox 4, and Internet
// Explorer all the way back to version 6. While I haven't found any issues with
// it so far, I'm fairly sure it still doesn't work around all the quirks in all
// different browsers. But the code is still pretty simple overall, so you
// should be able to fix it and contribute a patch :)
// ## Annotated Source
(function(e,t){e.ajaxPrefilter(function(e,t,n){if(e.iframe)return"iframe"}),e.ajaxTransport("iframe",function(t,n,r){function h(){e(f).each(function(){this.remove()}),e(l).each(function(){this.disabled=!1}),i.attr("action",o||"").attr("target",u||"").attr("enctype",a||""),s.attr("src","javascript:false;").remove()}var i=null,s=null,o=null,u=null,a=null,f=[],l=[],c=e(t.files).filter(":file:enabled");t.dataTypes.shift();if(c.length)return c.each(function(){i!==null&&this.form!==i&&jQuery.error("All file fields must belong to the same form"),i=this.form}),i=e(i),o=i.attr("action"),u=i.attr("target"),a=i.attr("enctype"),i.find(":input:not(:submit)").each(function(){!this.disabled&&(this.type!="file"||c.index(this)<0)&&(this.disabled=!0,l.push(this))}),typeof t.data=="string"&&t.data.length>0&&jQuery.error("data must not be serialized"),e.each(t.data||{},function(t,n){e.isPlainObject(n)&&(t=n.name,n=n.value),f.push(e("<input type='hidden'>").attr("name",t).attr("value",n).appendTo(i))}),f.push(e("<input type='hidden' name='X-Requested-With'>").attr("value","IFrame").appendTo(i)),accepts=t.dataTypes[0]&&t.accepts[t.dataTypes[0]]?t.accepts[t.dataTypes[0]]+(t.dataTypes[0]!=="*"?", */*; q=0.01":""):t.accepts["*"],f.push(e("<input type='hidden' name='X-Http-Accept'>").attr("value",accepts).appendTo(i)),{send:function(n,r){s=e("<iframe src='javascript:false;' name='iframe-"+e.now()+"' style='display:none'></iframe>"),s.bind("load",function(){s.unbind("load").bind("load",function(){var e=this.contentWindow?this.contentWindow.document:this.contentDocument?this.contentDocument:this.document,t=e.documentElement?e.documentElement:e.body,n=t.getElementsByTagName("textarea")[0],i=n?n.getAttribute("data-type"):null,s=n?parseInt(n.getAttribute("response-code")):200,o="OK",u={text:i?n.value:t?t.innerHTML:null},a="Content-Type: "+(i||"text/html");r(s,o,u,a),setTimeout(h,50)}),i.attr("action",t.url).attr("target",s.attr("name")).attr("enctype","multipart/form-data").get(0).submit()}),s.insertAfter(i)},abort:function(){s!==null&&(s.unbind("load").attr("src","javascript:false;"),h())}}})})(jQuery);