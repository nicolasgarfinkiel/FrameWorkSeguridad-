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
	/// Summary description for seleccionarAtributo.
	/// </summary>
	public class SeleccionarGrupo : DialogTemplate
	{
		protected Label lblAtributo;
		protected DropDownList cboGrupo;


		protected override void Page_Load(object sender, EventArgs e)
		{
			if (! IsPostBack)
			{
				SimpleTransaction trans = new SimpleTransaction(CurrentUser);
				trans.IdApplication = Convert.ToInt32(Request["application"]);

				Group g = new Group();
				g.IdApplication = trans.IdApplication;

				ListControls.Fill(cboGrupo, GroupProvider.List(g, trans),
				                  "Name", "Id", "[Grupo]");
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