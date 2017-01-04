//Class AJAXConnection

	// Constructor *********************************

	AJAXConnection = function(_id, _ParseResponseFunction, _serviceURL)
	{
		this._id = _id;
		this._ParseResponse = _ParseResponseFunction;
		this._Open(_serviceURL);
	}
	
	
	// Properties **********************************

	AJAXConnection.prototype._id = null;
	AJAXConnection.prototype._XMLHttpRequest = null;
	AJAXConnection.prototype._ParseResponse = null;
	AJAXConnection.prototype._msxml_progid = [
		'MSXML2.XMLHTTP.5.0',
		'MSXML2.XMLHTTP.4.0',
		'MSXML2.XMLHTTP.3.0',
		'MSXML2.XMLHTTP',
		'Microsoft.XMLHTTP' ];

		
	// Methods *************************************

	AJAXConnection.prototype.Execute = function(_params)
	{
		if (_params != null)
		{
			this._XMLHttpRequest.setRequestHeader("User-Agent", "MyUserAgent");
			this._XMLHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			this._XMLHttpRequest.setRequestHeader("Content-Length", new String(_params).length.toString());
		}
		
		this._XMLHttpRequest.send(_params);
	}

	AJAXConnection.prototype.ExecuteSOAP = function(_xmlparams, _soapAction)
	{
		this._XMLHttpRequest.setRequestHeader("User-Agent", "MyUserAgent");
		this._XMLHttpRequest.setRequestHeader("Content-Type", "text/xml");
		this._XMLHttpRequest.setRequestHeader("Content-Length", new String(_xmlparams).length.toString());
		this._XMLHttpRequest.setRequestHeader("SOAPAction", _soapAction);

		this._XMLHttpRequest.send(_xmlparams);
	}
	
	AJAXConnection.prototype._Open = function(_serviceURL)
	{
		this._XMLHttpRequest = this._GetConnection();

		this._XMLHttpRequest.open("POST", _serviceURL, true);
		
		this._XMLHttpRequest.onreadystatechange = this._GetOnReadyStateChangeCallback();
	}
		
	AJAXConnection.prototype._GetOnReadyStateChangeCallback = function()
	{
		var parentInstance = this;
		
		return (
			function()
			{
				if (parentInstance._XMLHttpRequest.readyState == 4)
				{
					if (parentInstance._XMLHttpRequest.status == 200)
						parentInstance._ParseResponse(
							parentInstance._id,
							parentInstance._XMLHttpRequest
						);
				}
			}
		);
	}

	AJAXConnection.prototype._GetConnection = function()
	{
		var req = null;

		if (window.XMLHttpRequest)
			req = new XMLHttpRequest();
		else if (window.ActiveXObject)
		{
			for(var i=0; i<this._msxml_progid.length; ++i)
			{
				try
				{
					req = new ActiveXObject(this._msxml_progid[i]);
				}
				catch(e) {}
			}
		}
		return (req);
	}
	
	AJAXConnection.prototype.Abort = function()
	{
		if ( (this._XMLHttpRequest.readyState > 0)
			&& (this._XMLHttpRequest.readyState < 4) )
			this._XMLHttpRequest.abort();
	}

	AJAXConnection.prototype.Dispose = function()
	{
		this._XMLHttpRequest = null;
	}
	

//End Class AJAXConnection