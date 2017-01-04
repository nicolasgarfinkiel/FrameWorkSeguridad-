<%@ Page language="c#" Codebehind="Params.aspx.cs" AutoEventWireup="false" Inherits="IRSA.Framework.Services.Administracion.Webpages.ParamsPage" %>
<%@ Register TagPrefix="cc1" Namespace="IRSA.Framework.Web.UI.Controls.WebControls" Assembly="IRSA.Framework.Web.UI" %>
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
													<asp:label id="lblTitle" runat="server" CssClass="label">Permisos de Grupos</asp:label></th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td align="center" valign="middle"><table>
														<tr>
															<td valign="top" align="center"><table>
																	<tr>
																		<td align="right"><asp:label id="Label1" runat="server" cssclass="label">Aplicación</asp:label></td>
																		<td align="left"><asp:DropDownList id="cboApplication" runat="server" Width="240px" CssClass="box" AutoPostBack="True"></asp:DropDownList></td>
																	</tr>
																	<tr>
																		<td align="right"><asp:label id="lblId" runat="server" cssclass="label">Grupo</asp:label></td>
																		<td align="left"><asp:DropDownList id="cboGroup" runat="server" Width="240px" CssClass="box"></asp:DropDownList></td>
																	</tr>
																	<tr>
																		<td align="right"><asp:label id="Label2" runat="server" cssclass="label">Permiso</asp:label></td>
																		<td align="left"><asp:DropDownList id="cboPermission" runat="server" Width="240px" CssClass="box"></asp:DropDownList></td>
																	</tr>
																</table>
															</td>
														</tr>
														<tr>
															<td valign="top" align="center"><table cellpadding="0" cellspacing="0" id="tblDetail" runat="server">
																	<tr>
																		<td><cc1:customdatagrid id="grdDetail" runat="server" CssClass="grid" AutoGenerateColumns="False" UseAccessibleHeader="True"
																				Width="100%" PageSize="5" AllowPaging="True" Title="Parámetros" Height="100%" AllowSorting="True">
																				<SelectedItemStyle CssClass="selected"></SelectedItemStyle>
																				<HeaderStyle Width="100%" CssClass="header"></HeaderStyle>
																				<Columns>
																					<asp:BoundColumn DataField="Key" SortExpression="Key" HeaderText="Nombre"></asp:BoundColumn>
																					<asp:BoundColumn DataField="Value" SortExpression="Value" HeaderText="Valor"></asp:BoundColumn>
																					<asp:TemplateColumn>
																						<HeaderStyle Width="24px"></HeaderStyle>
																						<ItemStyle HorizontalAlign="Center"></ItemStyle>
																						<ItemTemplate>
																							<asp:linkbutton id="Linkbutton2" runat="server" commandname="Delete" causesvalidation="false" CssClass="iconlink">
																								<img src="/images/icons/icon_remove.gif"></asp:linkbutton>
																						</ItemTemplate>
																					</asp:TemplateColumn>
																				</Columns>
																				<PagerStyle CssClass="footer"></PagerStyle>
																			</cc1:customdatagrid></td>
																	</tr>
																	<tr>
																		<td align="right"><asp:linkbutton id="lnkAttrAdd" runat="server" cssclass="button" width="80px"><img src="/images/icons/icon_add.gif">Agregar</asp:linkbutton></td>
																	</tr>
																</table>
															</td>
														</tr>
													</table>
												</td>
											</tr>
										</tbody>
										<tfoot>
											<tr>
												<td id="tdtoolbar" align="center">
													<asp:linkbutton id="lnkSearch" runat="server" cssclass="button" width="80px"><img src="/images/icons/icon_search.gif">Buscar</asp:linkbutton>&nbsp;
													<asp:linkbutton id="lnkNew" runat="server" cssclass="invisible" width="80px"><img src="/images/icons/icon_new.gif">Nuevo</asp:linkbutton>&nbsp;
													<asp:linkbutton id="lnkSave" runat="server" cssclass="button" width="80px"><img src="/images/icons/icon_save.gif">Grabar</asp:linkbutton>&nbsp;
													<asp:linkbutton id="lnkDelete" runat="server" cssclass="invisible" width="80px"><img src="/images/icons/icon_delete.gif">Borrar</asp:linkbutton>&nbsp;
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
											<asp:BoundColumn DataField="Group" SortExpression="Group" HeaderText="Grupo"></asp:BoundColumn>
											<asp:BoundColumn DataField="Permission" SortExpression="Permission" HeaderText="Permiso"></asp:BoundColumn>
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
