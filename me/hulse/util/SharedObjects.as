package me.hulse.util {
	
	import flash.net.SharedObject;
	
	public class SharedObjects {
		
		// Public:
		public var _status:Boolean;
		
		// Private:
		private var _ft:FireTrace;
		private var _so:SharedObject;
		private var _name:String;
		private var _lastVisit:Number;
		
		/**
		* Cookie()
		*        About: Class constructor.
		*      Returns: Nothing.
		*/
		public function SharedObjects(n:String = "so") {
			
			_ft = new FireTrace();
			
			_ft.log('Cookie() instantiated...');
			
			_name = n;
			
			init();
			
		};
		
		/**
		* init()
		*        About: Initialize.
		*      Returns: Nothing.
		*/
		private function init():void {
			
			_so = SharedObject.getLocal(_name, "/");
			
		};
		
		/**
		* cookieCheck()
		*        About: Check if cookie has expired.
		*      Returns: Boolean, true (SO expired), false (SO not expired).
		*       @param: Number, milliseconds.
		*/
		public function cookieCheck(expireTime:Number = 600000):Boolean {
			
			// http://bit.ly/arqh4
			// 1 hour = 3600000
			// 10 minutes = 600000
			
			var r:Boolean = false;
			
			var created:Number = _so.data.created;
			var expires:Number = new Date().time - expireTime;
			
			if (created < expires) {
				
				_ft.log("SO expired...");
				
				r = true;
				
			} else {
				
				_ft.log("SO set to expire in " + Number((created - expires) / 1000 / 60).toPrecision(2) + " minutes...");
				
			}
			
			return r;
			
		};
		
		/**
		* cookieSet()
		*        About: Sets SO "created" property with current time value in milliseconds.
		*      Returns: Boolean, true (SO created), false (SO not created).
		*/
		public function cookieSet():Boolean {
			
			var r:Boolean = false;
			
			if (cookieExists() == false) {
				
				// If SO does not exist, create one:
				
				_ft.log("SO created...");
				
				_so.data.created = new Date().time;
				_so.flush();
				
				r = true;
				
			} else {
				
				// Cookies already exists.
				
				_ft.log("SO exists...");
				
			}
			
			return r;
			
		};
		
		/**
		* cookieExists()
		*        About: Checks to see if SO exists.
		*      Returns: Boolean, true (SO exists), false (SO does not exist).
		*/
		public function cookieExists():Boolean {
			
			return (_so.size > 0) ? true : false;
			
		};
		
		/**
		* cookieDelete()
		*        About: Deletes SO.
		*      Returns: Boolean, true (SO deleted), false (SO not deleted).
		*/
		public function cookieDelete():Boolean {
			
			var r:Boolean = false;
			
			if (cookieExists() == true) {
				
				_so.clear();
				
				r = true;
				
			} else {
				
				// Cookies already exists.
				
				_ft.log("No cookie to delete...");
				
			}
			
			return r;
			
		};
		
		/**
		* cookieStats()
		*        About: Returns SO statistics.
		*      Returns: Nothing.
		*/
		public function cookieStats():void {
			
			if (cookieExists() == true) {
				
				var ageMS:Number = new Date().time - _so.data.created;
				
				_ft.log("SharedObject was created " + Number(ageMS / 1000 / 60).toPrecision(2) + " minutes ago...");
				_ft.log("SharedObject is " + _so.size + " bytes...");
				
			} else {
				
				_ft.log("No cookie to gather statistics from...");
				
			}
			
		};
		
	};
	
};