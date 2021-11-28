<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mesajlar.aspx.cs" Inherits="kitap_degerlendirme_ve_tavsiye.mesajlar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 50%;
        }
        .auto-style2 {
            font-size: large;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="GonderenID">
                <Columns>
                    <asp:BoundField DataField="Baslik" HeaderText="Baslik" SortExpression="Baslik" />
                    <asp:BoundField DataField="Mesaj" HeaderText="Mesaj" SortExpression="Mesaj" />
                    <asp:BoundField DataField="Tarih" HeaderText="Tarih" SortExpression="Tarih" />
                    <asp:BoundField DataField="GonderenID" HeaderText="GonderenID" ReadOnly="True" SortExpression="GonderenID" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=&quot;D:\Games &amp; School Works\C# Uygulamalari\Ev\Proje\Kitap.mdf&quot;;Integrated Security=True;Connect Timeout=30" ProviderName="System.Data.SqlClient" SelectCommand="SELECT Mesajlar.Baslik, Mesajlar.Mesaj, Mesajlar.Tarih, Mesajlar.GonderenID FROM Mesajlar INNER JOIN KullanıcılarTanım ON Mesajlar.GidenID = KullanıcılarTanım.KullaniciID WHERE (Mesajlar.GidenID = @GidenID)">
                <SelectParameters>
                    <asp:SessionParameter Name="GidenID" SessionField="kID" />
                </SelectParameters>
            </asp:SqlDataSource>
            <h1>Cevap Yaz:</h1>
            <table class="auto-style1">
                <tr>
                    <td>
                        KullanıcıID:</td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" CssClass="auto-style2" Text="Başlık:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" CssClass="auto-style2" Text="Mesaj:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server" Height="84px" TextMode="MultiLine" Width="201px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Gönder" OnClick="Button1_Click" />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Label ID="Label4" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <br />
            <br />
            <br />
            SQL KODU:<br />
            SELECT Mesajlar.Baslik, Mesajlar.Mesaj, Mesajlar.Tarih, Mesajlar.GonderenID FROM Mesajlar INNER JOIN KullanıcılarTanım ON Mesajlar.GidenID = KullanıcılarTanım.KullaniciID&nbsp; WHERE ([GidenID] = Session[&quot;kID&quot;])</div>
    </form>
</body>
</html>
