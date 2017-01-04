<%@ Page language="c#" Codebehind="Default.aspx.cs" AutoEventWireup="false" Inherits="IRSA.Framework.Services.Webpages.Default"  %>
<%@ Register TagPrefix="cc1" Namespace="IRSA.Framework.Web.UI.Controls.WebControls" Assembly="IRSA.Framework.Web.UI" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>Default</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
			<table height="100%" width="100%">
				<tr>
					<td class="topbarcontainer">
						<table class="topbar" cellSpacing="0" cellPadding="0">
							<tr>
								<td><img src="images/fallout/title_bg_left.gif" border="0"></td>
								<td background="images/fallout/title_bg.gif" width="100%" valign="top"><img src="images/fallout/title.gif" border="0"></td>
								<td><img src="images/fallout/title_bg_right.gif" border="0"></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px">
						<table height="100%" width="100%">
							<tr>
								<td class="menucontainer">
									<table class="menu" cellspacing="0" cellpadding="0">
										<tr>
											<td colspan="3" background="images/fallout/menu_border_top.gif"><img src="images/fallout/menu_border_top.gif" border="0"></td>
										</tr>
										<tr>
											<td background="images/fallout/menu_border_left.gif" height="100%"><img src="images/fallout/menu_border_left.gif" border="0"></td>
											<td align="center" valign="top" height="100%" style="PADDING-TOP:4px">
												<table cellpadding="0" cellspacing="0">
													<tr>
														<td><img src="images/fallout/menuitem_button_up.gif" border="0"></td>
														<td><IMG src="images/fallout/menu_item_bg_left.gif" border="0"></td>
														<td align="center" background="images/fallout/menu_item_bg.gif"><A class="menuitem" href="/Administracion/Applications.aspx" target="frmMain">Aplicaciones</A></td>
														<td><IMG src="images/fallout/menu_item_bg_rigth.gif" border="0"></td>
													</tr>
													<tr>
														<td><img src="images/fallout/menuitem_button_up.gif" border="0"></td>
														<td><IMG src="images/fallout/menu_item_bg_left.gif" border="0"></td>
														<td align="center" background="images/fallout/menu_item_bg.gif"><A class="menuitem" href="/Administracion/Permissions.aspx" target="frmMain">Permisos</A></td>
														<td><IMG src="images/fallout/menu_item_bg_rigth.gif" border="0"></td>
													</tr>
													<tr>
														<td><img src="images/fallout/menuitem_button_up.gif" border="0"></td>
														<td><IMG src="images/fallout/menu_item_bg_left.gif" border="0"></td>
														<td align="center" background="images/fallout/menu_item_bg.gif"><A class="menuitem" href="/Administracion/Groups.aspx" target="frmMain">Grupos</A></td>
														<td><IMG src="images/fallout/menu_item_bg_rigth.gif" border="0"></td>
													</tr>
													<tr>
														<td><img src="images/fallout/menuitem_button_up.gif" border="0"></td>
														<td><IMG src="images/fallout/menu_item_bg_left.gif" border="0"></td>
														<td align="center" background="images/fallout/menu_item_bg.gif"><A class="menuitem" href="/Administracion/Params.aspx" target="frmMain">Parámetros</A></td>
														<td><img src="images/fallout/menu_item_bg_rigth.gif" border="0"></td>
													</tr>
													<tr>
														<td><img src="images/fallout/menuitem_button_up.gif" border="0"></td>
														<td><img src="images/fallout/menu_item_bg_left.gif" border="0"></td>
														<td align="center" background="images/fallout/menu_item_bg.gif"><A class="menuitem" href="/Administracion/Users.aspx" target="frmMain">Usuarios</A></td>
														<td><img src="images/fallout/menu_item_bg_rigth.gif" border="0"></td>
													</tr>
													<tr>
														<td><img src="images/fallout/menuitem_button_up.gif" border="0"></td>
														<td><img src="images/fallout/menu_item_bg_left.gif" border="0"></td>
														<td align="center" background="images/fallout/menu_item_bg.gif"><A class="menuitem" href="/Administracion/UsersGroups.aspx" target="frmMain">Usuarios 
																y Grupos</A></td>
														<td><img src="images/fallout/menu_item_bg_rigth.gif" border="0"></td>
													</tr>
												</table>
											</td>
											<td background="images/fallout/menu_border_right.gif" height="100%"><img src="images/fallout/menu_border_right.gif" border="0"></td>
										</tr>
										<tr>
											<td background="images/fallout/menu_border_left.gif" height="100%"><img src="images/fallout/menu_border_left.gif" border="0"></td>
											<td align="center" valign="bottom"><img src="images/fallout/menu_ornament.gif" border="0"></td>
											<td background="images/fallout/menu_border_right.gif" height="100%"><img src="images/fallout/menu_border_right.gif" border="0"></td>
										</tr>
										<tr>
											<td colspan="3" background="images/fallout/menu_border_bottom.gif"><img src="images/fallout/menu_border_bottom.gif" border="0"></td>
										</tr>
									</table>
								</td>
								<td class="frmmaincontainer"><iframe id="frmMain" name="frmMain" marginWidth="0" marginHeight="0" src="/start.aspx" frameBorder="0"
										scrolling="auto"></iframe>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td class="statusbarcontainer" unselectable="on">
						<table class="statusbar" cellpadding="0" cellspacing="0">
							<tr>
								<td rowspan="3" width="13" style="HEIGHT:24px"><img src="images/fallout/statusbar_left.gif" border="0"></td>
								<td colspan="2" style="HEIGHT:3px" width="100%" background="images/fallout/statusbar_top.gif"><img src="images/fallout/statusbar_top.gif" border="0"></td>
								<td rowspan="3" width="13" style="HEIGHT:24px"><img src="images/fallout/statusbar_right.gif" border="0"></td>
							</tr>
							<tr>
								<td style="OVERFLOW: hidden; WIDTH: 100%; WORD-BREAK: keep-all; WHITE-SPACE: nowrap; HEIGHT: 18px"
									width="100%" unselectable="on">
									<div id="lblStatusbar" style="OVERFLOW: hidden; WIDTH: 100%; HEIGHT: 16px" unselectable="on"></div>
								</td>
								<td style="WORD-BREAK: keep-all; WHITE-SPACE: nowrap; HEIGHT: 18px" unselectable="on"><img src="/images/icons/icon_user.gif" border="0" align="top"><span unselectable="on" id="lblUserName"></span></td>
							</tr>
							<tr>
								<td colspan="2" style="HEIGHT:3px" background="images/fallout/statusbar_bottom.gif"><img src="images/fallout/statusbar_bottom.gif" border="0"></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
