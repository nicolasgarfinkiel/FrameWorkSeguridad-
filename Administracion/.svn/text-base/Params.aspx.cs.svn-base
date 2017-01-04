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
	public class ParamsPage : DataABMTemplate
	{
		protected LinkButton lnkCancel;
		protected LinkButton lnkSave;
		protected LinkButton lnkAttrAdd;
		protected Label Label1;
		protected LinkButton lnkNew;
		protected LinkButton lnkDelete;
		protected Label lblTitle;
		protected DropDownList cboApplication;
		protected Label lblId;
		protected CustomDataGrid grdDetail;
		protected LinkButton lnkSearch;
		protected CustomDataGrid grdMaster;
		protected HtmlTable tblDetail;
		protected DropDownList cboGroup;
		protected Label Label2;
		protected DropDownList cboPermission;

		private string seleccionarURL = "/Administracion/Dialogs/SetearParametro.aspx?application={0:D0}&permission={1:D0}";


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

				InitializeABM(new GroupPermissionProvider(), grdMaster, lnkNew, lnkDelete,
				              lnkSave, lnkCancel, lnkSearch, cboGroup, cboPermission,
				              grdDetail, lnkAttrAdd);

				SimpleTransaction trans = new SimpleTransaction(CurrentUser);

				ListControls.Fill(cboApplication, ApplicationProvider.List(
				                                  	null, trans), "Name", "Id", "[Seleccione]");
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
			this.MasterItemBeforeSearch += new UAMasterItemEventHandler(this.ParamsPage_MasterItemBeforeSearch);
			this.MasterItemSaved += new UAMasterItemEventHandler(this.ParamsPage_MasterItemSaved);
			this.MasterItemLoaded += new UAMasterItemEventHandler(this.ParamsPage_MasterItemLoaded);
			this.ABMModeChanged += new ABMModeChangeEventHandler(this.ParamsPage_ABMModeChanged);
			this.ReturnedFromDialog += new UADialogReturnEventHandler(this.ParamsPage_ReturnedFromDialog);
			this.Load += new EventHandler(this.Page_Load);
			this.MasterItemBeforeSave += new UAMasterItemEventHandler(ParamsPage_MasterItemBeforeSave);
		}


		#endregion


		private void ParamsPage_MasterItemLoaded(object sender, UAMasterItemEventArgs e)
		{
			GroupPermission gp = (GroupPermission) e.Element;

			ListControls.SelectByValue(cboGroup, gp.Group.Id);
			ListControls.SelectByValue(cboPermission, gp.Permission.Id);
			ListControls.SelectByValue(cboApplication, gp.Group.IdApplication);

			PermissionValue pv = new PermissionValue();
			pv.IdGroup = gp.Group.Id;
			pv.IdPermission = gp.Permission.Id;
			pv.IdApplication = gp.Group.IdApplication;

			grdDetail.DataSource = PermissionValueProvider.List(pv, e.Transaction);
			grdDetail.DataBind();
		}


		private void ParamsPage_MasterItemSaved(object sender, UAMasterItemEventArgs e)
		{
			GroupPermission gp = (GroupPermission) SelectedItem;
			PermissionValueCollection pvs = (PermissionValueCollection) grdDetail.DataSource;

			foreach (PermissionValue pv in pvs)
			{
				pv.IdApplication = gp.Group.IdApplication;
				pv.IdGroup = gp.Group.Id;
				pv.IdPermission = gp.Permission.Id;
			}

			PermissionValueProvider.Remove(gp.Permission, gp.Group, e.Transaction);
			if (PermissionValueProvider.SetItems(pvs, e.Transaction).Count < 1)
				throw new Exception("No se grabó ningún parámetro.");
		}


		private void cboApplication_SelectedIndexChanged(object sender, EventArgs e)
		{
			try
			{
				IdApplication = int.Parse(cboApplication.SelectedItem.Value);
				grdMaster.Visible = true;

				SimpleTransaction trans = new SimpleTransaction(CurrentUser);

				Group g = new Group();
				g.IdApplication = IdApplication;
				ListControls.Fill(cboGroup, GroupProvider.List(g, trans),
				                  "Name", "Id", "[Seleccione]");

				Permission p = new Permission();
				p.IdApplication = IdApplication;
				ListControls.Fill(cboPermission, PermissionProvider.List(p, trans),
				                  "Description", "Id", "[Seleccione]");
			}
			catch (Exception)
			{
				IdApplication = 0;
				grdMaster.Visible = false;
			}
		}


		private void lnkAttrAdd_Click(object sender, EventArgs e)
		{
			GroupPermission gp = (GroupPermission) SelectedItem;

			OpenDialog(string.Format(
			           	seleccionarURL, gp.Group.IdApplication, gp.Permission.Id), 140, 280);
		}


		private void ParamsPage_ReturnedFromDialog(object sender, UADialogReturnEventArgs e)
		{
			GroupPermission gp = (GroupPermission) SelectedItem;

			if (e.WasCalledFrom(string.Format(
			                    	seleccionarURL, gp.Group.IdApplication, gp.Permission.Id)))
			{
				string skey, svalue;

				try
				{
					skey = Convert.ToString(e.ReturnValue["key"]);
					svalue = Convert.ToString(e.ReturnValue["value"]);

					if ((! IsNull.This(skey)) && (! IsNull.This(svalue)))
					{
						PermissionValueCollection lst = grdDetail.DataSource as PermissionValueCollection;

						if (lst == null)
							lst = new PermissionValueCollection();

						PermissionValue pv = new PermissionValue();

						pv.IdApplication = gp.Group.IdApplication;
						pv.IdGroup = gp.Group.Id;
						pv.IdPermission = gp.Permission.Id;
						pv.Key = skey;
						pv.Value = svalue;

						if (lst.Contains(pv))
							throw (new Exception("El elemento ya existe en la lista."));

						lst.Add(pv);

						grdDetail.DataSource = lst;
						grdDetail.DataBind();
					}
					else
						ShowError("La selección no es válida.");
				}
				catch (Exception ex)
				{
					ShowError("La selección no es válida. " + ex.Message);
				}
			}
		}


		private void grdDetail_DeleteCommand(object source, DataGridCommandEventArgs e)
		{
			PermissionValueCollection lst = grdDetail.DataSource as PermissionValueCollection;
			lst.RemoveAt(e.Item.DataSetIndex);
			grdDetail.DataSource = lst;
			grdDetail.DataBind();
		}


		private void ParamsPage_ABMModeChanged(object sender, ABMModeChangeEventArgs e)
		{
			if (e.Mode != DataABMTemplateMode.ModeNone)
			{
				cboGroup.Enabled = false;
				cboPermission.Enabled = false;
				cboGroup.CssClass = "box_disabled";
				cboPermission.CssClass = "box_disabled";
			}
			else
			{
				cboGroup.Enabled = true;
				cboPermission.Enabled = true;
				cboGroup.CssClass = "box";
				cboPermission.CssClass = "box";
			}
		}


		private void ParamsPage_MasterItemBeforeSearch(object sender, UAMasterItemEventArgs e)
		{
			GroupPermission gp = (GroupPermission) e.Element;
			Group g;
			Permission p;

			if (cboGroup.SelectedIndex > 0)
			{
				g = GroupProvider.GetItem(
					Convert.ToInt32(cboGroup.SelectedItem.Value), e.Transaction);
			}
			else
			{
				g = new Group();
				g.IdApplication = IdApplication;
			}

			if (cboPermission.SelectedIndex > 0)
			{
				p = PermissionProvider.GetItem(
					Convert.ToInt32(cboPermission.SelectedItem.Value), e.Transaction);
			}
			else
			{
				p = new Permission();
				p.IdApplication = IdApplication;
			}

			gp.Group = g;
			gp.Permission = p;
		}


		private void ParamsPage_MasterItemBeforeSave(object sender, UAMasterItemEventArgs e)
		{
			e.SkipOperation();
		}
	}
}