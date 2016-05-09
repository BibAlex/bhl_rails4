/**
 * xslTransform
 * Tools for XSLT transformations; jQuery wrapper for Sarissa <http://sarissa.sourceforge.net/>.
 * See jQuery.fn.log below for documentation on $.log().
 * See jQuery.fn.getTransform below for documention on the $.getTransform().
 * See var DEBUG below for turning debugging/logging on and off.
 *
 * @version   20071203
 * @since     2006-07-05
 * @copyright Copyright (c) 2006 Glyphix Studio, Inc. http://www.glyphix.com
 * @author    Brad Brizendine <brizbane@gmail.com>, Matt Antone <antone@glyphix.com>
 * @license   MIT http://www.opensource.org/licenses/mit-license.php
 * @requires  >= jQuery 1.0.3			http://jquery.com/
 * @requires  jquery.debug.js			http://jquery.glyphix.com/
 * @requires  >= sarissa.js 0.9.7.6		http://sarissa.sourceforge.net/
 *
 * @example
 * var r = xslTransform.transform('path-to-xsl.xsl','path-to-xml.xml');
 * @desc Perform a transformation and place the results in var r
 *
 * @example
 * var r = xslTransform.transform('path-to-xsl.xsl','path-to-xml.xml');
 * var str = xslTransform.serialize( r );
 * @desc Perform a transformation, then turn the result into a string
 *
 * @example
 * var doc = xslTransform.load('path-to-xml.xml');
 * @desc Load an xml file and return a parsed xml object
 *
 * @example
 * var xml = '<xmldoc><foo>bar</foo></xmldoc>';
 * var doc = xslTransform.load(xml);
 * @desc Load an xml string and return a parsed xml object
 */
var xslTransform={version:20071203,debug:!1,init:function(){try{parseFloat(jQuery.fn.jquery)>=1}catch(r){alert("xslTransform requires jQuery 1.0.4 or greater ... please load it prior to xslTransform")}try{Sarissa}catch(r){alert("Missing Sarissa ... please load it prior to xslTransform")}jQuery.log||(jQuery.log=function(){},jQuery.fn.debug=function(){}),this.debug&&jQuery.log("xslTransform:init(): version "+xslTransform.version)},XMLSerializer:new XMLSerializer,serialize:function(r){return this.debug&&jQuery.log("serialize(): received "+typeof r),"string"==typeof r?r:this.XMLSerializer.serializeToString(r)},load:function(r,e){this.debug&&jQuery.log("load(): received "+typeof r);var t;return"object"==typeof r?r:(t="<"==r.substring(0,1)?this.loadString(r):this.loadFile(r,e),t?(t.setProperty("SelectionNamespaces",'xmlns:xsl="http://www.w3.org/1999/XSL/Transform"'),t.setProperty("SelectionLanguage","XPath"),t):(this.debug&&$.log("Unable to load "+r),!1))},loadString:function(r){this.debug&&jQuery.log("loadString(): "+r+"::"+typeof r);var e=new DOMParser,t=e.parseFromString(r,"text/xml");return t?t:(this.debug&&jQuery.log("loadString(): parseFromString() failed"),!1)},loadFile:function(r,e){if(this.debug&&jQuery.log("loadFile(): "+r+"::"+typeof r),!r)return this.debug&&jQuery.log("ERROR: loadFile() missing url"),!1;var t;return this.xhrsuccess=function(r,e){return this.debug&&jQuery.log("loadFile() completed successfully ("+e+")"),t=r,!0},this.xhrerror=function(r,e){return window.DEBUG=!0,this.debug&&jQuery.log("loadFile() failed to load the requested file: ("+e+") - xml: "+r.responseXML+" - text: "+r.responseText),t=null,!1},e||(e="GET"),$.ajax({type:e,url:r,async:!1,success:this.xhrsuccess,error:this.xhrerror}),t?0==t.length?(this.debug&&jQuery.log("ERROR: document "+r+" loaded in loadFile() has no data"),!1):t:(this.debug&&jQuery.log("ERROR: document "+r+" not found (404), or unable to load"),!1)},transform:function(r,e,t){this.debug&&jQuery.log("transform(): "+r+"::"+e+"::"+t.toString()),t=t||{};var e={request:e,doc:this.load(e,t.meth)};t.xpath&&e.doc&&!jQuery.browser.msie&&(e.doc=e.doc.selectSingleNode(t.xpath.toString()),this.debug&&$.log("transform(): xpath has been run...resulting doc: "+this.serialize(e.doc)));var s={xsl:this.load(r,t.meth)};s.json=!1,t.json&&e.doc&&(s.json=e.doc.selectSingleNode(t.json.toString()));var n=new XSLTProcessor;if(n.importStylesheet(s.xsl),t.params&&n){this.debug&&jQuery.log("transform(): received xsl params: "+t.params.toString());for(key in t.params)n.setParameter(null,key.toString(),t.params[key].toString())}s.doc=n.transformToDocument(e.doc);var o=Sarissa.getParseErrorText(s.doc);return this.debug&&jQuery.log("transform(): Sarissa parse text: "+o),o!=Sarissa.PARSED_OK?(s.string=Sarissa.getParseErrorText(s.doc)+" :: using "+r+" => "+e.request,this.debug&&jQuery.log("transform(): error in transformation: "+Sarissa.getParseErrorText(s.doc)),s):(s.string=this.serialize(s.doc),s.scripts=jQuery("script",s.doc).text(),s)}};xslTransform.init(),jQuery.fn.getTransform=function(xsl,xml,options){var settings={append:!1,params:{},xpath:"",eval:!0,callback:"",json:!1,meth:"GET"};return jQuery.extend(settings,options),xslTransform.debug&&jQuery.log("getTransform: "+xsl+"::"+xml+"::"+settings.toString()),xsl&&xml?this.each(function(){var trans=xslTransform.transform(xsl,xml,settings),re=trans.string.match(/<\?xml.*?\?>/);re&&(trans.string=trans.string.replace(re,""),xslTransform.debug&&jQuery.log("getTransform(): found an xml declaration and removed it"));try{settings.append?$(this).append(trans.string):settings.repl?$(this).replaceWith(trans.string):$(this).html(trans.string)}catch(e){xslTransform.debug&&$.log("getTransform: error placing results of transform into element, falling back to innerHTML: "+e.toString()),$(this)[0].innerHTML=trans.string}if(settings.eval&&trans.scripts&&trans.scripts.length>0&&(xslTransform.debug&&jQuery.log("Found text/javascript in transformed result"),eval.call(window,trans.scripts)),settings.callback&&jQuery.isFunction(settings.callback)){var json=!1;settings.json&&trans.json&&eval("json = "+trans.json.firstChild.data),settings.callback.apply(window,[trans.string,json])}}):void(xslTransform.debug&&jQuery.log("getTransform: missing xsl or xml"))};