package {
	import flash.net.NetStream;
	
	class PlayState implements State {
		private var videoWorks:VideoWorks;
		public function PlayState(videoWorks:VideoWorks){
			trace("--Play State--");
			this.videoWorks=videoWorks;
		}
		public function startPlay(ns:NetStream,flv:String):void {
			trace("You're already playing");
		}
		public function stopPlay(ns:NetStream):void{
			ns.close();
			trace("Stop playing.");
			videoWorks.setState(videoWorks.getStopState());
		}
	}
}
