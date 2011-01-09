package me.hulse.util {
	
	import flash.external.ExternalInterface;
	
	public class HttpCookie {
		
		// Private:
		private var _ft:FireTrace;
		private var _targ:String;
		private var _allowed:Boolean;
		private var _id:String;
		private var _name:String;
		
		public function HttpCookie(t:String = '') {
			
			_ft = new FireTrace();
			
			_targ = t;
			
			init();
			
		};
		
		private function init():void {
			
			_ft.log('HttpCookie() init()');
			
			/*
			** 
			** ExternalInterface.available
			** 
			** This read-only property returns a Boolean value.
			** If the property returns a falsevalue, you’ll have to use an alternative method of communicating with the container 
			** or let the user know that some functionality is unavailable using their current Flash Player.
			** This read-only property returns a Boolean value. If the property returns a false value, 
			** you’ll have to use an alternative method of communicating with the container or let the 
			** user know that some functionality is unavailable using their current Flash Player.
			** 
			** -- Object Oriented Actionscript, pg. 482
			** 
			*/
			_allowed = ExternalInterface.available;
			
			_id = ExternalInterface.objectID; // Not reliable.
			
			nameCookie(_targ);
			
		};
		
		private function nameCookie(t:String):void {
			
			_ft.log('nameCookie(' + t + ')');
			
			_name = ExternalInterface.call("nameCookie", t);
			
		}
		
		public function checkCookie(key:String):Boolean {
			
			_ft.log('getCookie()');
			
			return ExternalInterface.call("checkCookie", key);
			
		};
		
		public function setCookie(key:String, val:*):void {
			
			_ft.log('setCookie()');
			
			ExternalInterface.call("setCookie", key, val);
			
		};
		
		public function getCookie(key:String):String {
			
			_ft.log('getCookie()');
			
			return ExternalInterface.call("getCookie", key);
			
		};
		
		//----------------------------------
		//  getters
		//----------------------------------
		
		public function get name():String {
			
			return _name;
			
		};
		
		public function get allowed():Boolean {
			
			return _allowed;
			
		};
		
		public function get id():String {
			
			return _id;
			
		};
		
	};
	
};