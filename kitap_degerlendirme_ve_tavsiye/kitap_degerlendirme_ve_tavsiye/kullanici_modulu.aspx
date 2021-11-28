<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="kullanici_modulu.aspx.cs" Inherits="kitap_degerlendirme_ve_tavsiye.kullanici_modulu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 61%;
        }
        .auto-style2 {
            height: 23px;
        }
        .auto-style3 {
            height: 30px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style3">
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/kitap_arama.aspx">Kitap Arama</asp:HyperLink>
                    </td>
                    <td class="auto-style3">
                        <h2>Tavsiye Sistemi:</h2>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/kullanici_arama.aspx">Başka Kullanıcı Arama</asp:HyperLink>
                    </td>
                    <td>Kullanıcı Öneri 1:
                        <asp:GridView ID="GridView1" runat="server">
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/yazar_arama.aspx">Yazar Arama</asp:HyperLink>
                    </td>
                    <td class="auto-style2">Kullanıcı Öneri 2:<asp:GridView ID="GridView2" runat="server">
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/populer_kitaplar.aspx">Popüler Kitaplar</asp:HyperLink>
                    </td>
                    <td>
                        Kitap Öneri:<asp:GridView ID="GridView3" runat="server">
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/yuksek_puanli_kitaplar.aspx">Yüksek Puanlı Kitaplar</asp:HyperLink>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/populer_yazarlar.aspx">Popüler Yazarlar</asp:HyperLink>
                    </td>
                    <td class="auto-style2"></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
