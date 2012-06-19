;(function(window)
{
    function CallStack() {}

	CallStack.INTERVAL_TIME = 500;

	CallStack.getInst = function()
	{
		if(CallStack._inst === undefined)
		{
			CallStack._inst = new CallStack();
		}
		return CallStack._inst;
	};

	var p = CallStack.prototype;

	p.stack = [];
	p.interval = null;

	p.addCall = function(func)
	{
		var obj = {
			func: func,
			params: arguments[1]
		};
		p.stack.push(obj);

		if(p.stack.length == 1) { p.startStack(); }
	}

	p.startStack = function()
	{
		p.interval = setInterval(p.runStack, CallStack.INTERVAL_TIME);
	}

	p.runAll = function ()
	{
		clearInterval(p.interval);
		while (p.stack.length) p.runStack();
	}

	p.runStack = function()
	{
		var call = p.stack.shift();
		var func = call.func;
		var args = call.params;

		window[func].apply(this, args);

		if(p.stack.length == 0) { p.stopStack(); }
	}

	p.stopStack = function()
	{
		clearInterval(p.interval);
	}

	window.CallStack = CallStack.getInst();

	if(window.addEventListener)
		window.addEventListener('unload', window.CallStack.runAll, false);
	if(window.attachEvent)
		window.attachEvent('onunload', window.CallStack.runAll);

}(window));

