<%@ Register TagPrefix="cc1" Namespace="IRSA.Framework.Web.UI.Controls.WebControls" Assembly="IRSA.Framework.Web.UI" %>
<%@ Page language="c#" Codebehind="Applications.aspx.cs" AutoEventWireup="false" Inherits="IRSA.Framework.Services.Administracion.ApplicationsPage" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>Applications</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
			<table class="outer">
				<tr>
					<td class="container">
						<table class="window" width="100%">
							<tr>
								<td><table width="100%">
										<thead>
											<tr>
												<th>
													<asp:label id="lblTitle" runat="server" CssClass="label">Aplicaciones</asp:label></th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td align="center" valign="middle"><table>
														<tr>
															<td style="HEIGHT: 17px" align="right"><asp:label id="lblId" runat="server" cssclass="label">Código</asp:label></td>
															<td style="HEIGHT: 17px" align="left"><asp:TextBox id="txtId" runat="server" CssClass="box_disabled" Width="240px" ReadOnly="true"></asp:TextBox></td>
														</tr>
														<tr>
															<td style="HEIGHT: 15px" align="right"><asp:label id="lblName" runat="server" cssclass="label">Nombre</asp:label></td>
															<td style="HEIGHT: 15px" align="left"><asp:TextBox id="txtName" runat="server" CssClass="box" Width="240px"></asp:TextBox></td>
														</tr>
													</table>
												</td>
											</tr>
										</tbody>
										<tfoot>
											<tr>
												<td id="tdtoolbar" align="center">
													<asp:linkbutton id="lnkSearch" runat="server" cssclass="button" width="80px"><img src="/images/icons/icon_search.gif">Buscar</asp:linkbutton>&nbsp;
													<asp:linkbutton id="lnkNew" runat="server" cssclass="button" width="80px"><img src="/images/icons/icon_new.gif">Nuevo</asp:linkbutton>&nbsp;
													<asp:linkbutton id="lnkSave" runat="server" cssclass="button" width="80px"><img src="/images/icons/icon_save.gif">Grabar</asp:linkbutton>&nbsp;
													<asp:linkbutton id="lnkDelete" runat="server" cssclass="button" width="80px"><img src="/images/icons/icon_delete.gif">Borrar</asp:linkbutton>&nbsp;
													<asp:linkbutton id="lnkCancel" runat="server" cssclass="button" width="80px"><img src="/images/icons/icon_cancel.gif">Cancelar</asp:linkbutton>
												</td>
											</tr>
										</tfoot>
									</table>
								</td>
							</tr>
							<tr>
								<td><cc1:customdatagrid id="grdMaster" runat="server" cssclass="grid" width="100%" autogeneratecolumns="False"
										allowpaging="True" useaccessibleheader="True" AllowSorting="True" PageSize="15">
										<SelectedItemStyle CssClass="selected"></SelectedItemStyle>
										<AlternatingItemStyle CssClass="rowimpar"></AlternatingItemStyle>
										<ItemStyle CssClass="rowpar"></ItemStyle>
										<HeaderStyle CssClass="header"></HeaderStyle>
										<Columns>
											<asp:BoundColumn DataField="Id" SortExpression="Id" HeaderText="C&#243;digo"></asp:BoundColumn>
											<asp:BoundColumn DataField="Name" SortExpression="Name" HeaderText="Nombre"></asp:BoundColumn>
											<asp:TemplateColumn HeaderText="Editar">
												<HeaderStyle Width="24px"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center"></ItemStyle>
												<ItemTemplate>
													<asp:linkbutton id="Linkbutton1" runat="server" commandname="Select" causesvalidation="false" CssClass="iconlink">
														<img src="/images/icons/icon_edit.gif"></asp:linkbutton>
												</ItemTemplate>
											</asp:TemplateColumn>
										</Columns>
										<PagerStyle CssClass="footer"></PagerStyle>
									</cc1:customdatagrid></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
