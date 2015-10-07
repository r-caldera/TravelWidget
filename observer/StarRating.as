package  {
	import flash.display.MovieClip;
	import fl.controls.List;
	import flashx.textLayout.elements.ListElement;
	import fl.transitions.easing.*;
	import fl.transitions.TweenEvent;
	import flash.net.URLRequest;
	import flash.net.URLLoader;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFieldAutoSize;
	import flash.events.*;
	
	public class StarRating extends MovieClip {
		private var starsAndMask:MovieClip;
		private var starText:TextField = new TextField();
						
		public function StarRating(uData:Array) {
			starsAndMask = new StarsAndMask();
			starsAndMask.x = 10;
			starsAndMask.y = 18;
			starsAndMask.buttonMode=true;
			starText.y=30;
			starText.x=48;
			var starTextFormat:TextFormat = new TextFormat();
			starTextFormat.size = 15;
			starTextFormat.color = 0xffffff;
			starTextFormat.bold = false;
			starText.defaultTextFormat = starTextFormat;
			addChild(starText);
			addChild(starsAndMask);
			initializeStars();
		}
		private function initializeStars(){
			starsAndMask.maskO.hoverStar1.addEventListener(MouseEvent.CLICK, oneStar);
			starsAndMask.maskO.hoverStar2.addEventListener(MouseEvent.CLICK, twoStar);
			starsAndMask.maskO.hoverStar3.addEventListener(MouseEvent.CLICK, threeStar);
			starsAndMask.maskO.hoverStar4.addEventListener(MouseEvent.CLICK, fourStar);
			starsAndMask.maskO.hoverStar5.addEventListener(MouseEvent.CLICK, fiveStar);
		}
		private function oneStar(e:MouseEvent):void {
			starText.text="1/5";
		}
		private function twoStar(e:MouseEvent):void {
			starText.text="2/5";
		}
		private function threeStar(e:MouseEvent):void {
			starText.text="3/5";
		}
		private function fourStar(e:MouseEvent):void {
			starText.text="4/5";
		}
		private function fiveStar(e:MouseEvent):void {
			starText.text="5/5";
		}
	}	
}