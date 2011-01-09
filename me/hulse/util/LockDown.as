﻿package me.hulse.util {
	
	// Imports:
	import flash.external.ExternalInterface;
	
	/**
	* LockDown
	*        About: Class used to lockdown swf to a particular set of hosts.
	*/
	public class LockDown {
		
		// Private:
		private var _ft:FireTrace;
		private var _sh:StringHelpers;
		private var _allowed:Array;
		private var _uri:String;
		private var _host:String;
		private var _unlocked:Boolean;
		
		/**
		* LockDown()
		*        About: Class constructor.
		*      Returns: Nothing.
		*       @param: Array.
		*               Valid and allowed domain names.
		*               Example: ['domain1.com', 'domain2.com', 'domain3.com', 'foo.com']
		*/
		public function LockDown(a:Array) {
			
			_ft = new FireTrace();
			
			_ft.log('LockDown() instantiated...');
			
			_sh = new StringHelpers();
			
			_allowed = a;
			
			init(); // Begin program.
			
		};
		
		/**
		* init()
		*        About: Setup getter variables.
		*      Returns: Nothing.
		*/
		private function init():void {
			
			// http://www.kirupa.com/forum/showpost.php?p=2478313&postcount=11
			_uri = ExternalInterface.call("eval", "document.location.href"); // One could also use "document.domain".
			
			if (_uri != null) {
				
				// Get the host name:
				_host = _sh.parseUri(_uri);
				
				_ft.log(_host);
				
				// Determine unlock mode:
				_unlocked = (inArray(_allowed, _host)) ? true : false;
				
			}
			
		};
		
		/**
		* inArray()
		*        About: Utility function.
		*               Checks for existance of string in array.
		*      Returns: Nothing.
		*/
		private function inArray(a:Array, s:String):Boolean {
			
			var r:Boolean = false;
			
			for each (var x:* in a) {
				if (_sh.trim(x, ' ') == s) {
					r = true;
					break;
				}
			}
			
			return r; // true/false
			
		};
		
		//----------------------------------
		//  getters
		//----------------------------------
		
		/**
		* uri()
		*        About: Getter.
		*      Returns: String.
		*               The current uri as provided by JS.
		*/
		public function get uri():String {
			return _uri;
		};
		
		/**
		* host()
		*        About: Getter.
		*      Returns: String.
		*               Just the host name.
		*/
		public function get host():String {
			return _host;
		};
		
		/**
		* unlocked()
		*        About: Getter.
		*      Returns: Boolean.
		*               Use to check domain validation.
		*/
		public function get unlocked():Boolean {
			return _unlocked;
		};
		
	};
	
};