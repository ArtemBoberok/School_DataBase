using DataBase_School.Forms;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DataBase_School
{
    public partial class Authorization : Form
    {
        public Authorization()
        {
            InitializeComponent();
            this.Font = new Font("Comic Sans MS", 12, FontStyle.Bold);
        }

        private void buttonOk_Click(object sender, EventArgs e)
        {
            string logUser = textBoxLogin.Text;
            string passUser = textBoxPassword.Text;
            SqlConnection conn = new SqlConnection(Connection.con);
            try
            {
                conn.Open();
                string query = $"SELECT * FROM [dbo].[User] WHERE [Login]='{logUser}' AND [Password]='{passUser}'";

                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataReader reader = cmd.ExecuteReader();

                if(reader.Read())
                {
                    MessageBox.Show("Вы успено вошли !", "Авторизация", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    fmMainWindow mainWindow = new fmMainWindow();
                    mainWindow.Owner = this;
                    this.Hide();
                    mainWindow.Show();
                }
                else
                {
                    MessageBox.Show("Не верный логин и пароль !", "Авторизация", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
                reader.Close();
                conn.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }

        private void Authorization_FormClosing(object sender, FormClosingEventArgs e)
        {
            DialogResult x = MessageBox.Show("Вы действительно хотите закрытьприложение?", "Выйти", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
            if (x == DialogResult.Cancel)
                e.Cancel = true;
        }

        private void buttonCancel_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Вы уверены, что хотите выйти?", "Предупреждение",
                MessageBoxButtons.YesNo) == DialogResult.Yes)
            {
                this.Close();
            }
        }
    }
}
