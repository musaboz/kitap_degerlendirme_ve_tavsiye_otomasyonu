<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="populer_yazarlar.aspx.cs" Inherits="kitap_degerlendirme_ve_tavsiye.populer_yazarlar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h3>Kitap Detay Sayfası İçin Seç:</h3>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="KitapID,YazarID" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="KitapID" HeaderText="KitapID" SortExpression="KitapID" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="YazarID" HeaderText="YazarID" SortExpression="YazarID" Visible="False" />
                    <asp:BoundField DataField="Okunma Sayısı" HeaderText="Okunma Sayısı" ReadOnly="True" SortExpression="Okunma Sayısı" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=&quot;D:\Games &amp; School Works\C# Uygulamalari\Ev\Proje\Kitap.mdf&quot;;Integrated Security=True;Connect Timeout=30" ProviderName="System.Data.SqlClient" SelectCommand="SELECT KitaplarTanım.KitapID, KitaplarTanım.YazarID, COUNT(KitapOkunma.Okunma) AS 'Okunma Sayısı' FROM KitaplarTanım INNER JOIN KitapOkunma ON KitaplarTanım.KitapID = KitapOkunma.KitapID GROUP BY KitaplarTanım.YazarID, KitaplarTanım.KitapID"></asp:SqlDataSource>
            <br />
            <h3>Yazar Detay Sayfası İçin Seç:</h3>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="YazarID" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="KitapID" HeaderText="KitapID" InsertVisible="False" ReadOnly="True" SortExpression="KitapID" Visible="False" />
                    <asp:BoundField DataField="YazarID" HeaderText="YazarID" SortExpression="YazarID" />
                    <asp:BoundField DataField="Okunma Sayısı" HeaderText="Okunma Sayısı" ReadOnly="True" SortExpression="Okunma Sayısı" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=&quot;D:\Games &amp; School Works\C# Uygulamalari\Ev\Proje\Kitap.mdf&quot;;Integrated Security=True;Connect Timeout=30" ProviderName="System.Data.SqlClient" SelectCommand="SELECT KitaplarTanım.KitapID, KitaplarTanım.YazarID, COUNT(KitapOkunma.Okunma) AS 'Okunma Sayısı' FROM KitaplarTanım INNER JOIN KitapOkunma ON KitaplarTanım.KitapID = KitapOkunma.KitapID GROUP BY KitaplarTanım.YazarID, KitaplarTanım.KitapID"></asp:SqlDataSource>
            <br />
            <br />
            <br />
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/kitap_detay.aspx">Kitap Detay Sayfasına Gitmek için Tıklayınız.</asp:HyperLink>
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/yazar_detay.aspx">Yazarın Sayfasına Gitmek İçin Tıklayınız</asp:HyperLink>
            <br />
            <br />
            SQL Kodu:<br />
            SELECT KitaplarTanım.KitapID, KitaplarTanım.YazarID, COUNT(KitapOkunma.Okunma) AS &#39;Okunma Sayısı&#39; FROM KitaplarTanım INNER JOIN KitapOkunma ON KitaplarTanım.KitapID = KitapOkunma.KitapID GROUP BY KitaplarTanım.YazarID, KitaplarTanım.KitapID</div>
    </form>
</body>
</html>
