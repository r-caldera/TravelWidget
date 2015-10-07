package{
	public class ConcreteObserver implements IObserver, IDataOut{
		private var light:String;
		private var dataNow:Array;
		private var q1:Number, q2:Number, q3:Number, q4:Number;
		
		public function ConcreteObserver(){
			trace("From Concrete Observer");
		}
		public function outToDesign():Array{
			return dataNow;
		}
		public function update(light:String):void{
			this.light=light;
			this.q1=q1;
			this.q2=q2;
			this.q3=q3;
			this.q4=q4;
			dataNow=new Array(q1,q2,q3,q4);
			outToDesign();
		}
	}
}


//		public function update(q1:Number, q2:Number, q3:Number, q4:Number):void{
