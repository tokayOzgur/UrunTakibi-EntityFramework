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
    public partial class UrunForm : Form
    {
        public UrunForm()
        {
            InitializeComponent();
        }

        private void pctClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void pctBack_Click(object sender, EventArgs e)
        {
            MenuForm f = new MenuForm();
            f.Show();
            this.Hide();
        }

        UrunDbEntities db = new UrunDbEntities();

        private void btnListele_Click(object sender, EventArgs e)
        {
            dataGridView1.DataSource = (from x in db.Urun
                                        select new
                                        {
                                            x.urunId,
                                            x.urunAd,
                                            x.urunMarka,
                                            x.urunStok,
                                            x.urunFiyat,
                                            x.urunDurum,
                                            x.Kategori.kategoriAd //böylelikle ilişkili olduğu tabloda id yerine ismini çekebiliyoruz
                                        }).ToList();
        }

        private void btnEkle_Click(object sender, EventArgs e)
        {
            Urun urunler = new Urun();

            urunler.urunAd = txtAd.Text;
            urunler.urunMarka = txtMarka.Text;
            urunler.urunStok = short.Parse(txtStok.Text);
            urunler.urunFiyat = Convert.ToDecimal(txtFiyat.Text);
            urunler.urunDurum = true;
            urunler.u_kategoriID = int.Parse(cmbKategori.SelectedValue.ToString());

            db.Urun.Add(urunler);
            db.SaveChanges();
            MessageBox.Show("Ürün sisteme kaydedildi.");
        }

        private void btnSil_Click(object sender, EventArgs e)
        {
            int x = Convert.ToInt32(txtId.Text);
            var urun = db.Urun.Find(x);
            db.Urun.Remove(urun);
            db.SaveChanges();
        }

        private void btnGuncelle_Click(object sender, EventArgs e)
        {
            int x = Convert.ToInt32(txtId.Text);
            var urun = db.Urun.Find(x);
            urun.urunAd = txtAd.Text;
            urun.urunMarka = txtMarka.Text;
            urun.urunStok = short.Parse(txtStok.Text);

            //urun.urunFiyat = Convert.ToDecimal(txtFiyat.Text);
            //urun.urunDurum = true;
            urun.u_kategoriID = int.Parse(cmbKategori.SelectedValue.ToString());

            db.SaveChanges();
            MessageBox.Show("Ürün başarılı bir şekilde güncellendi.");

        }

        private void UrunForm_Load(object sender, EventArgs e)
        {
            var kategoriler = (from x in db.Kategori
                               select new
                               {
                                   x.kategoriId,
                                   x.kategoriAd
                               }).ToList();
            cmbKategori.ValueMember = "kategoriId";
            cmbKategori.DisplayMember = "kategoriAd";
            cmbKategori.DataSource = kategoriler;
        }

        private void btnTemizle_Click(object sender, EventArgs e)
        {
            txtId.Text = "";
            txtAd.Text = "";
            txtDurum.Text = "";
            txtFiyat.Text = "";
            txtMarka.Text = "";
            txtStok.Text = "";
        }
    }
}
