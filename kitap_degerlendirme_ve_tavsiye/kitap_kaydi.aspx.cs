using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace kitap_degerlendirme_ve_tavsiye
{
    public partial class kitap_kaydi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool sonuc = Convert.ToBoolean(Session["giris"]);
            if (sonuc == false)
                Response.Redirect("kullanici_giris.aspx?msg=Lutfen once giris yapiniz");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int kitapid = Convert.ToInt32(Session["KitapID"]);
            int kadi = Convert.ToInt32(Session["kID"]);
            int okuma = 0;
            if (CheckBox1.Checked == true)
                okuma = 1;
            string inceleme = TextBox1.Text;
            int sayfano = Convert.ToInt32(Convert.ToInt32(TextBox2.Text));
            string alinti = TextBox3.Text;
            int puan = Convert.ToInt32(TextBox4.Text);

            DBIslemleri.KitapKaydiEkle(kitapid, kadi, okuma, inceleme, sayfano, alinti, puan);

            Label6.Text = "Kayıt Eklendi";
        }
    }
}