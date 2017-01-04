using System;
using IRSA.Framework.Web.UI.Templates;


namespace IRSA.Framework.Services
{
	/// <summary>
	/// Summary description for test.
	/// </summary>
	public class test : PageTemplate
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
			this.Load += new System.EventHandler(this.Page_Load);
		}


		#endregion
	}
}