package  {
	import flash.net.NetStream;
	
	interface State {
		function startPlay(ns:NetStream,flv:String):void;
		function stopPlay(ns:NetStream):void;
	}
	
}
