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
    public partial class AddStudent : Form
    {
        public AddStudent()
        {
            InitializeComponent();
        }

        private void jFlatButton2_Click(object sender, EventArgs e)
        {

        }

        private void circularPicture1_Click(object sender, EventArgs e)
        {
            this.Hide();
        }

        private void pictureBox4_Click(object sender, EventArgs e)
        {

        }

        private void btnSaveStInfo_Click(object sender, EventArgs e)
        {
           
        }

        private void btnStInfoRefrsh_Click(object sender, EventArgs e)
        {
            txtstName.Clear();
            txtstNumber.Clear();
            txtstaddress.Clear();
            txtstSemester.Clear();
            txtstEmail.Clear();
        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {
            this.Hide();
        }

        private void pictureBox5_Click(object sender, EventArgs e)
        {

        }

        private void pictureBox5_Click_1(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            String CS = @"data source=DESKTOP-A9U8PA9\SQLEXPRESS; database = Library; integrated security=SSPI";
            using (SqlConnection con = new SqlConnection(CS))
            {
                try
                {

                    SqlCommand cmd1 = new SqlCommand("insert into member values('" + txtstName.Text + "', '" + txtstaddress.Text + "', '" + txtstEmail.Text + "'); select * from member\r\nwhere member.name = '"+ txtstName.Text + "'\r\n ", con);
                    SqlDataReader dr;

                    con.Open();
                    dr = cmd1.ExecuteReader();
                    dr.Read();
                    string id = dr[0].ToString();
                    con.Close();
                    
                    SqlCommand cmd2 = new SqlCommand("insert into phone values ('"+id+"', '" + txtstNumber.Text + "') ", con);
                    con.Open();
                    cmd2.ExecuteNonQuery();

                    MessageBox.Show("تم حفظ بيانات الطالب", " تم" + MessageBoxButtons.OK + MessageBoxIcon.Information);
                    txtstName.Clear();
                    txtstNumber.Clear();
                    txtstaddress.Clear();
                    //txtstSemester.Clear();
                    //txtstContact.Clear();
                    txtstEmail.Clear();
                }
                catch (Exception)
                {
                    MessageBox.Show("تأكد من البيانات المرفقة", "خطأ" + MessageBoxButtons.OK + MessageBoxIcon.Warning);
                }
            }   
        }
    }
}
