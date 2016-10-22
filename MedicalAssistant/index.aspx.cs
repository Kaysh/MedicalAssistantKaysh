using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
//using System.Data.SqlClient
using System.Net.Mail;




namespace MedicalAssistant
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //drdMedName.Items.Insert(0, "Select");
            if (!IsPostBack)
            //{
            //    DivApp.Visible = true;
            //    DivGoogle.Visible = true;
            //    DivTable.Visible = true;
            //    DivSuburb.Visible = true;
            //}
            // else
            {
                DivApp.Visible = false;
                DivGoogle.Visible = false;
                DivTable.Visible = false;
                DivSuburb.Visible = false;
            }

        }

        protected void drdMedName_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.Visible = true;
            GridView1.DataBind();
        }

        protected void MedScheme_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.DataBind();
            GridView1.Visible = true;

            string connectionStringstats2 = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFileName=|DataDirectory|\\Database.mdf;Integrated Security=True;MultipleActiveResultSets=True";

            using (SqlConnection connection = new SqlConnection(connectionStringstats2))
            {
                SqlCommand cmd = new SqlCommand();


                cmd.CommandText = "INSERT INTO AuditTrial(searchtype, DateCaptured) VALUES (N'Searched by Medical Aid', GETDATE())";
                cmd.CommandType = CommandType.Text;
                cmd.Connection = connection;

                connection.Open();
                cmd.ExecuteNonQuery();
                connection.Close();
            }
        }

        protected void Suburb__SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.DataBind();
            DivGoogle.Visible = true;

            string connectionStringstats = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFileName=|DataDirectory|\\Database.mdf;Integrated Security=True;MultipleActiveResultSets=True";

            using (SqlConnection connection = new SqlConnection(connectionStringstats))
            {
                SqlCommand cmd = new SqlCommand();


                cmd.CommandText = "INSERT INTO AuditTrial(searchtype, DateCaptured) VALUES (N'Searched by Suburb', GETDATE())";
                cmd.CommandType = CommandType.Text;
                cmd.Connection = connection;

                connection.Open();
                cmd.ExecuteNonQuery();
                connection.Close();
            }
            }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            DivTable.Visible = true;
            DivSuburb.Visible = false;
            DivGoogle.Visible = false;
            drdmednamesub.Items.Clear();
            drdmednamesub.DataBind();
            drdtypesub.Items.Clear();
            drdtypesub.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.DataBind();
            GridViewRow row = GridView1.SelectedRow;
            lblid.Text = row.Cells[1].Text;
            lbldoctor.Text = row.Cells[2].Text;
            GridView1.Visible = false;
            DivApp.Visible = true;

            string connectionStringstats3 = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFileName=|DataDirectory|\\Database.mdf;Integrated Security=True;MultipleActiveResultSets=True";

            using (SqlConnection connection = new SqlConnection(connectionStringstats3))
            {
                SqlCommand cmd = new SqlCommand();


                cmd.CommandText = "INSERT INTO AuditTrial(searchtype, DateCaptured) VALUES (N'Booked Appointment', GETDATE())";
                cmd.CommandType = CommandType.Text;
                cmd.Connection = connection;

                connection.Open();
                cmd.ExecuteNonQuery();
                connection.Close();
            }
        }

        protected void drdyear_SelectedIndexChanged(object sender, EventArgs e)

        {
            Page.MaintainScrollPositionOnPostBack = true;
            lbldate.Text = drdyear.SelectedValue + "-" + drdmonth.SelectedValue + "-" + drddate.SelectedValue;
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            DivTable.Visible = false;
            DivSuburb.Visible = true;
            lblconfirm.Visible = false;
            lblvalidate.Visible = false;
        }

        protected void drddate_SelectedIndexChanged(object sender, EventArgs e)
        {
            Page.MaintainScrollPositionOnPostBack = true;
        }

        protected void drdmonth_SelectedIndexChanged(object sender, EventArgs e)
        {
            Page.MaintainScrollPositionOnPostBack = true;
        }

        protected void drdhours_SelectedIndexChanged(object sender, EventArgs e)
        {
            Page.MaintainScrollPositionOnPostBack = true;
            lbltime.Text = drdtime.SelectedValue + " " + drdminutes.SelectedValue + " " + drdhours.SelectedValue;
        }

        protected void drdtime_SelectedIndexChanged(object sender, EventArgs e)
        {
            Page.MaintainScrollPositionOnPostBack = true;
        }

        protected void drdminutes_SelectedIndexChanged(object sender, EventArgs e)
        {
            Page.MaintainScrollPositionOnPostBack = true;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connectionString2 = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFileName=|DataDirectory|\\Database.mdf;Integrated Security=True;MultipleActiveResultSets=True";

            using (SqlConnection connection2 = new SqlConnection(connectionString2))
            {
                connection2.Open();

                SqlCommand check = new SqlCommand("SELECT Time, Date, DocName FROM DocAppointment WHERE   (Time = @timeval) AND (Date = @dateval) AND (DocName = @docval)", connection2);
                check.Connection = connection2;
                check.Parameters.AddWithValue("@timeval", lbltime.Text);
                check.Parameters.AddWithValue("@dateval", lbldate.Text);
                check.Parameters.AddWithValue("@docval", lbldoctor.Text);
                SqlDataReader reader = check.ExecuteReader();
                reader.Read();

                if (reader.HasRows)

                {
                    lblvalidate.Visible = true;
                    drddate.Items.Clear();
                    drddate.DataBind();
                    drdhours.Items.Clear();
                    drdhours.DataBind();
                    drdminutes.Items.Clear();
                    drdminutes.DataBind();
                    drdmonth.Items.Clear();
                    drdmonth.DataBind();
                    drdtime.Items.Clear();
                    drdtime.DataBind();

                    DivApp.Visible = true;

                }
                else
                {
                    {
                        string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFileName=|DataDirectory|\\Database.mdf;Integrated Security=True;MultipleActiveResultSets=True";

                        using (SqlConnection connection = new SqlConnection(connectionString))
                        {
                            SqlCommand cmd = new SqlCommand();


                            cmd.CommandText = "INSERT INTO DocAppointment(ID_KeyCare, Time, Date, [User], DateCaptured, DocName) VALUES(@id, @time, @date, @user, GETDATE(), @docname)";
                            cmd.Parameters.Add("@id", SqlDbType.Int).Value = lblid.Text;
                            cmd.Parameters.Add("@time", SqlDbType.NVarChar).Value = lbltime.Text;
                            cmd.Parameters.Add("@date", SqlDbType.Date).Value = lbldate.Text;
                            cmd.Parameters.Add("@user", SqlDbType.VarChar).Value = "'AdminUser'";
                            cmd.Parameters.Add("@docname", SqlDbType.VarChar).Value = lbldoctor.Text;
                            cmd.CommandType = CommandType.Text;
                            cmd.Connection = connection;

                            connection.Open();
                            cmd.ExecuteNonQuery();

                            {
                                MailMessage mail = new MailMessage();
                                SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");

                                mail.From = new MailAddress("onlinewebappointments@gmail.com");
                                mail.To.Add(txtmail.Text);
                                mail.Subject = "Confirmation of appointment";
                                mail.Body = "Kindly note that your appointment with " + lbldoctor.Text + " at " + lbltime.Text + " on the" + lbldate.Text + " has been sent through to the doctors rooms. Should you wish to cancel this appointment, please contact the rooms."; ;
                                SmtpServer.EnableSsl = true;
                                SmtpServer.Port = 587;
                                SmtpServer.Credentials = new System.Net.NetworkCredential("onlinewebappointments@gmail.com", "bj68ssgp");
                               

                                SmtpServer.Send(mail);
                                //MessageBox.Show("mail Send");
                                //  mm.Body = "Kindly note that your appointment with " + lbldoctor.Text + " at " + lbltime.Text + " on the" + lbldate.Text +" has been sent through to the doctors rooms. Should you wish to cancel this appointment, please contact the rooms.";



                            }

                        }
                        lblconfirm.Visible = true;
                        DivApp.Visible = false;
                        drddate.Items.Clear();
                        drddate.DataBind();
                        drdhours.Items.Clear();
                        drdhours.DataBind();
                        drdminutes.Items.Clear();
                        drdminutes.DataBind();
                        drdmonth.Items.Clear();
                        drdmonth.DataBind();
                        drdtime.Items.Clear();
                        drdtime.DataBind();
                        connection2.Close();
                        GridView1.Visible = false;
                        lbldoctor.Text = "";
                        lbldate.Text = "";
                        lbltime.Text = "";
                        txtmail.Text = "";

                        DivTable.Visible = false;
                    }
                }
            }
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
        }
    }
}


