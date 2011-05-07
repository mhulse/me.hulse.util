package me.hulse.util {
	
	// Imports:
	import flash.external.ExternalInterface;
	
	/**
	* FireTrace
	*        About: Logs traced output to Firebug console.
	*               You need to have the Flash debug player installed:
	*               http://www.adobe.com/support/flashplayer/downloads.html
	*/
	public class FireTrace {
		
		// Private:
		private var _result:Object;
		private var _available:Boolean;
		
		/**
		* FireTrace()
		*        About: Class constructor.
		*      Returns: Nothing.
		*/
		public function FireTrace() {
			
			// Initialize:
			init();
			
		};
		
		/**
		* init()
		*        About: Initialize class.
		*      Returns: Nothing.
		*/
		private function init():void {
			
			log('Debugger init()');
			
			/*
			** 
			** ExternalInterface.available
			** 
			** This read-only property returns a Boolean value.
			** If the property returns a false value, you'll have to use an alternative method of communicating with the container 
			** or let the user know that some functionality is unavailable using their current Flash Player.
			** This read-only property returns a Boolean value. If the property returns a false value, 
			** you'll have to use an alternative method of communicating with the container or let the 
			** user know that some functionality is unavailable using their current Flash Player.
			** 
			** -- Object Oriented Actionscript, pg. 482
			** 
			*/
			_available = ExternalInterface.available;
			
		};
		
		/**
		* log()
		*        About: Traces parameter to Flash and FireBug.
		*               http://getfirebug.com/
		*      Returns: ExternalInterface call to FireBug.
		*               The output is a string.
		*               If not a string, the "type" is also included.
		*       @param: Anything.
		*/
		public function log(e:*):void {
			
			// Get object type:
			var type = typeof(e);
			
			// If type is not a string, let's show it:
			type = (type !== 'string') ? (' <--(' + type + ')'): '';
			
			// Send trace to Flash IDE:
			trace(e + type);
			
			// If ExternalInterface is available:
			if (_available) {
				
				// Output to the Firebug console:
				_result = ExternalInterface.call('console.log', e.toString() + type);
				
			}
			
		};
		
	};
	
};