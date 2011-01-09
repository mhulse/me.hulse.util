package me.hulse.util {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import me.hulse.util.ClickTag;
	
	/*
	** 
	** Quick and dirty way to get clickTAG support for client ads.
	** Apply to a movieclip and export on first frame.
	** If you want to make whole movie clickable, make mc size of stage and set alpha to 0.
	** 
	*/
	
	public class ApplyClickTag extends MovieClip {
		
		private var _clickTag:ClickTag;
		
		public function ApplyClickTag() {
			
			addEventListener(Event.ADDED_TO_STAGE, init);
			
		};
		
		private function init(e:Event):void {
			
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			_clickTag = new ClickTag(this);
			
			this.addEventListener(MouseEvent.MOUSE_UP, onClick, false, 0, true);
			this.buttonMode = true; // Button mode.
			this.useHandCursor = true;
			
		};
		
		private function onClick(e:MouseEvent):void {
			
			_clickTag.getURL();
			
		};
		
	};
	
};