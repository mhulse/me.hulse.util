package me.hulse.util  {
	
	// Imports:
	import flash.display.*;
	import flash.events.*;
	import me.hulse.util.ClickTag;
	
	/**
	* Apply clickTAG.
	* 
	* <p>Used for client ads which have published as AS3
	* and cannot be easily converted to AS2/AS1.</p>
	* 
	* <p>This class can be used in two ways:</p>
	* 
	* <ol>
	* 	<li>
	* 		Apply to a movieclip/graphic and export on first frame.
	* 		<br>
	* 		Drag to stage and position (put on top-most layer).
	* 		<br>
	* 		If you want whole movie clickable, make object
	* 		the size of stage and set alpha to 0.
	* 	</li>
	* 	<li>
	* 		Assign this class to document and publish.
	* 	</li>
	* </ol>
	* 
	* @author Micky Hulse
	*/
	
	public class ApplyClickTag extends MovieClip {
		
		// Constant:
		public static var CLASS_REF:Class = me.hulse.util.ApplyClickTag;
		public static var CLASS_NAME:String = 'me.hulse.util.ApplyClickTag';
		
		// Private:
		private var _clickTag:ClickTag;
		private var _this:Object;
		
		/**
		* Class constructor.
		* 
		* @param this (object)
		* 
		* @return N/A
		*/
		
		public function ApplyClickTag($this:Object = null) {
			
			if ($this != null) {
				
				_this = $this;
				
			}
			
			// Added to stage handler:
			addEventListener(Event.ADDED_TO_STAGE, init, false, 0, true);
			
		};
		
		/**
		* ADDED_TO_STAGE handler.
		* 
		* @param Event
		* 
		* @return void
		*/
		
		private function init($e:Event):void {
			
			// GC:
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			// If _this not already defined:
			if (_this == null) {
				
				/*
				** 
				** Here we test if this class is a document class
				** or has been assigned to library item.
				** 
				*/
				
				if (this.root is CLASS_REF) {
					
					/*
					** 
					** Document class:
					** 
					*/
					
					trace('Document class: ' + CLASS_NAME);
					
					// Create new sprite:
					var s:Sprite = new Sprite();
					s.graphics.beginFill(0xFF0000);
					s.graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
					s.graphics.endFill();
					s.alpha = 0;
					
					// Add sprite to stage:
					addChild(s);
					
					// Reference to "this":
					_this = s;
					
				} else {
					
					/*
					** 
					** Library symbol/object/movieclip/graphic:
					** 
					*/
					
					trace('Not document class: ' + this.root);
					
					// Reference to "this":
					_this = this;
					
				}
				
			}
			
			// Is _this defined?
			if (_this != null) {
				
				// ClickTAG:
				_clickTag = new ClickTag(_this);
				
				// Button/cursor:
				_this.buttonMode = true;
				_this.useHandCursor = true;
				
				// Click event handler:
				_this.addEventListener(MouseEvent.MOUSE_UP, onClick, false, 0, true);
				
			}
			
		};
		
		/**
		* Click event handler.
		* 
		* @param Event
		* 
		* @return void
		*/
		
		private function onClick($e:MouseEvent):void {
			
			trace($e.target);
			
			// Get the clickTAG URI:
			_clickTag.getURL();
			
		};
		
	};
	
};