﻿package me.hulse.util {
	
	import flash.display.DisplayObject;
	import flash.display.LoaderInfo;
	
	public class Params {
		
		// Private:
		private var _ft:FireTrace;
		private var _this:Object;
		
		/**
		* Params()
		*        About: Class constructor.
		*      Returns: Nothing.
		*       @param: this.
		*/
		public function Params(t:Object) {
			
			_ft = new FireTrace();
			
			_ft.log('Params() instantiated...');
			
			_this = t;
			
		};
		
		/**
		* getParam()
		*        About: Checks for embed parameters.
		*      Returns: Embeded parameter or a default value.
		*     @param01: String, parameter name.
		*     @param02: String, default parameter.
		*/
		public function getParam(p:String, d:String):String {
			
			_ft.log('getParam()...');
			
			var param:String = p; // Parameter name to check.
			var r:String = d; // Example of d: "default.swf"
			
			// LoaderInfo object:
			var paramObj:Object = LoaderInfo(_this.root.loaderInfo).parameters;
			
			// Log it:
			_ft.log('"' + param + '" ' + paramObj[param]);
			
			// Return parameter if it exists:
			if (paramObj[param]) {
				r = paramObj[param]; // Apply .toString() here, or on the variable in the calling class?
			}
			
			return r; // Return.
			
		};
		
	};
	
};