using System;


namespace IRSA.Framework.Services.Webpages
{
	/// <summary>
	/// Summary description for Message.
	/// </summary>
	public class Message : Framework.Web.UI.Webpages.Message
	{
		protected override void Page_Load(object sender, EventArgs e)
		{
			// Put user code to initialize the page here
		}


		#region Web Form Designer generated code


		protected override void OnInit(EventArgs e)
		{
			//
			// CODEGEN: This call is required by the ASP.NET Web Form Designer.
			//
			InitializeComponent();
			base.OnInit(e);
		}


		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
			this.Load += new EventHandler(this.Page_Load);
		}


		#endregion
	}
}