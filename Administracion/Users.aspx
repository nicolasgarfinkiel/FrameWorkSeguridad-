<%@ Register TagPrefix="cc1" Namespace="IRSA.Framework.Web.UI.Controls.WebControls" Assembly="IRSA.Framework.Web.UI" %>
<%@ Page language="c#" Codebehind="Users.aspx.cs" AutoEventWireup="false" Inherits="IRSA.Framework.Services.Administracion.Webpages.UsersPage" %>
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
													<asp:label id="lblTitle" runat="server" CssClass="label">Usuarios</asp:label></th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td align="center" valign="middle"><table>
														<tr>
															<td align="right">
																<asp:label id="lblUserName" runat="server" cssclass="label">Nombre de Usuario</asp:label></td>
															<td align="left">
																<asp:textbox id="txtUserName" runat="server" width="200px" cssclass="box"></asp:textbox></td>
														</tr>
														<tr>
															<td align="right"><asp:label id="lblNombre" runat="server" cssclass="label">Nombre</asp:label></td>
															<td align="left"><asp:textbox id="txtNombre" runat="server" width="200px" cssclass="box"></asp:textbox></td>
														</tr>
														<tr>
															<td align="right"><asp:label id="lblApellido" runat="server" cssclass="label">Apellido</asp:label></td>
															<td align="left"><asp:textbox id="txtApellido" runat="server" width="200px" cssclass="box"></asp:textbox></td>
														</tr>
														<tr>
															<td align="right"><asp:label id="lblTel" runat="server" cssclass="label">Teléfono</asp:label></td>
															<td align="left"><asp:textbox id="txtTel" runat="server" width="200px" cssclass="box"></asp:textbox></td>
														</tr>
														<tr>
															<td align="right"><asp:label id="lblEmail" runat="server" cssclass="label">E-Mail</asp:label></td>
															<td align="left"><asp:textbox id="txtEmail" runat="server" width="200px" cssclass="box"></asp:textbox></td>
														</tr>
														<tr>
															<td colspan="2" align="right">
																<asp:LinkButton id="lnkGetUserData" runat="server" CssClass="button" Width="128px">Traer datos externos</asp:LinkButton></td>
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
										allowpaging="True" useaccessibleheader="True" AllowSorting="True" PageSize="13">
										<SelectedItemStyle CssClass="selected"></SelectedItemStyle>
										<AlternatingItemStyle CssClass="rowimpar"></AlternatingItemStyle>
										<ItemStyle CssClass="rowpar"></ItemStyle>
										<HeaderStyle CssClass="header"></HeaderStyle>
										<Columns>
											<asp:BoundColumn DataField="Id" SortExpression="Id" HeaderText="C&#243;digo"></asp:BoundColumn>
											<asp:BoundColumn DataField="UserName" SortExpression="UserName" HeaderText="Usuario"></asp:BoundColumn>
											<asp:BoundColumn DataField="Nombre" SortExpression="Nombre" HeaderText="Nombre"></asp:BoundColumn>
											<asp:BoundColumn DataField="Apellido" SortExpression="Apellido" HeaderText="Apellido"></asp:BoundColumn>
											<asp:BoundColumn DataField="Email" SortExpression="Email" HeaderText="Email"></asp:BoundColumn>
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
