<<<<<<< HEAD
package org.tomasino.external
=======
﻿package org.tomasino.external
>>>>>>> Updated code to reference the instance instead of Class
{
	import flash.external.ExternalInterface;
	import flash.system.Capabilities;

	public class AsyncExternalInterface
	{
		private static var _isExternalInterfaceAvailable:Boolean;
		private static var _isCallStackAvailable:Boolean;

		private static function testExternalInterface():Boolean
		{
			if (!_isExternalInterfaceAvailable)
			{
				if (Capabilities.playerType == "External")
					return false;

				try
				{
					_isExternalInterfaceAvailable = ExternalInterface.available;
					ExternalInterface.addCallback( 'org_tomasino_external_AsyncExnternalInterface_isExternalInterfaceAvailable_test', function():Boolean {return true} );
				}
				catch (e:Error)
				{
					_isExternalInterfaceAvailable = false;
				}
			}
			return true;
		}
		private static var _initExternalInterface:Boolean = testExternalInterface();

		private static function testCallStack():Boolean
		{
			if (_isExternalInterfaceAvailable)
			{
				_isCallStackAvailable = true;
				try
				{
					// Test if CallStack class exists
<<<<<<< HEAD
					ExternalInterface.call( 'CallStack.getInst();');
=======
					ExternalInterface.call( 'CallStack');
>>>>>>> Updated code to reference the instance instead of Class
				}
				catch (e:Error)
				{
					_isCallStackAvailable = false;
				}
			}
			else
			{
				_isCallStackAvailable = false;
			}
			return true;
		}
		private static var _initCallStack:Boolean = testCallStack();

		public static function get available ():Boolean { return _isExternalInterfaceAvailable; }

		public static function call ( functionName:String, ...rest ):void
		{

			if (_isExternalInterfaceAvailable)
			{
    			var params:Array = rest;

				if (_isCallStackAvailable)
				{
<<<<<<< HEAD
					ExternalInterface.call ( 'CallStack.getInst().addCall', functionName, params);
=======
					ExternalInterface.call ( 'CallStack.addCall', functionName, params);
>>>>>>> Updated code to reference the instance instead of Class
				}
				else
				{
					var nameArray:Array = [ functionName ];
					var sendParams:Array = nameArray.concat(params);
					ExternalInterface.call.apply( null, sendParams );
				}
			}
			else
			{
				// Do nothing. No external Interface
			}
		}
	}
}
<<<<<<< HEAD
=======

>>>>>>> Updated code to reference the instance instead of Class
