using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace kitap_degerlendirme_ve_tavsiye
{
    public partial class kullanici_kayit : System.Web.UI.Page
    {
        char cinsiyet = ' ';
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                string isim = TextBox1.Text;
                string soyisim = TextBox2.Text;
                if (RadioButton1.Checked == true)
                    cinsiyet = 'E';
                else if (RadioButton2.Checked == true)
                    cinsiyet = 'K';
                string dogum = TextBox3.Text;
                string kadi = TextBox4.Text;
                string sifre = TextBox5.Text;
                string dosyaadi = FileUpload1.FileName;
                string dosyaturu = FileUpload1.PostedFile.ContentType;

                if (dosyaturu == "image/jpg" || dosyaturu == "image/jpeg" || dosyaturu == "image/gif" || dosyaturu == "image/png")
                {
                    DBIslemleri.kullaniciEkle(isim, soyisim, cinsiyet, dogum, kadi, sifre, dosyaadi);

                    FileUpload1.SaveAs(Server.MapPath("resimler/kullaniciresim/" + dosyaadi));

                    Label7.Text = "Kayıt Eklendi";

                }

                else
                    Label7.Text = "Resim Dosyası Seçiniz!";
            }
            else
                Label7.Text = "Dosya Seçmediniz!";
            
            
            
        }
    }
}