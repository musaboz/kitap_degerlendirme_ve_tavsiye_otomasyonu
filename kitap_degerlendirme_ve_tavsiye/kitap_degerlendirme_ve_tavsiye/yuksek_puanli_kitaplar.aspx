<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="yuksek_puanli_kitaplar.aspx.cs" Inherits="kitap_degerlendirme_ve_tavsiye.yuksek_puanli_kitaplar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="KitapID" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="KitapID" HeaderText="KitapID" ReadOnly="True" SortExpression="KitapID" InsertVisible="False" />
                    <asp:BoundField DataField="OrtPuan" HeaderText="OrtPuan" ReadOnly="True" SortExpression="OrtPuan" />
                    <asp:BoundField DataField="Kitap Adı" HeaderText="Kitap Adı" ReadOnly="True" SortExpression="Kitap Adı" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=&quot;D:\Games &amp; School Works\C# Uygulamalari\Ev\Proje\Kitap.mdf&quot;;Integrated Security=True;Connect Timeout=30" ProviderName="System.Data.SqlClient" SelectCommand="SELECT KitaplarTanım_1.KitapID, AVG(KitapPuan.Puan) AS 'OrtPuan', (SELECT Isim FROM KitaplarTanım WHERE (KitapID = KitapPuan.KitapID)) AS 'Kitap Adı' FROM KitapPuan INNER JOIN KitaplarTanım AS KitaplarTanım_1 ON KitapPuan.KitapID = KitaplarTanım_1.KitapID GROUP BY KitapPuan.KitapID, KitaplarTanım_1.KitapID ORDER BY 'OrtPuan' DESC"></asp:SqlDataSource>
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/kitap_detay.aspx">Kitabın Sayfasına Gitmek İçin Tıklayınız.</asp:HyperLink>
            <br />
            <br />
            SQL Kodu:<br />
            SELECT KitaplarTanım_1.KitapID, AVG(KitapPuan.Puan) AS &#39;OrtPuan&#39;, (SELECT Isim FROM KitaplarTanım WHERE (KitapID = KitapPuan.KitapID)) AS &#39;Kitap Adı&#39; FROM KitapPuan INNER JOIN KitaplarTanım AS KitaplarTanım_1 ON KitapPuan.KitapID = KitaplarTanım_1.KitapID GROUP BY KitapPuan.KitapID, KitaplarTanım_1.KitapID ORDER BY &#39;OrtPuan&#39; DESC</div>
    </form>
</body>
</html>
