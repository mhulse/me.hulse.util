package me.hulse.util {		public class RgbMeta {				// Constant:		public static var CLASS_REF = me.hulse.util.RgbMeta;		public static var CLASS_NAME:String = 'RgbMeta';		public static var LINKAGE_ID:String = 'me.hulse.util.RgbMeta';				// Private:		private var _alpha:uint;		// Getters:		private var _rgb:String; // Example: 000000		private var _rgbHex:String; // Example: 0x000000		private var _rgbUint:uint; // Example: 16776960		private var _argbUint:uint; // Example: 771751680		private var _argbHex:String; // Example: 				/*		* @param: $rgb = HEX/RGB value.		* @param: $alpha has to be in the 0 to 255 range		*/		public function RgbMeta($rgb:String, $alpha:uint = 0) {						trace(LINKAGE_ID + ' class instantiated');						_rgb = $rgb;			_alpha = $alpha;						init();					};				private function init():void {						_rgb = rgbSanitize(_rgb);						_rgbHex = ('0x' + _rgb);						_rgbUint = uint(_rgbHex);						_argbUint = rgb2argb(_rgbUint, _alpha);						_argbHex = uint2hex(argbUint);						/*			_argb = (_alpha << 24) | _rgb;			_rgb = _rgb & _argb;			_alpha = (_argb >> 24) & 0xFF;									_alpha = (_alpha << 24);			_argb = _alpha;			_argb += (uint(_rgb));			*/					};				//----------------------------------		//  Utility methods:		//----------------------------------				private function uint2hex(dec:uint):String {						// http://blog.rcq129.com/coding/as3-uint-to-hex/			// http://board.flashkit.com/board/showpost.php?p=4046881&postcount=6						var digits:String = "0123456789ABCDEF";			var hex:String = '';						while (dec > 0) {								var next:uint = dec & 0xF;				dec >>= 4;				hex = digits.charAt(next) + hex;							}						if (hex.length == 0) hex = '0'						return hex;					}				private function rgbSanitize($rgb:String):String {						var rgb:String = $rgb;						return rgb.replace('#', '').replace('0x', '');				};				// $alpha has to be in the 0 to 255 range		private function rgb2argb($rgb:uint, $alpha:uint):uint{						// http://www.zedia.net/2008/converting-a-rgb-color-and-alpha-to-argb-in-actionscript-3/						var argb:uint = 0;			argb += ($alpha << 24);			argb += ($rgb);			return argb;					};				//----------------------------------		//  Getters:		//----------------------------------				/**		* rgb()		*        About: Getter.		*      Returns: String.		*               RGB hex value sans "#".		*/		public function get rgb():String {						return _rgb;					};				/**		* rgbHex()		*        About: Getter.		*      Returns: String.		*               RGB hex value sans "#".		*/		public function get rgbHex():String {						return _rgbHex;					};				/**		* rgbUint()		*        About: Getter.		*      Returns: Unsigned Integer (uint).		*               RGB value as uint.		*/		public function get rgbUint():uint {						return _rgbUint;					};				/**		* argb()		*        About: Getter.		*      Returns: Unsigned Integer (uint).		*               ARGB value as uint.		*/		public function get argbUint():uint {						return _argbUint;					};				/**		* argbHex()		*        About: Getter.		*      Returns: String.		*               ARGB HEX value sans "#".		*/		public function get argbHex():String {						return _argbHex;					};			}; // End class.	}; // End package.