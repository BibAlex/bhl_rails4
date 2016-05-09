/* * ====================================================================
 * About: This a a compressed JS file from the Sarissa library. 
 * see http://dev.abiss.gr/sarissa
 * 
 * Copyright: Manos Batsis, http://dev.abiss.gr
 * 
 * Licence:
 * Sarissa is free software distributed under the GNU GPL version 2 
 * or higher, GNU LGPL version 2.1 or higher and Apache Software 
 * License 2.0 or higher. The licenses are available online see: 
 * http://www.gnu.org  
 * http://www.apache.org
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY 
 * KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE 
 * WARRANTIES OF MERCHANTABILITY,FITNESS FOR A PARTICULAR PURPOSE 
 * AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR 
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR 
 * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
 * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 * ====================================================================*/
Sarissa._SARISSA_HAS_DOM_FEATURE&&document.implementation.hasFeature("XPath","3.0")&&(SarissaNodeList=function(e){this.length=e},SarissaNodeList.prototype=[],SarissaNodeList.prototype.constructor=Array,SarissaNodeList.prototype.item=function(e){return 0>e||e>=this.length?null:this[e]},SarissaNodeList.prototype.expr="",window.XMLDocument&&!XMLDocument.prototype.setProperty&&(XMLDocument.prototype.setProperty=function(e,t){}),Sarissa.setXpathNamespaces=function(e,t){e._sarissa_useCustomResolver=!0;var s=t.indexOf(" ")>-1?t.split(" "):[t];e._sarissa_xpathNamespaces=[];for(var o=0;o<s.length;o++){var r=s[o],a=r.indexOf(":"),n=r.indexOf("=");if(!(a>0&&n>a+1))throw"Bad format on namespace declaration(s) given";var i=r.substring(a+1,n),l=r.substring(n+2,r.length-1);e._sarissa_xpathNamespaces[i]=l}},XMLDocument.prototype._sarissa_useCustomResolver=!1,XMLDocument.prototype._sarissa_xpathNamespaces=[],XMLDocument.prototype.selectNodes=function(e,t,s){var o,r=this;o=this._sarissa_useCustomResolver?function(e){var t=r._sarissa_xpathNamespaces[e];if(t)return t;throw"No namespace URI found for prefix: '"+e+"'"}:this.createNSResolver(this.documentElement);var a=null;if(s)a=this.evaluate(e,t?t:this,o,XPathResult.FIRST_ORDERED_NODE_TYPE,null).singleNodeValue;else{var n=this.evaluate(e,t?t:this,o,XPathResult.ORDERED_NODE_SNAPSHOT_TYPE,null),i=new SarissaNodeList(n.snapshotLength);i.expr=e;for(var l=0;l<i.length;l++)i[l]=n.snapshotItem(l);a=i}return a},Element.prototype.selectNodes=function(e){var t=this.ownerDocument;if(t.selectNodes)return t.selectNodes(e,this);throw"Method selectNodes is only supported by XML Elements"},XMLDocument.prototype.selectSingleNode=function(e,t){var s=t?t:null;return this.selectNodes(e,s,!0)},Element.prototype.selectSingleNode=function(e){var t=this.ownerDocument;if(t.selectSingleNode)return t.selectSingleNode(e,this);throw"Method selectNodes is only supported by XML Elements"},Sarissa.IS_ENABLED_SELECT_NODES=!0);