﻿package me.hulse.util {
	
	// Imports:
	import flash.net.LocalConnection;
	
	/**
	 * LockDown2 Class
	 * Class used to lockdown swf to a particular set of hosts.
	 * 
	 * @package          me.hulse.util
	 * @author           Micky Hulse
	 * @link             http://hulse.me/
	 * @dependancies     1) me.hulse.util.FireTrace, 2) me.hulse.util.ArrayHelpers
	 */
	
	public class LockDown2 {
		
		// Constants:
		public static var CLASS_REF = me.hulse.util.LockDown2;
		public static var CLASS_NAME : String = 'LockDown2';
		public static var LINKAGE_ID : String = 'me.hulse.util.LockDown2';
		
		// Private:
		private var _ft:FireTrace;
		private var _ah:ArrayHelpers;
		private var _allowed:Array;
		private var _domain:String;
		private var _host:String;
		private var _unlocked:Boolean;
		
		/**
		 * Constructor
		 * 
		 * @access     public
		 * @param      array ['domain1.com', 'domain2.com', 'domain3.com', 'foo.com']
		 * @return     void
		 */
		
		public function LockDown2($a:Array) {
			
			_ft = new FireTrace();
			
			_ft.log('LockDown() instantiated...');
			
			_ah = new ArrayHelpers();
			
			_allowed = $a;
			
			init(); // Begin program.
			
		};
		
		/**
		 * Init
		 * Initializes program.
		 * 
		 * @access     private
		 * @return     void
		 */
		
		private function init():void {
			
			_domain = (new LocalConnection()).domain;
			
			_ft.log('Domain: ' + _domain);
			
			// Add localhost and 127.0.0.1 to be able to run locally:
			_allowed.push('localhost');
			_allowed.push('127.0.0.1');
			
			// Determine unlock mode:
			_unlocked = (_ah.inArray(_domain, _allowed)) ? true : false;
			
		};
		
		//----------------------------------
		//  getters
		//----------------------------------
		
		/**
		 * Domain (getter)
		 * Returns domain as provided by LocalConnection().
		 * 
		 * @access     public
		 * @return     string
		 */
		
		public function get domain():String {
			return _domain;
		};
		
		/**
		 * Unlocked (getter)
		 * Boolean value to determine if domain is allowed.
		 * 
		 * @access     public
		 * @return     boolean
		 */
		
		public function get unlocked():Boolean {
			return _unlocked;
		};
		
	};
	
};