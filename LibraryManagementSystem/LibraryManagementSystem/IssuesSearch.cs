using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace LibraryManagementSystem
{
    public partial class IssuesSearch : Form
    {
        public IssuesSearch()
        {
            InitializeComponent();
        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {
            this.Hide();
        }
        string B_id;
        string m_id;
        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow row = dataGridView1.Rows[e.RowIndex];
            stdbox.Text = row.Cells[3].Value.ToString();
            bkbox.Text = row.Cells[1].Value.ToString();

            B_id = row.Cells[0].Value.ToString();
            m_id = row.Cells[2].Value.ToString();

            SqlConnection con = new SqlConnection(@"data source=DESKTOP-A9U8PA9\SQLEXPRESS; database = Library; integrated security=SSPI");
            SqlCommand cmd = new SqlCommand("select * from borrowing where B_id = '" + B_id + "' and m_id = '" + m_id + "'", con);
            SqlDataReader dr;

            con.Open();
            dr = cmd.ExecuteReader();
            dr.Read();

            duebox.Text = ((DateTime)dr[2]).ToString("yyyy-MM-dd");
            returnbox.Text = ((DateTime)dr[3]).ToString("yyyy-MM-dd");
            con.Close();

        }

        private void IssuesSearch_Load(object sender, EventArgs e)
        {
            String CS = @"data source=DESKTOP-A9U8PA9\SQLEXPRESS; database = Library; integrated security=SSPI";
            using (SqlConnection con = new SqlConnection(CS))
            {

                SqlCommand cmd = new SqlCommand("select borrowing.B_id as 'رقم تعريف الكتاب',title as 'عنوان الكتاب', borrowing.m_id as 'رقم تعريف الطالب', name as 'اسم الطالب', borrowing.return_date as 'تاريخ التسليم' from borrowing\r\njoin member on borrowing.m_id=member.m_id\r\njoin Books on borrowing.B_id = Books.B_id\r\nwhere borrowing.returned = 0\r\n", con);
                con.Open();
                SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
                DataSet dataset = new DataSet();
                dataAdapter.Fill(dataset);
                dataGridView1.DataSource = dataset.Tables[0];
            }
        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {
            if (checkBox1.Checked)
            {
                SqlConnection con = new SqlConnection(@"data source=DESKTOP-A9U8PA9\SQLEXPRESS; database = Library; integrated security=SSPI");
                SqlCommand cmd = new SqlCommand("update borrowing set returned = 1 where B_id = '" + B_id + "' and m_id = '" + m_id + "'", con);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();


                String CS = @"data source=DESKTOP-A9U8PA9\SQLEXPRESS; database = Library; integrated security=SSPI";
                using (SqlConnection f_con = new SqlConnection(CS))
                {

                    SqlCommand f_cmd = new SqlCommand("select borrowing.B_id as 'رقم تعريف الكتاب',title as 'عنوان الكتاب', borrowing.m_id as 'رقم تعريف الطالب', name as 'اسم الطالب', borrowing.return_date as 'تاريخ التسليم' from borrowing\r\njoin member on borrowing.m_id=member.m_id\r\njoin Books on borrowing.B_id = Books.B_id\r\nwhere borrowing.returned = 0\r\n", con);
                    con.Open();
                    SqlDataAdapter dataAdapter = new SqlDataAdapter(f_cmd);
                    DataSet dataset = new DataSet();
                    dataAdapter.Fill(dataset);
                    dataGridView1.DataSource = dataset.Tables[0];
                    con.Close();
                }

                stdbox.Clear();
                bkbox.Clear();
                duebox.Clear();
                returnbox.Clear();
                checkBox1.Checked = false;
            }
        }

        private void txtBookName_TextChanged(object sender, EventArgs e)
        {
            String CS = @"data source=DESKTOP-A9U8PA9\SQLEXPRESS; database = Library; integrated security=SSPI";
            using (SqlConnection con = new SqlConnection(CS))
            {

                SqlCommand cmd = new SqlCommand("select borrowing.B_id as 'رقم تعريف الكتاب',title as 'عنوان الكتاب', borrowing.m_id as 'رقم تعريف الطالب', name as 'اسم الطالب', borrowing.return_date as 'تاريخ التسليم' from borrowing\r\njoin member on borrowing.m_id=member.m_id\r\njoin Books on borrowing.B_id = Books.B_id\r\nwhere borrowing.returned = 0 and (Books.title like '" + txtBookName.Text + "%' or member.name like '" + txtBookName.Text + "%') ", con);
                con.Open();
                SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
                DataSet dataset = new DataSet();
                dataAdapter.Fill(dataset);
                dataGridView1.DataSource = dataset.Tables[0];

            }
        }
    }
}
