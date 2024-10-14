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
    public partial class IssueBook : Form
    {
        public IssueBook()
        {
            InitializeComponent();
        }

        private void IssueBook_Load(object sender, EventArgs e)
        {
            // Connection string
            string connectionString = @"data source=DESKTOP-A9U8PA9\SQLEXPRESS; database=Library; integrated security=SSPI";

            using (SqlConnection con = new SqlConnection(connectionString))
            {

                // Initialize SqlCommand and open connection
                SqlCommand cmd = new SqlCommand("SELECT title FROM Books", con);
                
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                    
                while (reader.Read())
                {
                    comboBoxBK.Items.Add(reader.GetString(0));
                }  
            }

            comboBoxBK.AutoCompleteMode = AutoCompleteMode.SuggestAppend;
            comboBoxBK.AutoCompleteSource = AutoCompleteSource.ListItems;
        }

        private void circularPicture1_Click(object sender, EventArgs e)
        {
            this.Hide();
        }

        private void jFlatButton1_Click(object sender, EventArgs e)
        {
            
        }

        private void panel5_Paint(object sender, PaintEventArgs e)
        {

        }

        private void btnStRefresh_Click(object sender, EventArgs e)
        {
        }
        private void btnSearchSt_Click(object sender, EventArgs e)
        {

        }

        private void btnIssueBk_Click(object sender, EventArgs e)
        {
            
        }

        private void txtStNumber_TextChanged(object sender, EventArgs e)
        {
        }

        private void pictureBox3_Click(object sender, EventArgs e)
        {

        }

        private void txtStName_TextChanged(object sender, EventArgs e)
        {

        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void pictureBox5_Click(object sender, EventArgs e)
        {

        }

        private void panel14_Paint(object sender, PaintEventArgs e)
        {

        }

        private void button5_Click(object sender, EventArgs e)
        {
         
            String CS = @"data source=DESKTOP-A9U8PA9\SQLEXPRESS; database = Library; integrated security=SSPI";
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand s = new SqlCommand("select Books.B_id, member.m_id, title, name from Books\r\njoin member on 1=1\r\nwhere Books.title = '" + comboBoxBK.Text + "' and member.name = '" + txtStName.Text + "' ", con);
                
                con.Open();
                SqlDataReader dr = s.ExecuteReader();
                dr.Read();
                string Bid = dr[0].ToString();
                string mid = dr[1].ToString();
                con.Close();

                SqlCommand cmd = new SqlCommand("insert into borrowing values('"+Bid+ "', '"+mid+"', '"+ dateTimePicker.Text + "' ,'"+ dateTimePicker1.Text +"', 0) ", con);
                con.Open();
                cmd.ExecuteNonQuery();
                MessageBox.Show(" تمت العملية بنجاح", " تم", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtStName.Clear();
                comboBoxBK.Text = " ";
            }
                
            
        }

        private void comboBoxBK_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
