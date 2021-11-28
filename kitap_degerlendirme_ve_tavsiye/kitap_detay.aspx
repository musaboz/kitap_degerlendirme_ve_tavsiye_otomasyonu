<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="kitap_detay.aspx.cs" Inherits="kitap_degerlendirme_ve_tavsiye.kitap_detay" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Kitabın Resmi:
            <asp:Image ID="Image1" runat="server" />
            <br />
            <br />
            <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataKeyNames="KitapID" DataSourceID="SqlDataSource1" EnableViewState="False">
                <Columns>
                    <asp:BoundField DataField="KitapID" HeaderText="KitapID" InsertVisible="False" ReadOnly="True" SortExpression="KitapID" />
                    <asp:BoundField DataField="Isim" HeaderText="Isim" SortExpression="Isim" />
                    <asp:BoundField DataField="Yazari" HeaderText="Yazarı" SortExpression="Yazari" />
                    <asp:BoundField DataField="YayinEvi" HeaderText="Yayın Evi" SortExpression="YayinEvi" />
                    <asp:BoundField DataField="Inceleme" HeaderText="Inceleme" SortExpression="Inceleme" />
                    <asp:BoundField DataField="Cumle" HeaderText="Cumle" SortExpression="Cumle" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=&quot;D:\Games &amp; School Works\C# Uygulamalari\Ev\Proje\Kitap.mdf&quot;;Integrated Security=True;Connect Timeout=30" ProviderName="System.Data.SqlClient" SelectCommand="SELECT KitaplarTanım.KitapID, KitaplarTanım.Isim, KitaplarTanım.Yazari, KitaplarTanım.YayinEvi, KitapInceleme.Inceleme, KitapAlıntı.Cumle FROM KitaplarTanım INNER JOIN KitapInceleme ON KitaplarTanım.KitapID = KitapInceleme.KitapID INNER JOIN KitapAlıntı ON KitaplarTanım.KitapID = KitapAlıntı.KitapID WHERE (KitaplarTanım.KitapID = @KitapID)">
                <SelectParameters>
                    <asp:SessionParameter Name="KitapID" SessionField="KitapID" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
                <Columns>
                    <asp:BoundField DataField="KitapID" HeaderText="KitapID" SortExpression="KitapID" />
                    <asp:BoundField DataField="OrtPuan" HeaderText="Kitabın Ortalama Puanı" ReadOnly="True" SortExpression="OrtPuan" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=&quot;D:\Games &amp; School Works\C# Uygulamalari\Ev\Proje\Kitap.mdf&quot;;Integrated Security=True;Connect Timeout=30" ProviderName="System.Data.SqlClient" SelectCommand="select KitapID, avg(Puan) as OrtPuan from KitapPuan WHERE ([KitapID] = @KitapID) group by KitapID">
                <SelectParameters>
                    <asp:SessionParameter Name="KitapID" SessionField="KitapID" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3">
                <Columns>
                    <asp:BoundField DataField="KitapID" HeaderText="KitapID" SortExpression="KitapID" />
                    <asp:BoundField DataField="OkunmaSayisi" HeaderText="Kitabın Okunma Sayısı" ReadOnly="True" SortExpression="OkunmaSayisi" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=&quot;D:\Games &amp; School Works\C# Uygulamalari\Ev\Proje\Kitap.mdf&quot;;Integrated Security=True;Connect Timeout=30" ProviderName="System.Data.SqlClient" SelectCommand="select KitapID, count(Okunma) as OkunmaSayisi from KitapOkunma WHERE ([KitapID] = @KitapID) group by KitapID">
                <SelectParameters>
                    <asp:SessionParameter Name="KitapID" SessionField="KitapID" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/kitap_kaydi.aspx">Kitap Kaydı</asp:HyperLink>
            <br />
            <br />
            <br />
            <br />
            <br />
            SQL Kodu 1:<br />
            SELECT KitaplarTanım.KitapID, KitaplarTanım.Isim, KitaplarTanım.Yazari, KitaplarTanım.YayinEvi, KitapInceleme.Inceleme, KitapAlıntı.Cumle FROM KitaplarTanım INNER JOIN KitapInceleme ON KitaplarTanım.KitapID = KitapInceleme.KitapID INNER JOIN KitapAlıntı ON KitaplarTanım.KitapID = KitapAlıntı.KitapID WHERE (KitaplarTanım.KitapID = @KitapID)<br />
            <br />
            SQL Kodu 2:<br />
            select KitapID, avg(Puan) as OrtPuan from KitapPuan WHERE ([KitapID] = @KitapID) group by KitapID<br />
            <br />
            SQL Kodu 3:<br />
            select KitapID, count(Okunma) as OkunmaSayisi from KitapOkunma WHERE ([KitapID] = @KitapID) group by KitapID<br />
        </div>
    </form>
</body>
</html>
