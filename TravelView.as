package  {
	//was UserInterface
	import com.greensock.easing.Circ;
	import com.greensock.TweenLite;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.TextField;

	public class TravelView extends MovieClip {
		private const OFFSET_AMT:int = 600;
		private var travelContainer:MovieClip;
		private var arrowL:MovieClip;
		private var arrowR:MovieClip;
		private var starsAndMask:MovieClip;
		private var acmeTravel:MovieClip;
		private var currentDest:int = 0;
		private var destLength:int;
		private var my_date:Date = new Date();
		
		public function TravelView(xml:XML) {
			setupContainer();
			createTravelComponents(xml);
		}
		private function setupContainer():void{
			travelContainer = new MovieClip();
			travelContainer.x = 0;
			travelContainer.y = 0;
			addChild(travelContainer);
			acmeTravel = new AcmeTravel();
			acmeTravel.alpha = .5;
			acmeTravel.x=560;
			addChild(acmeTravel);
			arrowL = new ArrowL();
			arrowL.x = 5;
			arrowL.y = 380 - arrowL.height / 2;
			arrowL.buttonMode = true;
			addChild(arrowL);
			arrowR = new ArrowR();
			arrowR.x = 595 - arrowR.width - 5;
			arrowR.y = 380 - arrowL.height / 2;
			arrowR.buttonMode = true;
			addChild(arrowR);
			arrowL.addEventListener(MouseEvent.CLICK, goLeft);
			arrowR.addEventListener(MouseEvent.CLICK, goRight);
		}
		private function goRight(e:MouseEvent):void {
			if (currentDest < destLength - 1) {
				currentDest++;
				var toX:int = currentDest * -OFFSET_AMT;
				TweenLite.to(travelContainer, 1, { x: toX, ease:Circ.easeInOut } );
			}
		}
		private function goLeft(e:MouseEvent):void {
			if (currentDest > 0) {
				currentDest--;
				var toX:int = currentDest * -OFFSET_AMT;
				TweenLite.to(travelContainer, 1, { x: toX, ease:Circ.easeInOut } );
			}
		}
/*		private function createTravelComponents(xml:XML):void {
			this.destLength = xml.destination.length();// Store the length of the destination.  This is used for moving travelContainer
			for (var i:int = 0; i < destLength; i++) {// For each destination in the XML, create an TravelComponent
				if (my_date.month == 2 || my_date.month == 3 || my_date.month == 4){
					var toX:int = currentDest * -OFFSET_AMT;
					trace("SPRING");
					if (i>=0 && i<3){
						var tmp:XML = xml.destination[i];// Store a reference to your current album to make life easier when grabbing data
						// Grab the location, description, image, review, and rating out of the XML and create a TravelComponent out of the data
						var comp:TravelComponent = new TravelComponent(tmp.location, tmp.description, tmp.image, tmp.review, tmp.reviewer, tmp.price, tmp.vid);
						travelContainer.addChild(comp);// Add the component to the travelContainer
						var xOffset:int = i * OFFSET_AMT;// Determine where the dest should be positioned by multiplying the current index by the offset amount
						comp.x = xOffset;// Position the component inside of travelContainer by the calculated amount.
					}
				}
				if (my_date.month == 5 || my_date.month == 6 || my_date.month == 7){
					trace("SUMMER");
					currentDest=3;
					var toX:int = currentDest * -OFFSET_AMT;
					TweenLite.to(travelContainer, 0, { x: toX, ease:Circ.easeInOut } );
					if (i>=3 && i<6){
						currentDest = 3;
						var tmp:XML = xml.destination[i];// Store a reference to your current dest to make life easier when grabbing data
						// Grab the location, description, image, review, and rating out of the XML and create a TravelComponent out of the data
						var comp:TravelComponent = new TravelComponent(tmp.location, tmp.description, tmp.image, tmp.review, tmp.reviewer, tmp.price, tmp.vid);
						travelContainer.addChild(comp);// Add the component to the travelContainer
						var xOffset:int = i * OFFSET_AMT;// Determine where the dest should be positioned by multiplying the current index by the offset amount
						comp.x = xOffset;// Position the component inside of travelContainer by the calculated amount.
					}
				}
				if (my_date.month == 8 || my_date.month == 9 || my_date.month == 10){
					trace("AUTUMN");
					currentDest=6;
					var toX:int = currentDest * -OFFSET_AMT;
					TweenLite.to(travelContainer, 0, { x: toX, ease:Circ.easeInOut } );
					if (i>=6 && i<9){
						var tmp:XML = xml.destination[i];// Store a reference to your current album to make life easier when grabbing data
						// Grab the location, description, image, review, and rating out of the XML and create a TravelComponent out of the data
						var comp:TravelComponent = new TravelComponent(tmp.location, tmp.description, tmp.image, tmp.review, tmp.reviewer, tmp.price, tmp.vid);
						travelContainer.addChild(comp);// Add the component to the travelContainer
						var xOffset:int = i * OFFSET_AMT;// Determine where the dest should be positioned by multiplying the current index by the offset amount
						comp.x = xOffset;// Position the component inside of travelContainer by the calculated amount.
					}
				}
				if (my_date.month == 11 || my_date.month == 0 || my_date.month == 1){
					trace("WINTER");
					currentDest=9;
					var toX:int = currentDest * -OFFSET_AMT;
					TweenLite.to(travelContainer, 0, { x: toX, ease:Circ.easeInOut } );
					if (i>=9 && i<12){
						var tmp:XML = xml.destination[i];// Store a reference to your current album to make life easier when grabbing data
						// Grab the location, description, image, review, and rating out of the XML and create a TravelComponent out of the data
						var comp:TravelComponent = new TravelComponent(tmp.location, tmp.description, tmp.image, tmp.review, tmp.reviewer, tmp.price, tmp.vid);
						travelContainer.addChild(comp);// Add the component to the travelContainer
						var xOffset:int = i * OFFSET_AMT;// Determine where the dest should be positioned by multiplying the current index by the offset amount
						comp.x = xOffset;// Position the component inside of travelContainer by the calculated amount.
					}
				}
				*/
/*NOTE: Comment out the above function/uncomment the following function. This will display all 12 destinations. The above function displays 3 destinations based on the time of year*/
		private function createTravelComponents(xml:XML):void {
			this.destLength = xml.destination.length();// Store the length of the destination.  This is used for moving travelContainer
			for (var i:int = 0; i < destLength; i++) {// For each destination in the XML, create an TravelComponent
				var tmp:XML = xml.destination[i];// Store a reference to your current album to make life easier when grabbing data
				// Grab the location, description, image, review, and rating out of the XML and create a TravelComponent out of the data
				var comp:TravelComponent = new TravelComponent(tmp.location, tmp.description, tmp.image, tmp.review, tmp.reviewer, tmp.price, tmp.vid);
				travelContainer.addChild(comp);// Add the component to the travelContainer
				var xOffset:int = i * OFFSET_AMT;// Determine where the dest should be positioned by multiplying the current index by the offset amount
				comp.x = xOffset;// Position the component inside of travelContainer by the calculated amount.
			}
		}
	}
}