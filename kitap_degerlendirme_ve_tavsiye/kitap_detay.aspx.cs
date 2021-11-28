using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace kitap_degerlendirme_ve_tavsiye
{
    public partial class kitap_detay : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool sonuc = Convert.ToBoolean(Session["giris"]);
            if (sonuc == false)
                Response.Redirect("kullanici_giris.aspx?msg=Lutfen once giris yapiniz");

            int kitapid = Convert.ToInt32(Session["KitapID"]);

            string by = ConfigurationManager.ConnectionStrings["DBYolu"].ToString();
            SqlConnection conn = new SqlConnection(by);
            conn.Open();
            string sql = "select Resim from KitaplarTanım where KitapID=" + kitapid;
            SqlCommand komut = new SqlCommand(sql, conn);

            SqlDataReader veriokuyucu = komut.ExecuteReader();

            while (veriokuyucu.Read())
            {
                Image1.ImageUrl = "~/resimler/kitapresim/" + veriokuyucu[0].ToString();
                Image1.Width = 100;
                Image1.Height = 100;
            }

            veriokuyucu.Close();
            conn.Close();
        }
    }
}