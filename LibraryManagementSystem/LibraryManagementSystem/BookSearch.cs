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

namespace LibraryManagementSystem
{
    public partial class BookSearch : Form
    {
        public BookSearch()
        {
            InitializeComponent();
        }

        private void BookSearch_Load(object sender, EventArgs e)
        {
            String CS = @"data source=DESKTOP-A9U8PA9\SQLEXPRESS; database = Library; integrated security=SSPI";
            using (SqlConnection con = new SqlConnection(CS))
            {

                SqlCommand cmd = new SqlCommand("select B_id as 'رقم التعريف', title as 'اسم الكتاب', auther as 'الكاتب', location as 'مكان الكتاب', quantity as 'الكمية', name as 'الناشر' from Books join publisher on Books.p_id = publisher.p_id;", con);
                con.Open();
                SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
                DataSet dataset = new DataSet();
                dataAdapter.Fill(dataset);
                dataGridView1.DataSource = dataset.Tables[0];
            }
        }

        private void txtBookName_TextChanged(object sender, EventArgs e)
        {

            String CS = @"data source=DESKTOP-A9U8PA9\SQLEXPRESS; database = Library; integrated security=SSPI";
            using (SqlConnection con = new SqlConnection(CS))
            {

                SqlCommand cmd = new SqlCommand("select B_id as 'رقم التعريف', title as 'اسم الكتاب', auther as 'الكاتب', location as 'مكان الكتاب', quantity as 'الكمية', name as 'الناشر' from Books join publisher on Books.p_id = publisher.p_id where title like '" + txtBookName.Text + "%'", con);
                con.Open();
                SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
                DataSet dataset = new DataSet();
                dataAdapter.Fill(dataset);
                dataGridView1.DataSource = dataset.Tables[0];
            }
            
            
        }

        private void btnRefreshbkname_Click(object sender, EventArgs e)
        {
            txtBookName.Clear();
        }

        private void circularPicture1_Click(object sender, EventArgs e)
        {
            this.Hide();
        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
           
        }

        private void button3_Click(object sender, EventArgs e)
        {
            this.Hide();
            AddBook b = new AddBook();
            b.ShowDialog();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
