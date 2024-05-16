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
    public partial class fmGoods : Form
    {
        public fmGoods()
        {
            InitializeComponent();
            this.Font = new Font("Comic Sans MS", 12, FontStyle.Bold);
        }

        private void fmGoods_FormClosing(object sender, FormClosingEventArgs e)
        {
            DialogResult x = MessageBox.Show("Вы действительно хотите закрытьприложение?", "Выйти", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
            if (x == DialogResult.Cancel)
                e.Cancel = true;
        }
    }
}
