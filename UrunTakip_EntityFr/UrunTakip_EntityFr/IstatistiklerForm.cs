using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace UrunTakip_EntityFr
{
    public partial class IstatistiklerForm : Form
    {
        public IstatistiklerForm()
        {
            InitializeComponent();
        }

        private void pctClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void pctBack_Click(object sender, EventArgs e)
        {
            MenuForm frm = new MenuForm();
            this.Hide();
            frm.Show();
        }

        UrunDbEntities db = new UrunDbEntities();

        private void IstatistiklerForm_Load(object sender, EventArgs e)
        {
            lblKategoriSayısı.Text = db.Kategori.Count().ToString();
            lblToplamUrunSayısı.Text = db.Urun.Count().ToString();
            lblAktifMusteriSayısı.Text = db.Musteri.Count(x => x.musteriDurum == true).ToString();
            lblPasifMusteriSayısı.Text = db.Musteri.Count(x => x.musteriDurum == false).ToString();
            lblToplamStok.Text = db.Urun.Sum(x => x.urunStok).ToString();
            lblKasadakiToplamTutar.Text = db.Satıs.Sum(x => x.satısFiyat).ToString() + "  TL";

            lblEnYuksekFiyatliUrun.Text = (from x in db.Urun orderby x.urunFiyat descending select x.urunAd).FirstOrDefault();
            lblEnDusukFiyatliUrun.Text = (from x in db.Urun orderby x.urunFiyat ascending select x.urunAd).FirstOrDefault();
            lblBeyazEsyaSayısı.Text = db.Urun.Count(x => x.Kategori.kategoriId == 4).ToString();
            lblMarkaSayisi.Text = (from x in db.Urun select x.urunMarka).Distinct().Count().ToString();
            lblSehirSayisi.Text = (from x in db.Musteri select x.musteriSehir).Distinct().Count().ToString();
            lblEnFazlaUrunluMarka.Text = db.MarkaGetir().FirstOrDefault();
        }
    }
}
