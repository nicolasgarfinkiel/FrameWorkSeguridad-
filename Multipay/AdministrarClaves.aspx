<%@ Page language="c#" Codebehind="AdministrarClaves.aspx.cs" AutoEventWireup="false" Inherits="IRSA.Multipay.Administration.AdministrarClaves" %>
<%@ Register TagPrefix="cc1" Namespace="IRSA.Framework.Web.UI.Controls.WebControls" Assembly="IRSA.Framework.Web.UI" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>Default</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="FlowLayout">
		<form id="Form1" method="post" runat="server">
			<table class="outer">
				<tr>
					<td class="container" align="center" valign="top">
						<table class="window">
							<tr>
								<td><table width="100%">
										<thead>
											<tr>
												<th>
													<asp:label id="lblTitle" runat="server" CssClass="label">Multipay - Claves Secretas</asp:label></th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td align="center" valign="middle"><table>
														<tr>
															<td style="HEIGHT: 17px" align="right"><asp:label id="lblId" runat="server" cssclass="label">Sociedad</asp:label></td>
															<td style="HEIGHT: 17px" align="left"><asp:TextBox id="txtSociedad" runat="server" CssClass="box" Width="240px"></asp:TextBox></td>
														</tr>
														<tr id="trClave" runat="server">
															<td style="HEIGHT: 15px" align="right"><asp:label id="lblName" runat="server" cssclass="label">Clave</asp:label></td>
															<td style="HEIGHT: 15px" align="left"><asp:TextBox id="txtClave" runat="server" CssClass="box" Width="240px" TextMode="Password"></asp:TextBox></td>
														</tr>
														<tr id="trConfirmar" runat="server">
															<td style="HEIGHT: 15px" align="right"><asp:label id="Label1" runat="server" cssclass="label">Confirmar Clave</asp:label></td>
															<td style="HEIGHT: 15px" align="left"><asp:TextBox id="txtClave2" runat="server" CssClass="box" Width="240px" TextMode="Password"></asp:TextBox></td>
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
										allowpaging="True" useaccessibleheader="True" AllowSorting="True" PageSize="12">
										<SelectedItemStyle CssClass="selected"></SelectedItemStyle>
										<AlternatingItemStyle CssClass="rowimpar"></AlternatingItemStyle>
										<ItemStyle CssClass="rowpar"></ItemStyle>
										<HeaderStyle CssClass="header"></HeaderStyle>
										<Columns>
											<asp:BoundColumn DataField="Sociedad" SortExpression="Sociedad" HeaderText="Sociedad"></asp:BoundColumn>
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
