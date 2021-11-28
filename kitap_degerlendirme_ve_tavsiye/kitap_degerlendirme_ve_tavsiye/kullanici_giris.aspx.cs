using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace kitap_degerlendirme_ve_tavsiye
{
    public partial class kullanici_giris : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["msg"] != null)
            {
                string mesaj = Request.QueryString["msg"].ToString();
                Response.Write(mesaj);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string kadi = TextBox1.Text;
            string sifre = TextBox2.Text;
            bool sonuc = DBIslemleri.kullaniciGiris(kadi, sifre);

            if (sonuc == false)
                Label3.Text = "Yanlış Kullanıcı Adı ve/veya Şifresi";
            else
            {
                Session["giris"] = true;
                Response.Redirect("kullanici_modulu.aspx");

                
            }
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            string kadi = TextBox1.Text;
            string sifre = TextBox2.Text;
            DataSet kid = DBIslemleri.kullaniciidCek(kadi, sifre);

            DropDownList1.DataTextField = "KullaniciAdi";
            DropDownList1.DataValueField = "KullaniciID";
            DropDownList1.DataSource = kid.Tables[0];
            DropDownList1.DataBind();

            Session["kID"] = DropDownList1.SelectedValue;
        }
    }
}