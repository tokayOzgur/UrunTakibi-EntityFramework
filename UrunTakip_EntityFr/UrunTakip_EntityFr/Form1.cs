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
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        UrunDbEntities db = new UrunDbEntities();

        private void pctClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnListele_Click(object sender, EventArgs e)
        {
            var kategoriler = db.Kategori.ToList();
            dataGridView1.DataSource = kategoriler;
        }

        private void btnEkle_Click(object sender, EventArgs e)
        {
            Kategori ktg = new Kategori();

            ktg.kategoriAd = txtAd.Text;
            db.Kategori.Add(ktg); //yeni değerleri tutan nesneyi dataya ekle
            db.SaveChanges(); // değişiklikleri kaydet (birnevi execute işlemine tekabül eder)

            MessageBox.Show("Yeni Kategori Eklendi.", "Bilgi!", MessageBoxButtons.OK, MessageBoxIcon.Information);

        }

        private void btnSil_Click(object sender, EventArgs e)
        {
            int x = Convert.ToInt32(txtId.Text);
            var ktgr = db.Kategori.Find(x);
            db.Kategori.Remove(ktgr);
            db.SaveChanges();

            MessageBox.Show("Kategori Silindi.", "Bilgi!", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        private void btnGuncelle_Click(object sender, EventArgs e)
        {
            int x = Convert.ToInt32(txtId.Text);
            var ktgr = db.Kategori.Find(x);
            ktgr.kategoriAd = txtAd.Text;
            db.SaveChanges();

            MessageBox.Show("Kategori Güncellendi.", "Bilgi!", MessageBoxButtons.OK, MessageBoxIcon.Information);

        }

        private void pctBack_Click(object sender, EventArgs e)
        {
            MenuForm frm = new MenuForm();
            frm.Show();
            this.Hide();
        }
    }
}
