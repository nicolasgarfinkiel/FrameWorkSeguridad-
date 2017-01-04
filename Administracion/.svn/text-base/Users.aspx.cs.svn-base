using System;
using System.Web.UI.WebControls;
using IRSA.Framework.Security;
using IRSA.Framework.Security.Exceptions;
using IRSA.Framework.Security.Model;
using IRSA.Framework.Security.UserData;
using IRSA.Framework.Web.UI.Controls.WebControls;
using IRSA.Framework.Web.UI.Templates;
using IRSA.Framework.Web.UI.Templates.Events;


namespace IRSA.Framework.Services.Administracion.Webpages
{
	/// <summary>
	/// Summary description for Applications.
	/// </summary>
	public class UsersPage : DataABMTemplate
	{
		protected Label lblUserName;
		protected TextBox txtUserName;
		protected Label lblNombre;
		protected TextBox txtNombre;
		protected Label lblApellido;
		protected TextBox txtApellido;
		protected Label lblTel;
		protected TextBox txtTel;
		protected Label lblEmail;
		protected TextBox txtEmail;
		protected Label lblTitle;
		protected LinkButton lnkSearch;
		protected LinkButton lnkNew;
		protected LinkButton lnkSave;
		protected LinkButton lnkDelete;
		protected LinkButton lnkCancel;
		protected CustomDataGrid grdMaster;
		protected LinkButton lnkGetUserData;
		protected Label Label1;


		protected override void Page_Load(object sender, EventArgs e)
		{
			if (! IsPostBack)
			{
				InitializeABM(new UserProvider(), grdMaster, lnkNew, lnkDelete,
				              lnkSave, lnkCancel, lnkSearch, txtUserName, txtNombre,
				              txtApellido, txtTel, txtEmail, lnkGetUserData);

				AddOnDetailsShowScripLines(
					"page.addControl( new RequiredBox('txtUserName', 'Nombre de Usuario') );");

				AddOnDetailsShowScripLines(
					"page.addControl( new RequiredBox('txtNombre', 'Nombre') );");

				AddOnDetailsShowScripLines(
					"page.addControl( new RequiredBox('txtApellido', 'Apellido') );");

				AddOnDetailsShowScripLines(
					"page.addControl( new RequiredBox('txtEmail', 'E-mail') );");

				if (! UserDataProvider.IsUserDataProviderPresent())
					lnkGetUserData.CssClass = "invisible";
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
			this.lnkGetUserData.Click += new System.EventHandler(this.lnkGetUserData_Click);
			this.MasterItemBeforeSearch +=
				new IRSA.Framework.Web.UI.Templates.Events.UAMasterItemEventHandler(this.UsersPage_MasterItemBeforeSearch);
			this.MasterItemLoaded +=
				new IRSA.Framework.Web.UI.Templates.Events.UAMasterItemEventHandler(this.UsersPage_MasterItemLoaded);
			this.MasterItemBeforeSave +=
				new IRSA.Framework.Web.UI.Templates.Events.UAMasterItemEventHandler(this.UsersPage_MasterItemBeforeSave);
			this.Load += new System.EventHandler(this.Page_Load);
		}


		#endregion


		private void UsersPage_MasterItemLoaded(object sender, UAMasterItemEventArgs e)
		{
			User u = (User) e.Element;
			txtUserName.Text = u.UserName;
			txtNombre.Text = u.Nombre;
			txtApellido.Text = u.Apellido;
			txtEmail.Text = u.Email;
			txtTel.Text = u.Telefono;
		}


		private void UsersPage_MasterItemBeforeSave(object sender, UAMasterItemEventArgs e)
		{
			User u = (User) e.Element;
			u.UserName = txtUserName.Text;
			u.Nombre = txtNombre.Text;
			u.Apellido = txtApellido.Text;
			u.Email = txtEmail.Text;
			u.Telefono = txtTel.Text;
		}


		private void UsersPage_MasterItemBeforeSearch(object sender, UAMasterItemEventArgs e)
		{
			User u = (User) e.Element;
			if (txtUserName.Text != string.Empty)
				u.UserName = txtUserName.Text;
			if (txtNombre.Text != string.Empty)
				u.Nombre = txtNombre.Text;
			if (txtApellido.Text != string.Empty)
				u.Apellido = txtApellido.Text;
			if (txtEmail.Text != string.Empty)
				u.Email = txtEmail.Text;
			if (txtTel.Text != string.Empty)
				u.Telefono = txtTel.Text;
		}


		private void lnkGetUserData_Click(object sender, EventArgs e)
		{
			try
			{
				if (txtUserName.Text != string.Empty)
				{
					User u = UserDataProvider.FillUserData(txtUserName.Text);

					txtNombre.Text = u.Nombre;
					txtApellido.Text = u.Apellido;
					txtEmail.Text = u.Email;
					txtTel.Text = u.Telefono;
				}
				else
					throw new ArgumentException("Debe ingresar un nombre de usuario.");
			}
			catch (UserDataProviderException ex)
			{
				ShowError(ex.Message);
			}
		}
	}
}