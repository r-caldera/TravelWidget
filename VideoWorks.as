package {
	import flash.net.NetStream;
	class VideoWorks {
		private var playState:State;
		private var stopState:State;
		private var state:State;

		public function VideoWorks() {
			trace("Video Player is on");
			playState = new PlayState(this);
			stopState = new StopState(this);
			state=stopState;
		}
		public function startPlay(ns:NetStream,flv:String):void{
			state.startPlay(ns,flv);
		}
		public function stopPlay(ns:NetStream):void{
			state.stopPlay(ns);
		}
		public function setState(state:State):void{
			trace("A new state is set");
			this.state=state;
		}
		public function getState():State{
			return state;
		}
		public function getPlayState():State{
			return this.playState;
		}
		public function getStopState():State{
			return this.stopState;
		}
	}
}