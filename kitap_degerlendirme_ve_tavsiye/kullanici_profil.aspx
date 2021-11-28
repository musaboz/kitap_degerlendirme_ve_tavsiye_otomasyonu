<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="kullanici_profil.aspx.cs" Inherits="kitap_degerlendirme_ve_tavsiye.kullanici_profil" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Kullanıcı Resim:&nbsp;&nbsp;
            <asp:Image ID="Image1" runat="server" />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="Expr1" HeaderText="Isim" SortExpression="Expr1" />
                    <asp:BoundField DataField="Soyisim" HeaderText="Soyisim" SortExpression="Soyisim" />
                    <asp:BoundField DataField="Isim" HeaderText="Okuduğu Kitabın Ismi" SortExpression="Isim" />
                    <asp:BoundField DataField="Puan" HeaderText="Puan" SortExpression="Puan" />
                    <asp:BoundField DataField="Inceleme" HeaderText="Inceleme" SortExpression="Inceleme" />
                    <asp:BoundField DataField="Cumle" HeaderText="Cumle" SortExpression="Cumle" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=&quot;D:\Games &amp; School Works\C# Uygulamalari\Ev\Proje\Kitap.mdf&quot;;Integrated Security=True;Connect Timeout=30" ProviderName="System.Data.SqlClient" SelectCommand="SELECT KullanıcılarTanım.Isim AS Expr1, KullanıcılarTanım.Soyisim, KitaplarTanım.Isim, KitapPuan.Puan, KitapInceleme.Inceleme, KitapAlıntı.Cumle FROM KullanıcılarTanım INNER JOIN KitapOkunma ON KullanıcılarTanım.KullaniciID = KitapOkunma.KullaniciID INNER JOIN KitaplarTanım ON KitapOkunma.KitapID = KitaplarTanım.KitapID INNER JOIN KitapPuan ON KullanıcılarTanım.KullaniciID = KitapPuan.KullaniciID INNER JOIN KitapInceleme ON KullanıcılarTanım.KullaniciID = KitapInceleme.KullaniciID INNER JOIN KitapAlıntı ON KullanıcılarTanım.KullaniciID = KitapAlıntı.KullaniciID WHERE (KullanıcılarTanım.KullaniciID = @KullaniciID)">
                <SelectParameters>
                    <asp:SessionParameter Name="KullaniciID" SessionField="KullaniciID" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <h3>Mesaj Gönder:</h3>
            <table class="auto-style1">
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="KullanıcıID:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Mesaj Başlığı:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Mesaj:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server" Height="128px" TextMode="MultiLine" Width="201px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Mesajı Gönder" OnClick="Button1_Click" />
                        <br />
                        <asp:Label ID="Label4" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <br />
            SQL KODU:<br />
            SELECT KullanıcılarTanım.Isim AS Expr1, KullanıcılarTanım.Soyisim, KitaplarTanım.Isim, KitapPuan.Puan, KitapInceleme.Inceleme, KitapAlıntı.Cumle FROM KullanıcılarTanım INNER JOIN KitapOkunma ON KullanıcılarTanım.KullaniciID = KitapOkunma.KullaniciID INNER JOIN KitaplarTanım ON KitapOkunma.KitapID = KitaplarTanım.KitapID INNER JOIN KitapPuan ON KullanıcılarTanım.KullaniciID = KitapPuan.KullaniciID INNER JOIN KitapInceleme ON KullanıcılarTanım.KullaniciID = KitapInceleme.KullaniciID INNER JOIN KitapAlıntı ON KullanıcılarTanım.KullaniciID = KitapAlıntı.KullaniciID WHERE (KullanıcılarTanım.KullaniciID = &quot;KullaniciID&quot;)</div>
    </form>
</body>
</html>
