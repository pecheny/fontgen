enum abstract SdfMode(String) from String to String {
	
	var SDF = "sdf";
	var PSDF = "psdf";
	var MSDF = "msdf";
	var Raster = "raster";
	
	public inline function validate() {
		if (this != SDF && this != PSDF && this != MSDF && this != Raster)
			throw "Invalid render mode, allowed values are 'msdf', 'sdf', 'psdf' or 'raster'";
	}
	
}

typedef GenConfig = AtlasConfig & {
	var input:String; // path to ttf
	var inputs:Array<String>;
	var svgInput:Null<Dynamic>;
	var charset:Array<Dynamic>; // Charset info
	var fontSize:Null<Int>;
	var padding: { top: Null<Int>, bottom: Null<Int>, left: Null<Int>, right: Null<Int> };
	// TODO: Margin
	var dfSize:Null<Int>;
	var template:String;//file name of external json config to merge with 
    var share:Bool;// use this config as template for the following ones
    var pngName:String;// png file name (same as fnt by default)
};

typedef AtlasConfig = {
	var mode:SdfMode; // Generator mode
	var packer:PackerConfig;
	var spacing: { x:Null<Int>, y:Null<Int> };
	var output:String; // path to output .fnt
	var options:Array<String>;
}

typedef PackerConfig = {
	var size:Null<Int>;
	var width:Null<Int>;
	var height:Null<Int>;
	var pot:Bool;
	var exact:Bool;
	var sort:String;
	var algorithm:String;
	var heuristic:String;
	var useWasteMap:Null<Bool>;
}