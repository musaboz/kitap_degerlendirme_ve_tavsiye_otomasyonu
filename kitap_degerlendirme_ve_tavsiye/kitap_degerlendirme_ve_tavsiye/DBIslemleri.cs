using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace kitap_degerlendirme_ve_tavsiye
{
    public class DBIslemleri
    {
        static string by = ConfigurationManager.ConnectionStrings["DBYolu"].ToString();
        static SqlConnection conn = new SqlConnection(by);

        public static bool yoneticiGiris(string kadi, string sifre)
        {
            string sql = "select * from YöneticiTanım where KullaniciAdi=@pkadi and Sifre=@psifre";
            SqlCommand komut = new SqlCommand(sql, conn);
            komut.Parameters.AddWithValue("pkadi", kadi);
            komut.Parameters.AddWithValue("psifre", sifre);

            conn.Open();
            bool varMi = false;
            SqlDataReader okuyucu = komut.ExecuteReader();
            if (okuyucu.HasRows)
                varMi = true;
            okuyucu.Close();
            conn.Close();
            return varMi;
        }

        public static void kitaptanitimEkle(int id, string isim, string resim, string yazar, string yevi)
        {
            string sql = "insert into KitaplarTanım(YazarID, Isim, Resim, Yazari, YayinEvi) values(@pid ,@pisim, @presim, @pyazar, @pyevi)";
            SqlCommand komut = new SqlCommand(sql, conn);
            komut.Parameters.AddWithValue("pid", id);
            komut.Parameters.AddWithValue("pisim", isim);
            komut.Parameters.AddWithValue("presim", resim);
            komut.Parameters.AddWithValue("pyazar", yazar);
            komut.Parameters.AddWithValue("pyevi", yevi);

            conn.Open();
            komut.ExecuteNonQuery();
            conn.Close();
        }

        public static void kullaniciEkle(string isim, string soyisim, char cinsiyet, string dtarihi, string kadi, string sifre, string resim)
        {
            string sql = "insert into KullanıcılarTanım values(@pisim, @psoyisim, @pcins, @pdogum, @pkadi, @psifre, @presim)";
            SqlCommand komut = new SqlCommand(sql, conn);
            komut.Parameters.AddWithValue("pisim", isim);
            komut.Parameters.AddWithValue("psoyisim", soyisim);
            komut.Parameters.AddWithValue("pcins", cinsiyet);
            komut.Parameters.AddWithValue("pdogum", dtarihi);
            komut.Parameters.AddWithValue("pkadi", kadi);
            komut.Parameters.AddWithValue("psifre", sifre);
            komut.Parameters.AddWithValue("presim", resim);

            conn.Open();
            komut.ExecuteNonQuery();
            conn.Close();
        }

        public static bool kullaniciGiris(string kadi, string sifre)
        {
            string sql = "select KullaniciAdi, Sifre from KullanıcılarTanım where KullaniciAdi=@pkadi and Sifre=@psifre";
            SqlCommand komut = new SqlCommand(sql, conn);
            komut.Parameters.AddWithValue("pkadi", kadi);
            komut.Parameters.AddWithValue("psifre", sifre);

            conn.Open();
            bool varMi = false;
            SqlDataReader okuyucu = komut.ExecuteReader();
            if (okuyucu.HasRows)
                varMi = true;
            okuyucu.Close();
            conn.Close();
            return varMi;
        }

        public static DataSet YazarCek(string isim)
        {
            string sql = "select * from YazarlarTanım where AdiSoyadi like @padi+'%'";
            SqlCommand komut = new SqlCommand(sql, conn);
            komut.Parameters.AddWithValue("padi", isim);
            SqlDataAdapter adaptor = new SqlDataAdapter();
            adaptor.SelectCommand = komut;
            DataSet sonucAra = new DataSet();
            conn.Open();
            adaptor.Fill(sonucAra);
            conn.Close();
            return sonucAra;
        }

        public static DataSet KitapCek(string isim)
        {
            string sql = "select * from KitaplarTanım where Isim like @padi+'%'";
            SqlCommand komut = new SqlCommand(sql, conn);
            komut.Parameters.AddWithValue("padi", isim);
            SqlDataAdapter adaptor = new SqlDataAdapter();
            adaptor.SelectCommand = komut;
            DataSet sonucAra = new DataSet();
            conn.Open();
            adaptor.Fill(sonucAra);
            conn.Close();
            return sonucAra;
        }

        public static DataSet kullaniciCek(string isim)
        {
            string sql = "select * from KullanıcılarTanım where Isim like @padi+'%'";
            SqlCommand komut = new SqlCommand(sql, conn);
            komut.Parameters.AddWithValue("padi", isim);
            SqlDataAdapter adaptor = new SqlDataAdapter(komut);
            DataSet sonucAra = new DataSet();
            conn.Open();
            adaptor.Fill(sonucAra);
            conn.Close();
            return sonucAra;
        }

        
        public static void mesajGonder(int gonderenid, int gidenid, string baslik, string mesaj)
        {
            string sql = "insert into Mesajlar(GonderenID, GidenID, Baslik, Mesaj) values(@pgonderenid, @pgidenid, @pbaslik, @pmesaj)";
            SqlCommand komut = new SqlCommand(sql, conn);
            komut.Parameters.AddWithValue("pgonderenid", gonderenid);
            komut.Parameters.AddWithValue("pgidenid", gidenid);
            komut.Parameters.AddWithValue("pbaslik", baslik);
            komut.Parameters.AddWithValue("pmesaj", mesaj);

            conn.Open();
            komut.ExecuteNonQuery();
            conn.Close();
        }

        public static DataSet kullaniciidCek(string kadi, string sifre)
        {
            string sql = "select KullaniciID, KullaniciAdi from KullanıcılarTanım where KullaniciAdi=@pkadi and Sifre=@psifre";
            SqlCommand komut = new SqlCommand(sql, conn);
            komut.Parameters.AddWithValue("pkadi", kadi);
            komut.Parameters.AddWithValue("psifre", sifre);

            SqlDataAdapter adaptor = new SqlDataAdapter(komut);
            DataSet sonucAra = new DataSet();
            conn.Open();
            adaptor.Fill(sonucAra);
            conn.Close();
            return sonucAra;
            
        }

        public static void KitapKaydiEkle(int kitapid, int kadi, int okuma, string inceleme, int sayfano, string alinti, int puan)
        {
            string sql1 = "insert into KitapOkunma(KullaniciID, KitapID, Okunma) values(@pkadi, @pkitapid, @pokuma)";
            SqlCommand komut = new SqlCommand(sql1, conn);
            komut.Parameters.AddWithValue("pkadi", kadi);
            komut.Parameters.AddWithValue("pkitapid", kitapid);
            komut.Parameters.AddWithValue("pokuma", okuma);

            string sql2 = "insert into KitapInceleme(KullaniciID, KitapID, Inceleme) values(@pkadi, @pkitapid, @pinceleme)";
            SqlCommand komut2 = new SqlCommand(sql2, conn);
            komut2.Parameters.AddWithValue("pkadi", kadi);
            komut2.Parameters.AddWithValue("pkitapid", kitapid);
            komut2.Parameters.AddWithValue("pinceleme", inceleme);

            string sql3 = "insert into KitapAlıntı(KullaniciID, KitapID, SayfaNo, Cumle) values(@pkadi, @pkitapid, @psayfano, @palinti)";
            SqlCommand komut3 = new SqlCommand(sql3, conn);
            komut3.Parameters.AddWithValue("pkadi", kadi);
            komut3.Parameters.AddWithValue("pkitapid", kitapid);
            komut3.Parameters.AddWithValue("psayfano", sayfano);
            komut3.Parameters.AddWithValue("palinti", alinti);

            string sql4 = "insert into KitapPuan(KullaniciID, KitapID, Puan) values(@pkadi, @pkitapid, @ppuan)";
            SqlCommand komut4 = new SqlCommand(sql4, conn);
            komut4.Parameters.AddWithValue("pkadi", kadi);
            komut4.Parameters.AddWithValue("pkitapid", kitapid);
            komut4.Parameters.AddWithValue("ppuan", puan);

            conn.Open();
            komut.ExecuteNonQuery();
            komut2.ExecuteNonQuery();
            komut3.ExecuteNonQuery();
            komut4.ExecuteNonQuery();
            conn.Close();
        }

        public static DataSet KitapDetayCek(int kitapID)
        {
            string sql = "select KitapID, Isim, Yazari, YayinEvi from KitaplarTanım where KitapID=@kitapID";
            SqlCommand komut = new SqlCommand(sql, conn);
            komut.Parameters.AddWithValue("kitapid", kitapID);
            DataSet kitapdetay = new DataSet();
            SqlDataAdapter adaptor = new SqlDataAdapter(komut);
            conn.Open();
            adaptor.Fill(kitapdetay);
            conn.Close();
            return kitapdetay;
        }

        public static DataSet PopulerKitaplar()
        {
            string sql = "select (select KitapID from KitaplarTanım where KitapID=KitapOkunma.KitapID) as 'KitapID', count(Okunma) as 'Okunma Sayısı',(select Isim from KitaplarTanım where KitapID=KitapOkunma.KitapID) as 'Kitap Adı' from KitapOkunma, KitaplarTanım where KitaplarTanım.KitapID=KitapOkunma.KitapID group by KitapOkunma.KitapID order by count(Okunma) desc";
            SqlCommand komut = new SqlCommand(sql, conn);
            DataSet kitapdetay = new DataSet();
            SqlDataAdapter adaptor = new SqlDataAdapter(komut);
            conn.Open();
            adaptor.Fill(kitapdetay);
            conn.Close();
            return kitapdetay;
        }

        public static DataSet Oneri1(int kid)
        {
            string sql = "select KitapOkunma.KullaniciID, (select distinct KullaniciAdi from KullanıcılarTanım where KullaniciID=KitapOkunma.KullaniciID) as 'Kullanıcı' , count(Okunma) as 'Okunma Sayısı' from KitaplarTanım, KitapOkunma where KitaplarTanım.KitapID = KitapOkunma.KitapID and KitaplarTanım.Isim like 'Ö%' group by KitapOkunma.KullaniciID having KitapOkunma.KullaniciID not in (@kid)";
            SqlCommand komut = new SqlCommand(sql, conn);
            komut.Parameters.AddWithValue("kid", kid);
            DataSet o1 = new DataSet();
            SqlDataAdapter adaptor = new SqlDataAdapter(komut);
            conn.Open();
            adaptor.Fill(o1);
            conn.Close();
            return o1;
        }

        public static DataSet Oneri2(int kid)
        {
            string sql = "select KitapPuan.KullaniciID, (select distinct KullaniciAdi from KullanıcılarTanım where KullaniciID=KitapPuan.KullaniciID) as 'Kullanıcı' from KitaplarTanım, KitapPuan where KitaplarTanım.KitapID = KitapPuan.KitapID group by KitapPuan.KullaniciID having sum(KitapPuan.Puan) = 100 and KitapPuan.KullaniciID not in (@kid)";
            SqlCommand komut = new SqlCommand(sql, conn);
            komut.Parameters.AddWithValue("kid", kid);
            DataSet o2 = new DataSet();
            SqlDataAdapter adaptor = new SqlDataAdapter(komut);
            conn.Open();
            adaptor.Fill(o2);
            conn.Close();
            return o2;
        }

        public static DataSet KitapOneri(int kid)
        {
            string sql = "select TOP 10 KitaplarTanım.Isim from KitaplarTanım, KullanıcılarTanım, KitapOkunma where KitaplarTanım.KitapID = KitapOkunma.KitapID and KitapOkunma.KullaniciID = KullanıcılarTanım.KullaniciID and KitapOkunma.KullaniciID not in (@kid) and KitapOkunma.KitapID not in (101) order by RAND()";
            SqlCommand komut = new SqlCommand(sql, conn);
            komut.Parameters.AddWithValue("kid", kid);
            DataSet ko = new DataSet();
            SqlDataAdapter adaptor = new SqlDataAdapter(komut);
            conn.Open();
            adaptor.Fill(ko);
            conn.Close();
            return ko;
        }
    }
}