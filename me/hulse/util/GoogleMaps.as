package me.hulse.util {
	
	// http://assets.hulse.me/js/map.js
	// http://code.google.com/apis/maps/documentation/flash/tutorial-flash.html
	
	// Flash:
	import flash.geom.Point;
	import flash.events.Event;
	import flash.utils.getDefinitionByName;
	
	// Google stuff:
	import com.google.maps.LatLng;
	import com.google.maps.Map;
	import com.google.maps.MapEvent;
	import com.google.maps.MapType;
	import com.google.maps.MapOptions;
	import com.google.maps.controls.*;
	//import com.google.maps.interfaces.IControl;
	
	// Custom:
	import me.hulse.util.FireTrace;
	
	public class GoogleMaps {
		
		// Private dependencies:
		private var _ft:FireTrace;
		private var _map:Map;
		
		// Private internals:
		private var _key:String;
		private var _sensor:String;
		private var _width:Number;
		private var _height:Number;
		private var _this:Object;
		private var _controls:Array;
		private var _center:Array;
		
		//----------------------------------
		//  Public methods:
		//----------------------------------
		
		/**
		 * Constructor
		 * 
		 * @access     public
		 */
		
		public function GoogleMaps() {
			
			_ft = new FireTrace();
			
			this.init();
			
		};
		
		public function place($t:Object):void {
			
			_this = $t;
			
			_map.sensor = _sensor;
			
			_map.key = _key;
			
			// Example usage:
			// mapInstance.size(stage.stageWidth, stage.stageHeight);
			this.size(_width, _height);
			
			_map.addEventListener(MapEvent.MAP_READY, onMapReady, false, 0, true);
			
			_map.visible = false; // Replace this later for fading-in or something.
			
			_this.addChild(_map);
			
		};
		
		public function size($w, $h) {
			
			_map.setSize(new Point($w, $h));
			
		};
		
		//----------------------------------
		//  Private methods:
		//----------------------------------
		
		private function init():void {
			
			_ft.log('GoogleMaps() init()');
			
			_map = new Map();
			
		};
		
		private function myZoomControl():void {
			
			_map.addControl(new ZoomControl());
			
		};
		
		private function myPositionControl():void {
			
			_map.addControl(new PositionControl());
			
		};
		
		private function myMapTypeControl():void {
			
			_map.addControl(new MapTypeControl());
			
		};
		
		private function myScaleControl():void {
			
			_map.addControl(new MapTypeControl());
			
		};
		
		private function myOverviewMapControl():void {
			
			_map.addControl(new MapTypeControl());
			
		};
		
		//----------------------------------
		//  Events:
		//----------------------------------
		
		private function onMapReady($e:Event):void {
			
			_map.removeEventListener(MapEvent.MAP_READY, onMapReady);
			
			for each (var s:String in _controls) {
				
				/*
				_map.addControl(new ZoomControl());
				_map.addControl(new PositionControl());
				_map.addControl(new MapTypeControl());
				_map.addControl(new ScaleControl());
				_map.addControl(new OverviewMapControl());
				*/
				
				try {
					
					this['my' + s]();
					
				} catch($e:Error) {
					
					trace($e);
					
				}
				
			}
			
			_map.setCenter(new LatLng(_center[0], _center[1]), _center[2], MapType[_center[3]]);
			
			_map.visible = true;
			
		};
		
		//----------------------------------
		//  Setters:
		//----------------------------------
		
		public function set key($s:String):void {
			
			// Sign-up for API key:
			// http://code.google.com/apis/maps/signup.html
			// hulse.me API key:
			// ABQIAAAASVk2zlv7Ieb_pADcUQM1gBSqa8K7BwGUwRo8XmnPIAoG9yJXaBTeKV81N1bdXR1B5KZO92i0qNT8Qg
			
			_key = $s;
			
		};
		
		public function set sensor($s:String):void {
			
			/*
			** 
			** Use of the Google Maps API requires that you indicate whether your 
			** application is using a sensor (such as a GPS locator) to determine 
			** the user's location.
			** 
			** http://code.google.com/apis/maps/documentation/flash/intro.html#SpecifyingSensor
			** 
			*/
			
			_sensor = $s;
			
		};
		
		public function set width($w:Number):void {
			
			_width = $w;
			
		};
		
		public function set height($h:Number):void {
			
			_height = $h;
			
		};
		
		public function set controls($a:Array):void {
			
			_controls = $a;
			
		};
		
		public function set center($a:Array):void {
			
			_center = $a;
			
		};
		
	};
	
};