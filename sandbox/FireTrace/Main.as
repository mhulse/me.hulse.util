package {
	
	// Imports:
	import flash.display.MovieClip;
	
	// Custom classes:
	import me.hulse.util.FireTrace;
	
	/**
	* Main
	*        About: Document class.
	*/
	public class Main extends MovieClip {
		
		// Private:
		private var _ft:FireTrace;
		
		/**
		* Main()
		*        About: Class constructor.
		*      Returns: Nothing.
		*/
		public function Main() {
			
			_ft = new FireTrace();
			
			_ft.log('Main() instantiated...');
			
			// int vs. uint vs. Number:
			// http://www.actionscript.org/forums/showpost.php3?p=514414&postcount=5
			
			var a:Array;    // object
			var b:Boolean;  // boolean
			var c:Function; // function
			var d:int;      // number
			var e:Number;   // number
			var f:Object;   // object
			var g:String;   // string
			var h:uint;     // number
			var i:XML;      // xml
			var j:XMLList;  // xml
			
			_ft.log('----- a -----');
			a = new Array('foo', 'bar', 'bing', 'bang', 'baz', 22, -468, new Array('a', 'b', 'c'));
			_ft.log(a);
			
			_ft.log('----- b -----');
			b = true;
			_ft.log(b);
			
			_ft.log('----- c -----');
			c = test;
			// Note: See "g" below.
			_ft.log(c);
			
			_ft.log('----- d -----');
			d = Math.floor(Math.random() * 100);
			_ft.log(d);
			
			_ft.log('----- e -----');
			e = d * Math.PI;
			_ft.log(e);
			
			_ft.log('----- f -----');
			f = new Object();
			_ft.log(f);
			
			_ft.log('----- g -----');
			_ft.log(c());
			
			_ft.log('----- h -----');
			h = 0xFF0000;
			_ft.log(h);
			
			_ft.log('----- i -----');
			// http://www.peterelst.com/blog/2007/09/13/actionscript-30-using-variables-in-xml/
			var myName:String = "Micky";
			var myEmail:String = "foo@bar.com"
			i = <friends><person name={myName}><email>{myEmail}</email></person></friends>;
			_ft.log(i);
			
			_ft.log('----- j -----');
			// http://www.kirupa.com/forum/showpost.php?p=1936562&postcount=167
			j = i.person.email;
			_ft.log(j); 
			
		};
		
		/**
		* test()
		*        About: Test function.
		*      Returns: String.
		*/
		private function test():String {
			var foo:String = 'bar';
			return foo;
		};
		
	};
	
};