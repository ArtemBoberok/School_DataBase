using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DataBase_School.Forms
{
    public partial class fmMainWindow : Form
    {
        public fmMainWindow()
        {
            InitializeComponent();
            this.Font = new Font("Comic Sans MS", 12, FontStyle.Bold);
        }

        private void buttonBack_Click(object sender, EventArgs e)
        {
            Authorization Authorization = new Authorization();
            Authorization.Owner = this;
            this.Hide();
            Authorization.Show();
        }

        private void buttonGoods_Click(object sender, EventArgs e)
        {
            fmGoods Goods = new fmGoods();
            Goods.Owner = this;
            this.Hide();
            Goods.Show();
        }

        private void fmMainWindow_FormClosing(object sender, FormClosingEventArgs e)
        {
            DialogResult x = MessageBox.Show("Вы действительно хотите закрытьприложение?", "Выйти", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
            if (x == DialogResult.Cancel)
                e.Cancel = true;
        }
    }
}
