<%@ Register TagPrefix="cc1" Namespace="IRSA.Framework.Web.UI.Controls.WebControls" Assembly="IRSA.Framework.Web.UI" %>
<%@ Page language="c#" Codebehind="Default.aspx.cs" AutoEventWireup="false" Inherits="IRSA.Multipay.Administration._Default" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>Default</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body style="OVERFLOW:hidden">
		<form id="Form1" method="post" runat="server">
			<table width="100%" height="100%">
				<tr>
					<td class="topbarcontainer">
						<table width="100%" class="header" height="100%">
							<tr>
								<td align="left" valign="middle" style="PADDING-RIGHT:1px;PADDING-LEFT:1px;PADDING-BOTTOM:1px;PADDING-TOP:1px">&nbsp;<img src="images/head_title.gif"></td>
								<td align="right" valign="bottom" style="PADDING-RIGHT:2px;PADDING-LEFT:2px;PADDING-BOTTOM:2px;PADDING-TOP:2px">
									<a href="AdministrarClaves.aspx" id="lnkClaves" style="WIDTH:80px" class="button" target="frmMain">Claves</a>
									<a href="Parameters.aspx" id="lnkParams" style="WIDTH:80px" class="button" target="frmMain">Parámetros</a>
								</td>
							</tr>
							<tr>
								<td colspan="2" align="left" valign="middle" style="PADDING-RIGHT:1px; PADDING-LEFT:1px; FONT-SIZE:10px; BACKGROUND-IMAGE:url(images/table_dk_bg.gif); PADDING-BOTTOM:1px; PADDING-TOP:1px">&nbsp;<span style="FONT-WEIGHT:bold; COLOR:white">IBM 
										tardó meses en darse cuenta que no podía. Nosotros lo hicimos en un día.</span></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td class="frmmaincontainer"><iframe src="AdministrarClaves.aspx" name="frmMain" id="frmMain" frameborder="0" marginheight="0"
							marginwidth="0" scrolling="auto"></iframe>
					</td>
				</tr>
				<tr>
					<td unselectable="on" class="statusbarcontainer"><table class="statusbar">
							<tr>
								<td width="100%" style="OVERFLOW:hidden; WIDTH:100%; WORD-BREAK:keep-all; WHITE-SPACE:nowrap; HEIGHT:16px"
									unselectable="on"><div id="lblStatusbar" style="OVERFLOW:hidden; WIDTH:100%; HEIGHT:16px" unselectable="on"></div>
								</td>
								<td style="WORD-BREAK: keep-all; WHITE-SPACE: nowrap" unselectable="on"><img src="images/icons/icon_user.gif" border="0" align="top"><span unselectable="on" id="lblUserName"></span></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
