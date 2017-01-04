using System;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using IRSA.Framework.Data.Transactions;
using IRSA.Framework.Security;
using IRSA.Framework.Security.Model;
using IRSA.Framework.Security.Model.Collections;
using IRSA.Framework.Web.UI.Controls;
using IRSA.Framework.Web.UI.Controls.WebControls;
using IRSA.Framework.Web.UI.Templates;
using IRSA.Framework.Web.UI.Templates.Events;


namespace IRSA.Framework.Services.Administracion
{
	/// <summary>
	/// Summary description for Groups.
	/// </summary>
	public class GroupsPage : DataABMTemplate
	{
		protected LinkButton lnkCancel;
		protected LinkButton lnkSave;
		protected LinkButton lnkNew;
		protected LinkButton lnkDelete;
		protected Label lblName;
		protected TextBox txtDescription;
		protected LinkButton lnkAttrAdd;
		protected Label lblTitle;
		protected Label Label1;
		protected DropDownList cboApplication;
		protected Label lblId;
		protected CustomDataGrid grdDetail;
		protected LinkButton lnkSearch;
		protected CustomDataGrid grdMaster;
		protected HtmlTable tblDetail;
		protected TextBox txtName;

		private string seleccionarURL = "/Administracion/Dialogs/SeleccionarPermiso.aspx?application=";


		protected override void Page_Load(object sender, EventArgs e)
		{
			AddOnLoadScriptLines(
				"page.addControl( new RequiredCombo('cboApplication', 'Aplicaciones') );");

			if (! IsPostBack)
			{
				if (Request["application"] != null)
				{
					ListControls.SelectByValue(cboApplication, Request["application"]);
					cboApplication.Enabled = false;
				}

				InitializeABM(new GroupProvider(), grdMaster, lnkNew, lnkDelete,
				              lnkSave, lnkCancel, lnkSearch, txtName,
				              txtDescription, grdDetail);

				AddOnDetailsShowScripLines(
					"page.addControl( new RequiredBox('txtName', 'Nombre de Grupo') );");

				ListControls.Fill(cboApplication, ApplicationProvider.List(
				                                  	null, new SimpleTransaction(CurrentUser)),
				                  "Name", "Id", "[Seleccione]");
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
			this.cboApplication.SelectedIndexChanged += new EventHandler(this.cboApplication_SelectedIndexChanged);
			this.lnkAttrAdd.Click += new EventHandler(this.lnkAttrAdd_Click);
			this.grdDetail.DeleteCommand += new DataGridCommandEventHandler(this.grdDetail_DeleteCommand);
			this.MasterItemBeforeSearch += new UAMasterItemEventHandler(this.GroupsPage_MasterItemBeforeSearch);
			this.MasterItemDeleted += new UAMasterItemEventHandler(this.GroupsPage_MasterItemDeleted);
			this.MasterItemSaved += new UAMasterItemEventHandler(this.GroupsPage_MasterItemSaved);
			this.MasterItemLoaded += new UAMasterItemEventHandler(this.GroupsPage_MasterItemLoaded);
			this.MasterItemBeforeSave += new UAMasterItemEventHandler(this.GroupsPage_MasterItemBeforeSave);
			this.ReturnedFromDialog += new UADialogReturnEventHandler(this.GroupsPage_ReturnedFromDialog);
			this.Load += new EventHandler(this.Page_Load);
		}


		#endregion


		private void GroupsPage_MasterItemLoaded(object sender, UAMasterItemEventArgs e)
		{
			Group grp = (Group) e.Element;
			txtName.Text = grp.Name;
			txtDescription.Text = grp.Description;
			ListControls.SelectByValue(cboApplication, grp.IdApplication);

			grdDetail.DataSource = PermissionProvider.List(grp, e.Transaction);
			grdDetail.DataBind();
		}


		private void GroupsPage_MasterItemBeforeSave(object sender, UAMasterItemEventArgs e)
		{
			Group grp = (Group) e.Element;
			grp.Name = txtName.Text;
			grp.Description = txtDescription.Text;
			grp.IdApplication = Convert.ToInt32(cboApplication.SelectedItem.Value);
		}


		private void GroupsPage_MasterItemSaved(object sender, UAMasterItemEventArgs e)
		{
			GroupsPermissionCollection gsps = new GroupsPermissionCollection();
			Group g = (Group) e.Element;

			if (grdDetail.DataSource != null)
			{
				foreach (Permission p in (PermissionCollection) grdDetail.DataSource)
					gsps.Add(new GroupPermission(g, p));

				GroupPermissionProvider.Remove(
					g, PermissionProvider.List(g, e.Transaction), e.Transaction);

				if (GroupPermissionProvider.SetItems(gsps, e.Transaction) == null)
					throw (new Exception("Error al grabar los elementos."));
			}
		}


		private void GroupsPage_MasterItemDeleted(object sender, UAMasterItemEventArgs e)
		{
			Group g = (Group) e.Element;

			GroupPermissionProvider.Remove(
				g, PermissionProvider.List(g, e.Transaction), e.Transaction);
		}


		private void lnkAttrAdd_Click(object sender, EventArgs e)
		{
			OpenDialog(seleccionarURL + IdApplication.ToString(), 100, 280);
		}


		private void GroupsPage_ReturnedFromDialog(object sender, UADialogReturnEventArgs e)
		{
			if (e.WasCalledFrom(seleccionarURL + IdApplication.ToString()))
			{
				try
				{
					int id = Convert.ToInt32(e.ReturnValue["permission"]);

					if (! IsNull.This(id))
					{
						PermissionCollection lst = (PermissionCollection) grdDetail.DataSource;

						if (lst == null)
							lst = new PermissionCollection();

						SimpleTransaction trans = new SimpleTransaction(CurrentUser);
						trans.IdApplication = IdApplication;
						Permission p = PermissionProvider.GetItem(id, trans);

						if (lst.Contains(p))
							throw (new Exception("El elemento ya existe en la lista."));

						lst.Add(p);

						grdDetail.DataSource = lst;
						grdDetail.DataBind();
					}
				}
				catch (Exception ex)
				{
					ShowError("La selección no es válida. " + ex.Message);
				}
			}
		}


		private void grdDetail_DeleteCommand(object source, DataGridCommandEventArgs e)
		{
			PermissionCollection lst = grdDetail.DataSource as PermissionCollection;
			lst.RemoveAt(e.Item.DataSetIndex);
			grdDetail.DataSource = lst;
			grdDetail.DataBind();
		}


		private void GroupsPage_MasterItemBeforeSearch(object sender, UAMasterItemEventArgs e)
		{
			Group grp = (Group) e.Element;

			if (txtName.Text != string.Empty)
				grp.Name = txtName.Text;

			if (txtDescription.Text != string.Empty)
				grp.Description = txtDescription.Text;

			grp.IdApplication = Convert.ToInt32(cboApplication.SelectedItem.Value);
		}


		private void cboApplication_SelectedIndexChanged(object sender, EventArgs e)
		{
			if (cboApplication.SelectedIndex > 0)
				IdApplication = Convert.ToInt32(cboApplication.SelectedItem.Value);
		}
	}
}