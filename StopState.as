package {
	import flash.net.NetStream;
	
	class StopState implements State{
		private var videoWorks:VideoWorks;
		public function StopState(videoWorks:VideoWorks) {
			trace("---Stop State--");
			this.videoWorks=videoWorks;
		}
		public function startPlay(ns:NetStream,flv:String):void{
			ns.play(flv);
			trace("Begin playing");
			videoWorks.setState(videoWorks.getPlayState());
		}
		public function stopPlay(ns:NetStream):void{
			trace("You're already stopped");
		}
	}
}
