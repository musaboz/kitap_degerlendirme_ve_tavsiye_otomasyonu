using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace kitap_degerlendirme_ve_tavsiye
{
    public partial class kitap_tanimlari : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool sonuc = Convert.ToBoolean(Session["giris"]);
            if (sonuc == false)
                Response.Redirect("yonetici_modulu.aspx?msg=Lutfen once giris yapiniz");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                string kitapismi = TextBox1.Text;
                string dosyaadi = FileUpload1.FileName;
                string dosyaturu = FileUpload1.PostedFile.ContentType;
                string yazar = TextBox2.Text;
                string yevi = TextBox3.Text;
                int id = Convert.ToInt32(TextBox4.Text);

                if (dosyaturu == "image/jpg" || dosyaturu == "image/jpeg" || dosyaturu == "image/gif" || dosyaturu == "image/png")
                {
                    DBIslemleri.kitaptanitimEkle(id, kitapismi, dosyaadi, yazar, yevi);

                    FileUpload1.SaveAs(Server.MapPath("resimler/kitapresim/" + dosyaadi));

                    FileUpload1.SaveAs("resimler/kitapresim" + dosyaadi);

                    Label5.Text = "Kayıt Eklendi";
                }

                else
                    Label5.Text = "Resim Dosyası Seçiniz";
            }
            else
                Label5.Text = "Dosya Seçmediniz!";
        }
    }
}