package me.hulse.util {
	
	import flash.display.LoaderInfo;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.external.ExternalInterface;
	
	public class ClickTag {
		
		// Private:
		private var _ft:FireTrace;
		private var _clickTagUrl:String;
		private var _this:Object;
		
		public function ClickTag(t:Object) {
			
			_ft = new FireTrace();
			
			_ft.log('ClickTag() instantiated...');
			
			_this = t;
			
			init();
			
		};
		
		private function init():void {
			
			// TODO: Use class: var p:Params = new Params(_this);
			for (var key:String in _this.loaderInfo.parameters) {
				if(key.toLowerCase() == "clicktag") {
					_clickTagUrl = _this.loaderInfo.parameters[key];
					break;
				}
			}
			
		};
		
		public function getURL():void {
			
			var window:String = "_blank";
			var url:String = _clickTagUrl;
			
			var broswer:String = ExternalInterface.call("function getBrowser(){return navigator.userAgent}") as String;
			if(broswer.indexOf("Firefox") != -1 || broswer.indexOf("MSIE 7.0") != -1) {
				ExternalInterface.call('window.open("' + url + '","' + window + '")');
			} else {
				navigateToURL(new URLRequest(url), window);
			}
			
		};
		
	};
	
};