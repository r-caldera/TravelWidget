package{
	public class ConcreteSubject implements ISubject{
		private var light:String;
		private var observers:Array;
		
		function ConcreteSubject(){
			trace("From Concrete Subject");
			observers = new Array();
		}
		public function subscribeObserver (obserNow:IObserver):void{
			observers.push(obserNow);
		}
		public function unsubscribeObserver(obserNow:IObserver):void{
			for(var ob:uint = 0; ob<observers.length;ob++){
				if(observers[ob]==obserNow){
					observers.splice(ob,1);
					break;
				}
			}
		}
		public function notifyObserver():void{
			for(var notify in observers){
				observers[notify].update(light);
				trace("Observer " + notify + "light is " + light);
			}
		}
		public function setLight(light:String):void{
			this.light = light;
			notifyObserver();
		}
	}
}