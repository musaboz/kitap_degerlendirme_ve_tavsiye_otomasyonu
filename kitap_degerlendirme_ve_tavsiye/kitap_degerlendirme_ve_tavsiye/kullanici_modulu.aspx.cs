using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace kitap_degerlendirme_ve_tavsiye
{
    public partial class kullanici_modulu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool sonuc = Convert.ToBoolean(Session["giris"]);
            if (sonuc == false)
                Response.Redirect("kullanici_giris.aspx?msg=Lutfen once giris yapiniz");

            int kid = Convert.ToInt32(Session["kID"]);

            DataSet oneri1 = DBIslemleri.Oneri1(kid);

            GridView1.DataSource = oneri1.Tables[0];
            GridView1.DataBind();

            DataSet oneri2 = DBIslemleri.Oneri2(kid);

            GridView2.DataSource = oneri2.Tables[0];
            GridView2.DataBind();

            DataSet kitaponeri = DBIslemleri.KitapOneri(kid);

            GridView3.DataSource = kitaponeri.Tables[0];
            GridView3.DataBind();
        }
    }
}