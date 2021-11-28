<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="kitap_tanimlari_ekle.aspx.cs" Inherits="kitap_degerlendirme_ve_tavsiye.kitap_tanimlari" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 400px;
        }
        .auto-style2 {
            height: 24px;
        }
        .auto-style3 {
            font-size: large;
        }
        .auto-style4 {
            height: 32px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Kitap Tanıtım Ekleme</h1>
            <table class="auto-style1">
                <tr>
                    <td>
                        YazarID:</td>
                    <td>
                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" style="font-size: large" Text="Kitap İsmi:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label2" runat="server" style="font-size: large" Text="Kitap Resmi:"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" style="font-size: large" Text="Kitabın Yazarı:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="Label4" runat="server" CssClass="auto-style3" Text="Kitabın Yayınevi:"></asp:Label>
                    </td>
                    <td class="auto-style4">
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Ekle" />
                        <br />
                        <asp:Label ID="Label5" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <h1>Kitap Tanıtım Güncelleme ve Silme</h1>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="KitapID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="KitapID" HeaderText="KitapID" InsertVisible="False" ReadOnly="True" SortExpression="KitapID" />
                    <asp:BoundField DataField="YazarID" HeaderText="YazarID" SortExpression="YazarID" />
                    <asp:BoundField DataField="Isim" HeaderText="Isim" SortExpression="Isim" />
                    <asp:BoundField DataField="Resim" HeaderText="Resim" SortExpression="Resim" />
                    <asp:BoundField DataField="Yazari" HeaderText="Yazar" SortExpression="Yazari" />
                    <asp:BoundField DataField="YayinEvi" HeaderText="Yayın Evi" SortExpression="YayinEvi" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=&quot;D:\Games &amp; School Works\C# Uygulamalari\Ev\Proje\Kitap.mdf&quot;;Integrated Security=True;Connect Timeout=30" DeleteCommand="DELETE FROM [KitaplarTanım] WHERE [KitapID] = @KitapID" InsertCommand="INSERT INTO [KitaplarTanım] ([YazarID], [Isim], [Resim], [Yazari], [YayinEvi]) VALUES (@YazarID, @Isim, @Resim, @Yazari, @YayinEvi)" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [KitaplarTanım]" UpdateCommand="UPDATE [KitaplarTanım] SET [YazarID] = @YazarID, [Isim] = @Isim, [Resim] = @Resim, [Yazari] = @Yazari, [YayinEvi] = @YayinEvi WHERE [KitapID] = @KitapID">
                <DeleteParameters>
                    <asp:Parameter Name="KitapID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="YazarID" Type="Int32" />
                    <asp:Parameter Name="Isim" Type="String" />
                    <asp:Parameter Name="Resim" Type="String" />
                    <asp:Parameter Name="Yazari" Type="String" />
                    <asp:Parameter Name="YayinEvi" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="YazarID" Type="Int32" />
                    <asp:Parameter Name="Isim" Type="String" />
                    <asp:Parameter Name="Resim" Type="String" />
                    <asp:Parameter Name="Yazari" Type="String" />
                    <asp:Parameter Name="YayinEvi" Type="String" />
                    <asp:Parameter Name="KitapID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
        </div>
    </form>
</body>
</html>
