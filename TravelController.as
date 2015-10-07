package {
	//was xmlAlbumViewer
	import com.greensock.easing.Circ;
	import com.greensock.TweenLite;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.ui.ContextMenuItem;
	
	public class TravelController extends MovieClip {	
		private var xmlLoader:TravelModel;
		private var travelView:TravelView;
		private const XML_PATH:String = "travelXML.xml";
		
		public function TravelController() {
			startXMLLoad();
		}
		private function startXMLLoad():void {
			xmlLoader = new TravelModel();
			xmlLoader.addEventListener(Event.COMPLETE, onXMLLoaded);
			xmlLoader.loadXML(XML_PATH);
		}
		private function onXMLLoaded(e:Event):void {
			travelView = new TravelView(xmlLoader.xml);
			addChild(travelView);
		}
	}
}