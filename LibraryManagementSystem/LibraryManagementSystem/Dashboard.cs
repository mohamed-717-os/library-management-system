using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace LibraryManagementSystem
{
    public partial class Dashboard : Form
    {
        public Dashboard()
        {
            InitializeComponent();
        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void panel4_Paint(object sender, PaintEventArgs e)
        {

        }

        private void panel2_Paint(object sender, PaintEventArgs e)
        {

        }

        private void returNBookToolStripMenuItem_Click(object sender, EventArgs e)
        {
        }

        private void Dashboard_Load(object sender, EventArgs e)
        {

        }

        private void completeBookDetailToolStripMenuItem_Click(object sender, EventArgs e)
        {
        }

        private void circularPicture1_Click(object sender, EventArgs e)
        {
            //
        }

        private void dashboardToolStripMenuItem_Click(object sender, EventArgs e)
        {
        }

        private void addNewBookToolStripMenuItem_Click(object sender, EventArgs e)
        {
            AddBook addbook = new AddBook();
            addbook.Show();
        }

        private void viewBooksToolStripMenuItem_Click(object sender, EventArgs e)
        {
        }

        private void viewStudentInfoToolStripMenuItem_Click(object sender, EventArgs e)
        {
        }

        private void studentToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void addNewStudentToolStripMenuItem_Click(object sender, EventArgs e)
        {
            AddStudent addStudent = new AddStudent();
            addStudent.Show();
        }

        private void logOutToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Hide();
        }

        private void issueBookToolStripMenuItem_Click(object sender, EventArgs e)
        {
            IssueBook issuebook = new IssueBook();
            issuebook.Show();
        }

        private void circularProgressBar4_Click(object sender, EventArgs e)
        {

        }

        private void label7_Click(object sender, EventArgs e)
        {
            StudentSearch s = new StudentSearch();
            s.Show();

        }

        private void label4_Click(object sender, EventArgs e)
        {
            BookSearch b = new BookSearch();
            b.Show();
        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            
            IssuesSearch b = new IssuesSearch();
            b.ShowDialog();
        }

        private void groupBox2_Enter(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            IssueBook b = new IssueBook();
            b.Show();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            AddBook b = new AddBook();
            b.ShowDialog();
        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {

        }

        private void pictureBox4_MouseClick(object sender, MouseEventArgs e)
        {
            StudentSearch s = new StudentSearch();
            s.Show();
        }

        private void pictureBox3_Click(object sender, EventArgs e)
        {
            BookSearch b = new BookSearch();
            b.Show();

        }

        private void button5_Click(object sender, EventArgs e)
        {
            this.Hide();
            Login l = new Login();
            l.Show();

        }

        private void button4_Click(object sender, EventArgs e)
        {
            AddStudent s = new AddStudent();
            s.ShowDialog();
        }
    }
}
