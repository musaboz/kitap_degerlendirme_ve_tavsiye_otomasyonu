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
    public partial class yonetici_modulu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.QueryString["msg"] != null)
            {
                string mesaj = Request.QueryString["msg"].ToString();
                Response.Write(mesaj);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string kadi = TextBox1.Text;
            string sifre = TextBox2.Text;
            bool sonuc = DBIslemleri.yoneticiGiris(kadi, sifre);
            if (sonuc == false)
                Label3.Text = "Yanlış Kullanıcı Adı ve/veya Şifresi";
            else
            {
                Session["giris"] = true;
                Response.Redirect("kitap_tanimlari_ekle.aspx");
            }
        }
    }
}