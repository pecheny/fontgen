package msdfgen;

import ammer.Library;
import haxe.io.Bytes;
import ammer.ffi.*;

@:buildXml('
<target id="haxe">
  <libpath name="../../native/msdfgen/build/win32/vcpkg_installed/x86-windows-static/lib"/>
  <libpath name="../../native/msdfgen/build/win32/Release"/>
  <lib name="msdfgen_lib.lib" if="windows" />
  <lib name="msdfgen-core.lib" if="windows" />
  <lib name="msdfgen-ext.lib" if="windows" />
  <lib name="libpng16.lib" if="windows" />
  <lib name="freetype.lib" if="windows" />

  <lib name="tinyxml2.lib" if="windows" />
  <lib name="skia.lib" if="windows" />
  <lib name="zlib.lib" if="windows" />
  <lib name="bz2.lib" if="windows" />
  <lib name="brotlicommon.lib" if="windows" />
  <lib name="brotlidec.lib" if="windows" />
</target>
')
class Msdfgen extends Library<"msdfgen_lib"> {
	
	@:ammer.native("wrap_initializeFreetype")
	public static function initializeFreetype():Bool;
	
	@:ammer.native("wrap_deinitializeFreetype")
	public static function deinitializeFreetype():Void;
	
	public static function initFont(filename:String, metrics:NoSize<Bytes>, fontSize:Int):Int;
	public static function unloadFonts():Void;
	public static function getGlyphMetrics(font:Int, charcode:Int, output:NoSize<Bytes>):Bool;
	public static function getKerning(font:Int, left:Int, right:Int):Int;
	public static function getFontName(font:Int, len:SizeOfReturn):Bytes;

	public static function beginAtlas(width:Int, height:Int, defaultColor:Int, enforceR8:Bool):Void;
	public static function endAtlas(output:String):Void;
	
	public static function generateSDFGlyph(slot:Int, charcode:Int, width:Int, height:Int, x:Int, y:Int, tx:Float, ty:Float, ccw:Bool, range:Float):Bool;
	public static function generatePSDFGlyph(slot:Int, charcode:Int, width:Int, height:Int, x:Int, y:Int, tx:Float, ty:Float, ccw:Bool, range:Float):Bool;
	public static function generateMSDFGlyph(slot:Int, charcode:Int, width:Int, height:Int, x:Int, y:Int, tx:Float, ty:Float, ccw:Bool, range:Float):Bool;
	public static function rasterizeGlyph(slot:Int, charcode:Int, width:Int, height:Int, x:Int, y:Int):Bool;

	public static function initSvgShape(pathDef:String, fontSize:Int, scale:Float, endpointSnapRange:Float):Int;
	public static function getBounds(slot:Int):String; 
	public static function generateSDFPath(slot:Int, width:Float, height:Float,  ox:Int, oy:Int, tx:Float, ty:Float, range:Float, scale:Float):Bool;
	public static function generateMSDFPath(slot:Int, width:Float, height:Float,  ox:Int, oy:Int, tx:Float, ty:Float, range:Float, scale:Float):Bool;
	public static function generatePSDFPath(slot:Int, width:Float, height:Float,  ox:Int, oy:Int, tx:Float, ty:Float, range:Float, scale:Float):Bool;
}

class MsdfgenUtils {
	public static inline function getBounds(slot:Int):Bounds{
		return haxe.Json.parse(Msdfgen.getBounds(slot));
	}
}
typedef Bounds = {
	public var l:Float;
	public var b:Float;
	public var r:Float;
	public var t:Float;
}