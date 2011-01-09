package me.hulse.util {
	
	import flash.display.DisplayObject;
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;
	
	public class Stager {
		
		private var _ft:FireTrace;
		private var _this:Object;
		private var _scale:String;
		private var _align:String;
		
		public function Stager(t:Object, s:String = "NO_SCALE", a:String = "TOP_LEFT") {
			
			_ft = new FireTrace();
			
			_ft.log('Stager() instantiated...');
			
			_this = t;
			_scale = s;
			_align = a;
			
			init();
			
		};
		
		private function init():void {
			
			// Stage:
			_this.stage.scaleMode = StageScaleMode[_scale];
			_this.stage.align = StageAlign[_align];
			
		};
		
	};
	
};