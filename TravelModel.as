package  {
	//was XMLLoader
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;

	public class TravelModel extends EventDispatcher{
		private var xmlLoader:URLLoader;
		public var xml:XML;

		public function TravelModel() {}
		
		public function loadXML(fileName:String):void{
			xmlLoader = new URLLoader();
			xmlLoader.addEventListener(Event.COMPLETE, processXml);
			xmlLoader.load(new URLRequest(fileName));
		}
		// When the XML is loaded into the URLLoader, this method is called
		private function processXml(e:Event):void {
			XML.ignoreWhitespace = true;
			xml = new XML(e.target.data);// Store the XML data that is in the URLLoader into your xml variable			
			// Dispatch an event that will let your main document class that it is safe to start using the XML data.
			dispatchEvent(new Event(Event.COMPLETE));
			trace (xml);
		}
	}
}