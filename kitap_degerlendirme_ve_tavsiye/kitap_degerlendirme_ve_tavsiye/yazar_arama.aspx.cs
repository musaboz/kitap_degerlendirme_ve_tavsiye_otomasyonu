using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace kitap_degerlendirme_ve_tavsiye
{
    public partial class yazar_arama : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool sonuc = Convert.ToBoolean(Session["giris"]);
            if (sonuc == false)
                Response.Redirect("kullanici_giris.aspx?msg=Lutfen once giris yapiniz");
            HyperLink1.Visible = false;
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            DataSet yazarDS = DBIslemleri.YazarCek(TextBox1.Text);
            DropDownList1.DataTextField = "AdiSoyadi";
            DropDownList1.DataValueField = "YazarID";
            DropDownList1.DataSource = yazarDS.Tables[0];
            DropDownList1.DataBind();

            Session["YazarID"] = DropDownList1.SelectedValue;

            HyperLink1.Visible = true;
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataSet yazarDS = DBIslemleri.YazarCek(TextBox1.Text);
            DropDownList1.DataTextField = "AdiSoyadi";
            DropDownList1.DataValueField = "YazarID";
            DropDownList1.DataSource = yazarDS.Tables[0];
            DropDownList1.DataBind();

            Session["YazarID"] = DropDownList1.SelectedValue;

            HyperLink1.Visible = true;
        }
    }
}