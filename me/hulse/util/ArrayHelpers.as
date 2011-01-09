package me.hulse.util {
	
	import me.hulse.util.StringHelpers;
	
	public class ArrayHelpers {
		
		private var _sh:StringHelpers;
		
		public function ArrayHelpers() {
			
			_sh = new StringHelpers();
			
		};
		
		/**
		 * Checks for existence of string in array.
		 * 
		 * @access	   private
		 * @param      array
		 * @param      string
		 * @return     boolean
		 */
		
		public function inArray($needle:String, $haystack:Array):Boolean {
			
			var r:Boolean = false;
			
			for(var i:Number = 0; i < $haystack.length; i++) {
				
				if (r = ($needle.toLowerCase().indexOf($haystack[i].toString().toLowerCase()) > -1) ? true : false) break;
				
			}
			
			return r;
			
		};
		
		/**
		 * Inarray
		 * Checks for existence of string in array.
		 * 
		 * @access	   private
		 * @param      array
		 * @param      string
		 * @return     boolean
		 */
		
		// Don't use. Combine with above and use parameter "strict" boolean.
		public function inArrayStrict($needle:String, $haystack:Array):Boolean {
			
			var r:Boolean = false;
			
			for each (var x:* in $haystack) {
				if (_sh.trim(x, ' ') == $needle) {
					r = true;
					break;
				}
			}
			
			return r; // true/false
			
		};
		
	};
	
};