using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace kitap_degerlendirme_ve_tavsiye
{
    public partial class kullanici_profil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool sonuc = Convert.ToBoolean(Session["giris"]);
            if (sonuc == false)
                Response.Redirect("kullanici_giris.aspx?msg=Lutfen once giris yapiniz");
            int kulid = Convert.ToInt32(Session["KullaniciID"]);

            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename='D:\Games & School Works\C# Uygulamalari\Ev\Proje\Kitap.mdf';Integrated Security=True;Connect Timeout=30");
            conn.Open();
            string sql = "select Resim from KullanıcılarTanım where KullaniciID=" + kulid;
            SqlCommand komut = new SqlCommand(sql, conn);

            SqlDataReader veriokuyucu = komut.ExecuteReader();

            while (veriokuyucu.Read())
            {
                Image1.ImageUrl = "~/resimler/kullaniciresim/" + veriokuyucu[0].ToString();
                Image1.Width = 100;
                Image1.Height = 100;
            }

            veriokuyucu.Close();
            conn.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int gonderenid = Convert.ToInt32(Session["KullaniciID"]);
            int gidenid = Convert.ToInt32(TextBox1.Text);
            string baslik = TextBox2.Text;
            string mesaj = TextBox3.Text;

            DBIslemleri.mesajGonder(gonderenid, gidenid, baslik, mesaj);

            Label4.Text = "Mesaj Başarıyla Gönderildi";
        }
    }
}