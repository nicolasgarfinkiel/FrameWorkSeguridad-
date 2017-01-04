using System;
using System.Web.UI.WebControls;
using IRSA.Framework.Security;
using IRSA.Framework.Security.Transactions;
using IRSA.Framework.Web.UI.Controls;
using IRSA.Framework.Web.UI.Templates;


namespace IRSA.Framework.Services.Administracion
{
	/// <summary>
	/// Summary description for seleccionarAtributo.
	/// </summary>
	public class seleccionarGrupo : DialogTemplate
	{
		protected Label lblAtributo;
		protected DropDownList cboGrupo;


		protected override void Page_Load(object sender, EventArgs e)
		{
			if (! IsPostBack)
			{
				SimpleSecurityTransaction trans = new SimpleSecurityTransaction(CurrentUser);
				trans.IdApplication = Convert.ToInt32(Request["application"]);
				ListControls.Fill(cboGrupo, GroupProvider.List(trans),
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