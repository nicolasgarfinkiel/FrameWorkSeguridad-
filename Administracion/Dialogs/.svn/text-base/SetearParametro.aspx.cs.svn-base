using System;
using System.Web.UI.WebControls;
using IRSA.Framework.Data.Transactions;
using IRSA.Framework.Security;
using IRSA.Framework.Security.Model;
using IRSA.Framework.Web.UI.Controls;
using IRSA.Framework.Web.UI.Templates;


namespace IRSA.Framework.Services.Administracion.Dialogs
{
	/// <summary>
	/// Summary description for SetearParametro.
	/// </summary>
	public class SetearParametro : DialogTemplate
	{
		protected Label lblAtributo;
		protected DropDownList cboKey;
		protected Label Label1;
		protected TextBox txtValue;


		protected override void Page_Load(object sender, EventArgs e)
		{
			if (! IsPostBack)
			{
				int idap = Convert.ToInt32(Request["application"]);
				int idper = Convert.ToInt32(Request["permission"]);

				SimpleTransaction trans = new SimpleTransaction(CurrentUser);
				trans.IdApplication = idap;

				PermissionParam pp = new PermissionParam();
				pp.IdApplication = idap;
				pp.IdPermission = idper;

				ListControls.Fill(cboKey, PermissionParamProvider.List(
				                          	pp, trans), "Key", "Key", "[Parámetro]");
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