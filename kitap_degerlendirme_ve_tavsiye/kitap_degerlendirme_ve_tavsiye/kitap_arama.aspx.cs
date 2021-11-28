using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace kitap_degerlendirme_ve_tavsiye
{
    public partial class kitap_arama : System.Web.UI.Page
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
            DataSet kitapDS = DBIslemleri.KitapCek(TextBox1.Text);
            DropDownList1.DataTextField = "Isim";
            DropDownList1.DataValueField = "KitapID";
            DropDownList1.DataSource = kitapDS.Tables[0];
            DropDownList1.DataBind();

            Session["KitapID"] = DropDownList1.SelectedValue;

            HyperLink1.Visible = true;
        }
        

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataSet kitapDS = DBIslemleri.KitapCek(TextBox1.Text);
            DropDownList1.DataTextField = "Isim";
            DropDownList1.DataValueField = "KitapID";
            DropDownList1.DataSource = kitapDS.Tables[0];
            DropDownList1.DataBind();

            Session["KitapID"] = DropDownList1.SelectedValue;

            HyperLink1.Visible = true;
        }
    }
}