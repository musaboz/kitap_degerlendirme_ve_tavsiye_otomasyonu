<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="yazar_detay.aspx.cs" Inherits="kitap_degerlendirme_ve_tavsiye.yazar_detay" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataKeyNames="KitapID">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="AdiSoyadi" HeaderText="Adı ve Soyadı" SortExpression="AdiSoyadi" />
                    <asp:BoundField DataField="DogumTarihi" HeaderText="Doğum Tarihi" SortExpression="DogumTarihi" />
                    <asp:BoundField DataField="DogumYeri" HeaderText="Doğum Yeri" SortExpression="DogumYeri" />
                    <asp:BoundField DataField="OlumTarihi" HeaderText="Ölüm Tarihi" SortExpression="OlumTarihi" />
                    <asp:BoundField DataField="Isim" HeaderText="Kitabın Ismi" SortExpression="Isim" />
                    <asp:BoundField DataField="KitapID" HeaderText="KitapID" InsertVisible="False" ReadOnly="True" SortExpression="KitapID" Visible="False" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=&quot;D:\Games &amp; School Works\C# Uygulamalari\Ev\Proje\Kitap.mdf&quot;;Integrated Security=True;Connect Timeout=30" ProviderName="System.Data.SqlClient" SelectCommand="SELECT YazarlarTanım.AdiSoyadi, YazarlarTanım.DogumTarihi, YazarlarTanım.DogumYeri, YazarlarTanım.OlumTarihi, KitaplarTanım.Isim, KitaplarTanım.KitapID FROM YazarlarTanım INNER JOIN KitaplarTanım ON YazarlarTanım.YazarID = KitaplarTanım.YazarID WHERE (YazarlarTanım.YazarID = @YazarID)">
                <SelectParameters>
                    <asp:SessionParameter Name="YazarID" SessionField="YazarID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/kitap_detay.aspx">Kitabın sayfasına gitmek için tıklayınız</asp:HyperLink>
            <br />
            <br />
            <br />
            DataSource içerisinde kullandığım SQL kodu (SqlDataSource1 kısmındaki SelectQuery kısmından da koda ulaşabilirsiniz):<br />
            SELECT YazarlarTanım.AdiSoyadi, YazarlarTanım.DogumTarihi, YazarlarTanım.DogumYeri, YazarlarTanım.OlumTarihi, KitaplarTanım.Isim, KitaplarTanım.KitapID FROM YazarlarTanım INNER JOIN KitaplarTanım ON YazarlarTanım.YazarID = KitaplarTanım.YazarID WHERE (YazarlarTanım.YazarID = @YazarID)<br />
            <br />
            Session ile YazarID değerini önceki sayfadan aldım.</div>
    </form>
</body>
</html>
