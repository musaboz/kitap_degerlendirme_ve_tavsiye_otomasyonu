using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace kitap_degerlendirme_ve_tavsiye
{
    public partial class mesajlar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool sonuc = Convert.ToBoolean(Session["giris"]);
            if (sonuc == false)
                Response.Redirect("kullanici_giris.aspx?msg=Lutfen once giris yapiniz");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int gonderenid = Convert.ToInt32(Session["kID"]);
            int gidenid = Convert.ToInt32(TextBox1.Text);
            string baslik = TextBox2.Text;
            string mesaj = TextBox3.Text;

            DBIslemleri.mesajGonder(gonderenid, gidenid, baslik, mesaj);

            Label4.Text = "Mesaj Başarıyla Gönderildi";
        }
    }
}