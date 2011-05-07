package me.hulse.util {
	
	import flash.display.MovieClip;
	import flash.net.URLRequest;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.ProgressEvent;
	
	import com.team2p0.Preload;
	
	public class LoadAds extends EventDispatcher {
		
		// Constant:
		public static const LOAD_COMPLETE:String = 'load_completed';
		
		// Private:
		private var _ft:FireTrace;
		private var _pre:Preload;
		private var _this:Object;
		
		/**
		* LoadAds()
		*        About: Class constructor.
		*      Returns: Nothing.
		*/
		public function LoadAds(t:Object) {
			
			_ft = new FireTrace();
			
			_ft.log('Load() instantiated...');
			
			_this = t;
			
			//init();
			
			_this.addEventListener(Event.ENTER_FRAME, onPreInit, false, 0, true);
			
		};
		
		/**
		* onPreInit()
		*        About: Fixes a Firefox/Vista flash player bug.
		*               http://mrsteel.wordpress.com/2009/06/05/code-snippets-solving-flash-problem-with-wmode-and-firefox/
		*      Returns: Nothing.
		*/
		private function onPreInit(e:Event):void {
			
			if (_this.loaderInfo.bytesLoaded == _this.loaderInfo.bytesTotal) {
				
				_this.removeEventListener(Event.ENTER_FRAME, onPreInit);
				
				init();
				
			}
			
		};
		
		private function init():void {
			
			// Get embed params:
			var p:Params = new Params(_this);
			
			// Instantiate Preload() class:
			_pre = new Preload(
				[
				 	p.getParam("advert", "advert.swf"), 
					p.getParam("tease", "tease.swf")
				]
			);
			// http://code.google.com/p/as3-multiple-file-preloader/
			
			// Preload event listener:
			_pre.addEventListener("preloadComplete", onPreloadComplete, false, 0, true);
			
		}
		
		private function onPreloadComplete(e:Event):void {
			
			_pre.removeEventListener("preloadComplete", onPreloadComplete); // Garbage collect.
			
			trace(_pre.objects); // Loaded objects as an array.
			
			// Everything loaded!
			this.dispatchEvent(new Event(LoadAds.LOAD_COMPLETE));
			
		};
		
		public function get pre():Preload {
			
			return _pre; // Access loaded clips: _pre.objects
			
		};
		
	};
	
};