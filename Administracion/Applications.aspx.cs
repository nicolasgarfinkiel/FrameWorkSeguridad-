using System;
using System.Web.UI.WebControls;
using IRSA.Framework.Security;
using IRSA.Framework.Security.Model;
using IRSA.Framework.Web.UI.Controls.WebControls;
using IRSA.Framework.Web.UI.Templates;
using IRSA.Framework.Web.UI.Templates.Events;


namespace IRSA.Framework.Services.Administracion
{
	/// <summary>
	/// Summary description for Applications.
	/// </summary>
	public class ApplicationsPage : DataABMTemplate
	{
		protected Label lblTitle;
		protected Label lblId;
		protected TextBox txtId;
		protected Label lblName;
		protected TextBox txtName;
		protected LinkButton lnkSearch;
		protected LinkButton lnkNew;
		protected LinkButton lnkSave;
		protected LinkButton lnkDelete;
		protected LinkButton lnkCancel;
		protected CustomDataGrid grdMaster;


		protected override void Page_Load(object sender, EventArgs e)
		{
			if (! IsPostBack)
			{
				InitializeABM(new ApplicationProvider(), grdMaster, lnkNew,
				              lnkDelete, lnkSave, lnkCancel, lnkSearch, txtName, txtId);

				AddOnDetailsShowScripLines(
					"page.addControl( new RequiredBox('txtName', 'Nombre de Aplicación') );");
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
			this.MasterItemBeforeSearch += new UAMasterItemEventHandler(this.ApplicationsPage_MasterItemBeforeSearch);
			this.MasterItemDeleted += new UAMasterItemEventHandler(this.ApplicationsPage_MasterItemDeleted);
			this.MasterItemSaved += new UAMasterItemEventHandler(this.ApplicationsPage_MasterItemSaved);
			this.MasterItemLoaded += new UAMasterItemEventHandler(this.ApplicationsPage_MasterItemLoaded);
			this.MasterItemBeforeSave += new UAMasterItemEventHandler(this.ApplicationsPage_MasterItemBeforeSave);
			this.Load += new EventHandler(this.Page_Load);
		}


		#endregion


		private void ApplicationsPage_MasterItemLoaded(object sender, UAMasterItemEventArgs e)
		{
			Application app = (Application) e.Element;
			txtName.Text = app.Name;
			txtId.Text = app.Id.ToString();
		}


		private void ApplicationsPage_MasterItemBeforeSave(object sender, UAMasterItemEventArgs e)
		{
			Application app = (Application) e.Element;
			app.Name = txtName.Text;
		}


		private void ApplicationsPage_MasterItemSaved(object sender, UAMasterItemEventArgs e)
		{
		}


		private void ApplicationsPage_MasterItemDeleted(object sender, UAMasterItemEventArgs e)
		{
		}


		private void ApplicationsPage_MasterItemBeforeSearch(object sender, UAMasterItemEventArgs e)
		{
			Application app = (Application) e.Element;

			if (txtId.Text != string.Empty)
				app.Id = Convert.ToInt32(txtId.Text);

			if (txtName.Text != string.Empty)
				app.Name = txtName.Text;
		}
	}
}