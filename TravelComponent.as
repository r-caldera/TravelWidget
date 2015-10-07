package  {
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.display.Sprite;
	import flash.display.Shape;
	
	public class TravelComponent extends MovieClip{
		private const INFO_X:int = 110;
		private const LOCATION_Y:int = 320;
		private const IMAGE_X:int = 0;
		private const IMAGE_Y:int = 0;		
		private var _location:String;
		private var _description:String;
		private var _review:String;
		private var _reviewer:String;
		private var _price:String;
		private var _imagePath:String;
		private var _vidPath:String;
		private var locationText:TextField;
		private var descriptionText:TextField;
		private var reviewText:TextField;
		private var reviewerText:TextField;
		private var priceText:TextField;
		private var imageHolder:Loader;
		private var vidHolder:Loader;
		private var currentlyLoadedImage:String;
		private var currentlyLoadedVid:String;
		private var infoBox:Sprite=new Sprite();
		private var reviewBox:Sprite=new Sprite();
		
		public function TravelComponent(location:String, description:String, imagePath:String, review:String, reviewer:String, price:String, vidPath:String) {		
			_location = location;
			_description = description;
			_review = review;
			_reviewer = reviewer;
			_price = price;
			_imagePath = imagePath;
			_vidPath = vidPath;
			initializeFields();
			updateFields();
		}
		public function updateFields():void {
			locationText.text = _location;
			descriptionText.text = _description;
			reviewText.text = _review;
			reviewerText.text = _reviewer;
			priceText.text = _price;
			if (_imagePath != currentlyLoadedImage) {// If the image path does not match the image path currently loaded, load the new image.
				imageHolder.load(new URLRequest(_imagePath));
				currentlyLoadedImage = _imagePath;
			}
			if (_vidPath != currentlyLoadedVid) {// If the image path does not match the image path currently loaded, load the new image.
				vidHolder.load(new URLRequest(_vidPath));
				currentlyLoadedVid = _vidPath;
			}
		}
		private function initializeFields():void {
			var starSystem:Loader = new Loader(); 
			var url:URLRequest = new URLRequest("./observer/observerTest.swf");  
			starSystem.load(url);
			starSystem.x=20;
			starSystem.y=210;
			
			infoBox.graphics.beginFill(0x000000);
			infoBox.graphics.drawRect(0,0,600,200);
			infoBox.graphics.endFill();
			infoBox.y=320;
			infoBox.alpha=.7;
			
			var travelTextFormat:TextFormat = new TextFormat();
			travelTextFormat.size = 20;
			travelTextFormat.color = 0xffffff;
			travelTextFormat.bold = true;
			locationText = new TextField();// Instantiate info viewing fields
			locationText.defaultTextFormat = travelTextFormat;
			locationText.width=300;
			
			var descriptionTextFormat:TextFormat = new TextFormat();
			descriptionTextFormat.size = 13;
			descriptionTextFormat.color = 0xffffff;
			descriptionTextFormat.bold = false;
			descriptionText = new TextField();
			descriptionText.defaultTextFormat = descriptionTextFormat;
			descriptionText.y=345;
			
			var reviewBox:Shape = new Shape();
			reviewBox.graphics.beginFill(0x000000);
			reviewBox.graphics.drawRoundRect(0, 18, 160, 250, 30, 30);
			reviewBox.graphics.endFill();
			reviewBox.alpha=.7;
			reviewText = new TextField();
			reviewText.width = 150;
			reviewText.height=200;
			reviewText.y = 60;
			reviewText.wordWrap=true;
			var reviewTextFormat:TextFormat = new TextFormat();
			reviewTextFormat.size = 11;
			reviewTextFormat.color = 0xffffff;
			reviewTextFormat.bold = false;
			reviewText.defaultTextFormat = reviewTextFormat;
			var reviewLabel:TextField = new TextField();
			reviewLabel.defaultTextFormat = reviewTextFormat;
			reviewLabel.text="Review by...";
			reviewLabel.y=20;
			reviewLabel.width=200;
			reviewerText = new TextField();
			reviewerText.defaultTextFormat = travelTextFormat;
			reviewerText.width=150;
			reviewerText.y=35;
			var starTextFormat:TextFormat = new TextFormat();
			starTextFormat.size = 15;
			starTextFormat.color = 0xffffff;
			starTextFormat.bold = false;
			reviewText.defaultTextFormat = reviewTextFormat;
			var starLabel:TextField = new TextField();
			starLabel.defaultTextFormat = starTextFormat;
			starLabel.text="Rate This Destination";
			starLabel.y=205;
			starLabel.width=200;
			reviewLabel.x=reviewerText.x=reviewText.x=starLabel.x=8;
			
			priceText = new TextField();
			priceText.defaultTextFormat = descriptionTextFormat;
			priceText.x=448;
			priceText.y=325;
			
			locationText.x = descriptionText.x = INFO_X;// Set X position of all viewing fields
			// Set position of all elements.
			locationText.y = LOCATION_Y;
			imageHolder = new Loader();// Instantiate the image loader.
			vidHolder = new Loader();
			// Position the image loader.
			vidHolder.x = 200;
			vidHolder.y = 200;;
			// Add all elements to the stage.
			descriptionText.width = 420;
			descriptionText.wordWrap = true;
			addChild(imageHolder);
			addChild(infoBox);
			addChild(reviewBox);
			addChild(descriptionText);
			addChild(reviewText);
			addChild(locationText);
			addChild(reviewerText);
			addChild(priceText);
			addChild(reviewLabel);
			addChild(starLabel);
			addChild(starSystem);
			addChild(vidHolder);
		}
		public function get location():String {
			return _location;
		}
		public function set location(value:String):void {
			_location = value;
			updateFields();
		}
		public function get description():String {
			return _description;
		}
		public function set description(value:String):void{
			_description = value;
			updateFields();
		}		
		public function get review():String {
			return _review;
		}
		public function set review(value:String):void {
			_review = value;
			updateFields();
		}
		public function get reviewer():String {
			return _reviewer;
		}
		public function set reviewer(value:String):void {
			_reviewer = value;
			updateFields();
		}
		public function get imagePath():String {
			return _imagePath;
		}
		public function set imagePath(value:String):void {
			_imagePath = value;
			updateFields();
		}
		public function get vidPath():String {
			return _vidPath;
		}
		public function set vidPath(value:String):void {
			_vidPath = value;
			updateFields();
		}
	}
}