using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace kitap_degerlendirme_ve_tavsiye
{
    public partial class yazar_detay : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool sonuc = Convert.ToBoolean(Session["giris"]);
            if (sonuc == false)
                Response.Redirect("kullanici_giris.aspx?msg=Lutfen once giris yapiniz");
            int yazarID = Convert.ToInt32(Session["YazarID"]);
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["KitapID"] = GridView1.SelectedValue;
        }
    }
}