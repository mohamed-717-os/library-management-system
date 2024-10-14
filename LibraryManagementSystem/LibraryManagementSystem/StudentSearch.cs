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
    public partial class StudentSearch : Form
    {
        public StudentSearch()
        {
            InitializeComponent();
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Dashboard d = new Dashboard();
            d.ShowDialog();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow row = dataGridView1.Rows[e.RowIndex];
            namebox.Text = row.Cells[1].Value.ToString();
            idbox.Text = row.Cells[0].Value.ToString();

            SqlConnection con = new SqlConnection(@"data source=DESKTOP-A9U8PA9\SQLEXPRESS; database = Library; integrated security=SSPI");
            SqlCommand cmd = new SqlCommand("select member.m_id, phone.phone_n, member.address, member.Email from phone \r\njoin member on phone.m_id = member.m_id\r\nwhere member.m_id = '" + row.Cells[0].Value.ToString() + "'", con);
            SqlDataReader dr;

            SqlCommand borowed = new SqlCommand("SELECT \r\n    borrowed.m_id, \r\n    COALESCE(total_books, 0) AS total_books, \r\n    COALESCE(not_returned_books, 0) AS not_returned_books\r\nFROM \r\n    (\r\n        SELECT \r\n            borrowing.m_id, \r\n            COUNT(borrowing.m_id) AS total_books \r\n        FROM \r\n            borrowing \r\n        GROUP BY \r\n            borrowing.m_id\r\n    ) AS borrowed\r\nLEFT JOIN \r\n    (\r\n        SELECT \r\n            borrowing.m_id, \r\n            COUNT(borrowing.m_id) AS not_returned_books \r\n        FROM \r\n            borrowing \r\n        WHERE \r\n            borrowing.returned = 0 \r\n        GROUP BY \r\n            borrowing.m_id\r\n    ) AS not_returned\r\nON \r\n    borrowed.m_id = not_returned.m_id\r\nwhere borrowed.m_id = '"+ row.Cells[0].Value.ToString() + "'\r\nORDER BY \r\n    total_books DESC;", con);
            SqlDataReader br;


            con.Open();
            dr = cmd.ExecuteReader();
            dr.Read();

            phonebox.Text = dr[1].ToString();
            addbox.Text = dr[2].ToString();
            mailbox.Text = dr[3].ToString();
            con.Close();

            con.Open();

            br = borowed.ExecuteReader();
            br.Read();
            if (br.HasRows)
            {
                alln.Text = br[1].ToString();
                myn.Text = br[2].ToString();
            }
            else
            {
                alln.Text = "0";
                myn.Text = "0";

            }

            con.Close();

        }

        private void StudentSearch_Load(object sender, EventArgs e)
        {
            String CS = @"data source=DESKTOP-A9U8PA9\SQLEXPRESS; database = Library; integrated security=SSPI";
            using (SqlConnection con = new SqlConnection(CS))
            {

                SqlCommand cmd = new SqlCommand("SELECT member.m_id as 'رقم التعرييف', member.name as 'اسم الطالب', COUNT(borrowing.m_id) as 'الكتب المستعارة'\r\nFROM member \r\nleft JOIN borrowing ON member.m_id = borrowing.m_id and returned = 0\r\nGROUP BY member.m_id, member.name\r\norder by 'الكتب المستعارة' desc", con);
                con.Open();
                SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
                DataSet dataset = new DataSet();
                dataAdapter.Fill(dataset);
                dataGridView1.DataSource = dataset.Tables[0];
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            this.Hide();
            AddStudent s = new AddStudent();
            s.ShowDialog();
        }

        private void txtBookName_TextChanged(object sender, EventArgs e)
        {
            String CS = @"data source=DESKTOP-A9U8PA9\SQLEXPRESS; database = Library; integrated security=SSPI";
            using (SqlConnection con = new SqlConnection(CS))
            {

                SqlCommand cmd = new SqlCommand("SELECT member.m_id as 'رقم التعرييف', member.name as 'اسم الطالب', COUNT(borrowing.m_id) as 'الكتب المستعارة' \r\nFROM member\r\nleft JOIN borrowing ON member.m_id = borrowing.m_id and returned = 0 \r\nwhere member.name like '" + txtBookName.Text + "%'\r\nGROUP BY member.m_id, member.name order by 'الكتب المستعارة' desc", con);
                con.Open();
                SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
                DataSet dataset = new DataSet();
                dataAdapter.Fill(dataset);
                dataGridView1.DataSource = dataset.Tables[0];
            }
        }

        private void label9_Click(object sender, EventArgs e)
        {

        }

        private void textBox7_TextChanged(object sender, EventArgs e)
        {

        }

        private void idbox_TextChanged(object sender, EventArgs e)
        {

        }

        private void phonebox_TextChanged(object sender, EventArgs e)
        {

        }

        private void namebox_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
