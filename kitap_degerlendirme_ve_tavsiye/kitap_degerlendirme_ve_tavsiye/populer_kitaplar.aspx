<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="populer_kitaplar.aspx.cs" Inherits="kitap_degerlendirme_ve_tavsiye.populer_kitaplar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AutoGenerateColumns="False" DataKeyNames="KitapID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="KitapID" HeaderText="KitapID" InsertVisible="False" ReadOnly="True" SortExpression="KitapID" />
                    <asp:BoundField DataField="Okunma_Sayisi" HeaderText="Okunma_Sayisi" ReadOnly="True" SortExpression="Okunma_Sayisi" />
                    <asp:BoundField DataField="Exp1" HeaderText="Exp1" SortExpression="Exp1" Visible="False" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=&quot;D:\Games &amp; School Works\C# Uygulamalari\Ev\Proje\Kitap.mdf&quot;;Integrated Security=True;Connect Timeout=30" ProviderName="System.Data.SqlClient" SelectCommand="SELECT KitaplarTanım.KitapID, COUNT(KitapOkunma.KitapID) AS Okunma_Sayisi, KitapOkunma.KitapID AS Exp1 FROM KitapOkunma INNER JOIN KitaplarTanım ON KitapOkunma.KitapID = KitaplarTanım.KitapID GROUP BY KitapOkunma.KitapID, KitaplarTanım.KitapID HAVING (COUNT(KitapOkunma.KitapID) &gt; 1) ORDER BY Okunma_Sayisi DESC"></asp:SqlDataSource>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/kitap_detay.aspx">Kitabın Sayfasına Gitmek İçin Tıklayınız.</asp:HyperLink>
            <br />
            <br />
            <br />
            SQL Kodu:<br />
            SELECT KitaplarTanım.KitapID, COUNT(KitapOkunma.KitapID) AS Okunma_Sayisi, KitapOkunma.KitapID AS Exp1 FROM KitapOkunma INNER JOIN KitaplarTanım ON KitapOkunma.KitapID = KitaplarTanım.KitapID GROUP BY KitapOkunma.KitapID, KitaplarTanım.KitapID HAVING (COUNT(KitapOkunma.KitapID) &gt; 1) ORDER BY Okunma_Sayisi DESC<br />
            </div>
    </form>
</body>
</html>
