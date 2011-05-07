package me.hulse.util {
	
	public class StringHelpers {
		
		/*
		** 
		** These next four methods are straight from the docs:
		** http://livedocs.adobe.com/flash/9.0/ActionScriptLangRefV3/String.html
		** In a future version, I might want to make a string utility class.
		** 
		*/
		
		public function StringHelpers() {}
		
		public function trim(s:String, c:String):String {
			
        	return trimBack(trimFront(s, c), c);
			
		};
		
		public function trimFront(s:String, c:String):String {
			
			c = stringToCharacter(c);
			
			if (s.charAt(0) == c) {
				s = trimFront(s.substring(1), c);
			}
			
			return s;
			
		};
		
		public function trimBack(s:String, c:String):String {
			
			c = stringToCharacter(c);
			
			if (s.charAt(s.length - 1) == c) {
				s = trimBack(s.substring(0, s.length - 1), c);
			}
			
			return s;
			
		};
		
		public function stringToCharacter(s:String):String {
			
			if (s.length == 1) {
				return s;
			}
			
			return s.slice(0, 1);
			
		};
		
		/**
		* parseUri()
		*        About: Parses a uri.
		*      Returns: String.
		*               If found, the host name.
		*       @param: String.
		*               A valid uri.
		*        Notes: Thanks wvxvw!!!
		*/
		public function parseUri(s:String):String {
			
			// http://www.kirupa.com/forum/showthread.php?t=329890
			var regex:RegExp = /([^\.\/]+)\.([^\.\/]+)(?=\/|$)/g;
			
			return s.match(regex)[0];
			
		};
		
	};
	
};