package{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.Event;
	
	public class DataDesignTravel extends Sprite {
		private var starRating:StarRating;
		private var dataSub:ConcreteSubject;
		private var listDisplay:ConcreteObserver;
	
	
		public function DataDesignTravel(){
			var mySub:ConcreteSubject = new ConcreteSubject();
			var subObserver1:IObserver = new ConcreteObserver();
			var subObserver2:IObserver = new ConcreteObserver();
			var subObserver3:IObserver = new ConcreteObserver();
			
			dataSub=new ConcreteSubject();
			listDisplay=new ConcreteObserver();
			dataSub.subscribeObserver(listDisplay);
			starRating=new StarRating(listDisplay.outToDesign());
			addChild(starRating);
			
			mySub.subscribeObserver(subObserver1); //the subObserver is passed as an instance of the Iobserver supertype
			mySub.subscribeObserver(subObserver2);
			mySub.subscribeObserver(subObserver3);
			mySub.setLight("on");
			mySub.unsubscribeObserver(subObserver1);
			mySub.setLight("off");
		}
	}
}
