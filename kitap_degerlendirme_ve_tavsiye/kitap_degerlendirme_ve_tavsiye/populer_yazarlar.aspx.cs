﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace kitap_degerlendirme_ve_tavsiye
{
    public partial class populer_yazarlar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool sonuc = Convert.ToBoolean(Session["giris"]);
            if (sonuc == false)
                Response.Redirect("kullanici_giris.aspx?msg=Lutfen once giris yapiniz");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["KitapID"] = GridView1.SelectedValue;
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["YazarID"] = GridView2.SelectedValue;
        }
    }
}