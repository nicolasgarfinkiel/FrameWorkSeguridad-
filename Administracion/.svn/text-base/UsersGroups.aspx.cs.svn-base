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
	public class UsersGroupsPage : DataABMTemplate
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
		protected TextBox txtName;
		protected CustomDataGrid grdDetail;
		protected LinkButton lnkSearch;
		protected CustomDataGrid grdMaster;
		protected HtmlTable tblDetail;
		protected CheckBox chkEnabledUsers;

		private string seleccionarURL = "/Administracion/Dialogs/SeleccionarGrupo.aspx?application=";


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

				InitializeABM(new UserProvider(), grdMaster, lnkNew, lnkDelete, lnkSave,
				              lnkCancel, lnkSearch, txtName, grdDetail, lnkAttrAdd);


				ListControls.Fill(cboApplication, ApplicationProvider.List(
				                                  	null, new SimpleTransaction(CurrentUser)), "Name", "Id", "[Seleccione]");
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
			this.cboApplication.SelectedIndexChanged += new System.EventHandler(this.cboApplication_SelectedIndexChanged);
			this.lnkAttrAdd.Click += new System.EventHandler(this.lnkAttrAdd_Click);
			this.MasterItemBeforeSearch +=
				new IRSA.Framework.Web.UI.Templates.Events.UAMasterItemEventHandler(this.UsersGroupsPage_MasterItemBeforeSearch);
			this.MasterItemSaved +=
				new IRSA.Framework.Web.UI.Templates.Events.UAMasterItemEventHandler(this.UsersPage_MasterItemSaved);
			this.MasterItemLoaded +=
				new IRSA.Framework.Web.UI.Templates.Events.UAMasterItemEventHandler(this.UsersPage_MasterItemLoaded);
			this.ABMModeChanged +=
				new IRSA.Framework.Web.UI.Templates.Events.ABMModeChangeEventHandler(this.UsersGroupsPage_ABMModeChanged);
			this.ReturnedFromDialog +=
				new IRSA.Framework.Web.UI.Templates.Events.UADialogReturnEventHandler(this.UsersPage_ReturnedFromDialog);
			this.Load += new System.EventHandler(this.Page_Load);
			this.grdDetail.DeleteCommand += new DataGridCommandEventHandler(grdDetail_DeleteCommand);
		}


		#endregion


		private void UsersPage_MasterItemLoaded(object sender, UAMasterItemEventArgs e)
		{
			User u = (User) e.Element;
			txtName.Text = u.UserName;
			grdDetail.DataSource = GroupProvider.List(u, e.Transaction);
			grdDetail.DataBind();
		}


		private void UsersPage_MasterItemSaved(object sender, UAMasterItemEventArgs e)
		{
			if (IdApplication > 0)
			{
				UsersGroupCollection usgs = new UsersGroupCollection();
				User u = (User) e.Element;

				foreach (Group g in (GroupCollection) grdDetail.DataSource)
					usgs.Add(new UserGroup(u, g));

				UserGroupProvider.Remove(
					u, GroupProvider.List(u, e.Transaction), e.Transaction);

				if (UserGroupProvider.SetItems(usgs, e.Transaction) == null)
					throw (new Exception("Error al grabar los elementos."));
			}
		}


		private void cboApplication_SelectedIndexChanged(object sender, EventArgs e)
		{
			try
			{
				IdApplication = int.Parse(cboApplication.SelectedItem.Value);
				grdMaster.Visible = true;
			}
			catch (Exception)
			{
				IdApplication = 0;
				grdMaster.Visible = false;
			}
		}


		private void lnkAttrAdd_Click(object sender, EventArgs e)
		{
			OpenDialog(seleccionarURL + IdApplication.ToString(), 100, 280);
		}


		private void UsersPage_ReturnedFromDialog(object sender, UADialogReturnEventArgs e)
		{
			if (e.WasCalledFrom(seleccionarURL + IdApplication.ToString()))
			{
				int id;
				try
				{
					id = Convert.ToInt32(e.ReturnValue["group"]);

					if (! IsNull.This(id))
					{
						GroupCollection lst = grdDetail.DataSource as GroupCollection;

						if (lst == null)
							lst = new GroupCollection();

						SimpleTransaction trans = new SimpleTransaction(CurrentUser);
						trans.IdApplication = IdApplication;
						Group g = GroupProvider.GetItem(id, trans);

						if (lst.Contains(g))
							throw (new Exception("El elemento ya existe en la lista."));

						lst.Add(g);

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
			GroupCollection lst = (GroupCollection) grdDetail.DataSource;
			lst.RemoveAt(e.Item.DataSetIndex);
			grdDetail.DataSource = lst;
			grdDetail.DataBind();
		}


		private void UsersGroupsPage_ABMModeChanged(object sender, ABMModeChangeEventArgs e)
		{
			if (e.Mode != DataABMTemplateMode.ModeNone)
			{
				txtName.ReadOnly = true;
				txtName.CssClass = "box_disabled";
				chkEnabledUsers.Visible = false;
			}
			else
			{
				txtName.ReadOnly = false;
				txtName.CssClass = "box";
				chkEnabledUsers.Visible = true;
			}
		}


		private void UsersGroupsPage_MasterItemBeforeSearch(object sender, UAMasterItemEventArgs e)
		{
			User u = (User) e.Element;
			if (txtName.Text != string.Empty)
				u.UserName = txtName.Text;
			{
				if ((chkEnabledUsers.Visible)
				    && (chkEnabledUsers.Checked))
				{
					UserCollection users = new UserCollection();
					Group gfilter = new Group();
					gfilter.IdApplication = IdApplication;

					foreach (Group g in GroupProvider.List(gfilter, e.Transaction))
					{
						foreach (User user in UserProvider.List(g, e.Transaction))
						{
							if (! users.Contains(user))
								users.Add(user);
						}
					}

					grdMaster.DataSource = users;
					e.SkipOperation();
				}
			}
		}
	}
}