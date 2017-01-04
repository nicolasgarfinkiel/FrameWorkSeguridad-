//Class DialogOpener

	// Constructor *********************************
	
	DialogOpener = function()
	{
	}
	
	
	// Properties **********************************
	
	DialogOpener.prototype.windowHandle = null;
	DialogOpener.prototype.url = "/dialog.aspx";
	DialogOpener.prototype.contents = null;
	DialogOpener.prototype.returnValue = null;
	
	DialogOpener.prototype.title = "Administraci&oacute;n de Usuarios";
	DialogOpener.prototype.height = "240px";
	DialogOpener.prototype.width = "400px";
	DialogOpener.prototype.center = "yes";
	DialogOpener.prototype.resizable = "no";
	DialogOpener.prototype.status = "no";
	DialogOpener.prototype.help = "no";
	DialogOpener.prototype.edge = "raised";
	DialogOpener.prototype.type = 0;
	
	// Constants
	DialogOpener.prototype.OK_ONLY = 0;
	DialogOpener.prototype.OK_CANCEL = 1;
	DialogOpener.prototype.YES_NO = 2;

	
	// Methods *************************************
	
	DialogOpener.prototype.onLoad = function()
	{
	}
	
	DialogOpener.prototype.getOnDialogLoad = function()
	{
		var parentInstance = this;
		
		return (
			function()
			{
				var doc = parentInstance.windowHandle.document;
				doc.title = parentInstance.title;
				doc.getElementById("thTitle").innerHTML = parentInstance.title;
				
				switch (parentInstance.type)
				{
					case parentInstance.OK_CANCEL:
						break;
					case parentInstance.YES_NO:
						doc.getElementById("cmdOKText").innerText = "Si";
						doc.getElementById("cmdCancelText").innerText = "No";
						break;
					default: //OK_ONLY
						doc.getElementById("cmdCancel").style.visibility = "hidden";
						doc.getElementById("cmdCancel").style.display = "none";
						break;
				}
				
				if (parentInstance.contents != null)
				{
					var shtml = "";
					var tdc = doc.getElementById("tdContents");
					for (var i=0; i<parentInstance.contents.Count(); i++)
						shtml += 
							parentInstance.contents.Get(
								parentInstance.contents.Keys.Get(i)
							).outerHTML + "<br>";
					
					tdc.innerHTML = shtml;
				}
			}
		);
	}

	DialogOpener.prototype.dispose = function()
	{
		this.windowHandle = null;
		this.contents = null;
	}
	
	DialogOpener.prototype.Show = function()
	{
		this.returnValue = window.showModalDialog( this.url, this,
			"dialogHeight:" + this.height +
			"; dialogWidth:" + this.width +
			"; center:" + this.center +
			"; resizable:" + this.resizable +
			"; status:" + this.status +
			"; help:" + this.help +
			"; edge:" + this.edge + ";");

	}
	
	DialogOpener.prototype.setWindowHandle = function(wh)
	{
		wh.onload = this.getOnDialogLoad();
		this.windowHandle = wh;
	}
	
	DialogOpener.prototype.onCancelClick = function()
	{
		try
		{
			this.windowHandle.Cancel_onClick(this);
		}
		catch(e) {}
		this.windowHandle.close();
	}
	
	DialogOpener.prototype.onOkClick = function()
	{
		try
		{
			this.windowHandle.OK_onClick(this);
		}
		catch(e) {}
		this.windowHandle.close();
	}
	
	DialogOpener.prototype.toString = function()
	{
		return ("DialogOpener object");
	}

		
//End Class DialogOpener
