﻿package
{
	import flash.display.Sprite;
	import org.tomasino.external.AsyncExternalInterface;

	public class AsyncExample extends Sprite
	{

		public function AsyncExample ()
		{
			// constructor code

			AsyncExternalInterface.call ( 'testFunction', 'Call 1' );
			AsyncExternalInterface.call ( 'testFunction', 'Call 2' );
			AsyncExternalInterface.call ( 'testFunction', 'Call 3' );
			AsyncExternalInterface.call ( 'testFunction');
			trace (1);
			trace (2);
			trace (3);
		}

	}

}
