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


namespace IRSA.Framework.Services.Administracion.Webpages
{
	/// <summary>
	/// Summary description for Applications.
	/// </summary>
	public class PermissionsPage : DataABMTemplate
	{
		protected Label lblTitle;
		protected Label lblId;
		protected TextBox txtId;
		protected Label lblName;
		protected LinkButton lnkSearch;
		protected LinkButton lnkNew;
		protected LinkButton lnkSave;
		protected LinkButton lnkDelete;
		protected LinkButton lnkCancel;
		protected CustomDataGrid grdMaster;
		protected Label Label1;
		protected DropDownList cboApplication;
		protected TextBox txtDescription;
		protected CustomDataGrid grdDetail;
		protected LinkButton lnkAttrAdd;
		protected HtmlTable tblDetail;


		private string seleccionarURL = "/Administracion/Dialogs/CrearParametro.aspx";


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

				InitializeABM(new PermissionProvider(), grdMaster, lnkNew, lnkDelete,
				              lnkSave, lnkCancel, lnkSearch, txtDescription,
				              txtId, grdDetail);

				AddOnDetailsShowScripLines(
					"page.addControl( new RequiredBox('txtDescription', 'Descripción') );");

				ListControls.Fill(
					cboApplication,
					ApplicationProvider.List(null, new SimpleTransaction(CurrentUser)),
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
			this.grdDetail.DeleteCommand += new DataGridCommandEventHandler(this.grdDetail_DeleteCommand);
			this.lnkAttrAdd.Click += new EventHandler(this.lnkAttrAdd_Click);
			this.MasterItemBeforeSearch += new UAMasterItemEventHandler(this.PermissionsPage_MasterItemBeforeSearch);
			this.MasterItemDeleted += new UAMasterItemEventHandler(this.PermissionsPage_MasterItemDeleted);
			this.MasterItemSaved += new UAMasterItemEventHandler(this.PermissionsPage_MasterItemSaved);
			this.MasterItemLoaded += new UAMasterItemEventHandler(this.PermissionsPage_MasterItemLoaded);
			this.MasterItemBeforeSave += new UAMasterItemEventHandler(this.PermissionsPage_MasterItemBeforeSave);
			this.ReturnedFromDialog += new UADialogReturnEventHandler(this.PermissionsPage_ReturnedFromDialog);
			this.Load += new EventHandler(this.Page_Load);
		}


		#endregion


		private void PermissionsPage_MasterItemLoaded(object sender, UAMasterItemEventArgs e)
		{
			Permission perm = (Permission) e.Element;
			txtDescription.Text = perm.Description;
			txtId.Text = perm.Id.ToString();
			ListControls.SelectByValue(cboApplication, perm.IdApplication);

			grdDetail.DataSource = PermissionParamProvider.List(perm, e.Transaction);
			grdDetail.DataBind();
		}


		private void PermissionsPage_MasterItemBeforeSave(object sender, UAMasterItemEventArgs e)
		{
			Permission perm = (Permission) e.Element;
			perm.Description = txtDescription.Text;
			perm.IdApplication = Convert.ToInt32(cboApplication.SelectedItem.Value);
		}


		private void PermissionsPage_MasterItemSaved(object sender, UAMasterItemEventArgs e)
		{
			Permission p = e.Element as Permission;
			PermissionParamCollection pps = grdDetail.DataSource as PermissionParamCollection;

			if (pps != null)
			{
				foreach (PermissionParam pp in pps)
				{
					pp.IdApplication = p.IdApplication;
					pp.IdPermission = p.Id;
				}

				if (PermissionParamProvider.SetItems(pps, e.Transaction) == null)
					throw (new Exception("Error al grabar los elementos."));
			}
		}


		private void PermissionsPage_MasterItemDeleted(object sender, UAMasterItemEventArgs e)
		{
			Permission p = (Permission) e.Element;
			PermissionParamProvider.Remove(p, e.Transaction);
			GroupPermissionProvider.Remove(p, GroupProvider.List(p, e.Transaction), e.Transaction);
		}


		private void lnkAttrAdd_Click(object sender, EventArgs e)
		{
			OpenDialog(seleccionarURL, 80, 280);
		}


		private void PermissionsPage_ReturnedFromDialog(object sender, UADialogReturnEventArgs e)
		{
			if (e.WasCalledFrom(seleccionarURL))
			{
				string key = string.Empty;

				try
				{
					key = Convert.ToString(e.ReturnValue["key"]);

					if (! IsNull.This(key))
					{
						PermissionParamCollection lst = (PermissionParamCollection) grdDetail.DataSource;

						if (lst == null)
							lst = new PermissionParamCollection();

						int idp = int.MinValue;

						if (grdMaster.SelectedIndex >= 0)
							idp = ((PermissionCollection) grdMaster.DataSource)[grdMaster.SelectedItem.DataSetIndex].Id;

						PermissionParam pp = new PermissionParam(idp, IdApplication, key);

						if (lst.Contains(pp))
							throw (new Exception("El elemento ya existe en la lista."));

						lst.Add(pp);

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


		private void PermissionsPage_MasterItemBeforeSearch(object sender, UAMasterItemEventArgs e)
		{
			Permission p = (Permission) e.Element;

			if (cboApplication.SelectedIndex > 0)
				p.IdApplication = Convert.ToInt32(cboApplication.SelectedItem.Value);

			if (txtDescription.Text != string.Empty)
				p.Description = txtDescription.Text;
		}


		private void grdDetail_DeleteCommand(object source, DataGridCommandEventArgs e)
		{
			PermissionParamCollection lst = (PermissionParamCollection) grdDetail.DataSource;
			lst.RemoveAt(e.Item.DataSetIndex);
			grdDetail.DataSource = lst;
			grdDetail.DataBind();
		}


		private void cboApplication_SelectedIndexChanged(object sender, EventArgs e)
		{
			if (cboApplication.SelectedIndex > 0)
				IdApplication = Convert.ToInt32(cboApplication.SelectedItem.Value);
		}
	}
}