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
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace LibraryManagementSystem
{
    public partial class AddBook : Form
    {
        public AddBook()
        {
            InitializeComponent();
        }

        private void circularPicture1_Click(object sender, EventArgs e)
        {
            this.Hide();
        }

        private void panel5_Paint(object sender, PaintEventArgs e)
        {

        }

        private void dateTimePicker1_ValueChanged(object sender, EventArgs e)
        {

        }

        private void btnSaveBook_Click(object sender, EventArgs e)
        {
        }

        private void btnBookCancel_Click(object sender, EventArgs e)
        {
            namebox.Clear();
            Authorbox.Clear();
            Publicationbox.Clear();
            // bkPurchaseDate.Clear();
            locationbox.Clear();
            Quantitybox.Clear();
        }

        private void AddBook_Load(object sender, EventArgs e)
        {

        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {
            this.Hide();
        }

        private void txtbkName_TextChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            String CS = @"data source=DESKTOP-A9U8PA9\SQLEXPRESS; database = Library; integrated security=SSPI";
            using (SqlConnection con = new SqlConnection(CS))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("SELECT name, p_id FROM publisher", con);
                    int p_id = 0;

                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        if (reader.GetString(0) == Publicationbox.Text)
                        {
                            p_id = reader.GetInt32(1);
                            con.Close();
                            con.Open();

                            SqlCommand add_book = new SqlCommand("insert into Books values('" + namebox.Text + "', '" + Authorbox.Text + "', '" + locationbox.Text + "', '" + Quantitybox.Text + "', '" + p_id + "') ", con);
                            add_book.ExecuteNonQuery();
                            con.Close();
                            MessageBox.Show("تم حفظ بيانات الكتاب", " تم" + MessageBoxButtons.OK + MessageBoxIcon.Information);
                            break;
                        };

                    }
                    reader.Close();
                    if (p_id == 0)
                    {
                        SqlCommand add_pub = new SqlCommand("insert into publisher values ('" + Publicationbox.Text + "', null); insert into Books values('" + namebox.Text + "', '" + Authorbox.Text + "', '" + locationbox.Text + "', '" + Quantitybox.Text + "', null) ", con);

                        add_pub.ExecuteNonQuery();
                        con.Close();
                        MessageBox.Show("تم حفظ بيانات الكتاب", " تم" + MessageBoxButtons.OK + MessageBoxIcon.Information);
                        namebox.Clear();
                        Authorbox.Clear();
                        Publicationbox.Clear();
                        locationbox.Clear();
                        Quantitybox.Clear();
                    }

                }
                catch (Exception)
                {
                    MessageBox.Show("تأكد من البيانات المرفقة", "خطأ" + MessageBoxButtons.OK + MessageBoxIcon.Warning);
                }

            }
        }
    }
}
