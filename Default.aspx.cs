using System;
using IRSA.Framework.Data.Transactions;
using IRSA.Framework.Security;
using IRSA.Framework.Security.Exceptions;
using IRSA.Framework.Web.UI.Controls.WebControls;
using IRSA.Framework.Web.UI.Templates;


namespace IRSA.Framework.Services.Webpages
{
	/// <summary>
	/// Summary description for Default.
	/// </summary>
	public partial class Default : PageTemplate
	{
		protected SimpleMenuBar smbMenu;


		protected override void Page_Load(object sender, EventArgs e)
		{
			try
			{
				SimpleTransaction trans = new SimpleTransaction(CurrentUser);
				UserProvider.CheckPermission(
					CurrentUser, PermissionProvider.GetItem(1, trans), trans);
			}
			catch (SecurityException ex)
			{
				ExceptionHandling(ex);
			}

			if (! IsPostBack)
			{
				IncludeScript("/java/ui/controls/ajax/UserLabel.js");

				AddOnLoadScriptLines(
					"page.addControl( new UserLabel('lblUserName') );");
			}
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