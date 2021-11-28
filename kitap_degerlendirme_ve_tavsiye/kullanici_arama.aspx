<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="kullanici_arama.aspx.cs" Inherits="kitap_degerlendirme_ve_tavsiye.kullanici_arama" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
            <br />
            <br />
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            </asp:DropDownList>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/kullanici_profil.aspx">Kullanıcının Sayfasına Gitmek İçin Tıklayınız</asp:HyperLink>
        </div>
    </form>
</body>
</html>
