using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



namespace MedicalAssistant
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //drdMedName.Items.Insert(0, "Select");
            
            //drdMedName.DataBind();
        }

        protected void drdMedName_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.Visible = true;
            GridView1.DataBind();
        }

        protected void MedScheme_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        protected void Suburb__SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.DataBind();
            GridViewRow row = GridView1.SelectedRow;
            Label2.Text = row.Cells[1].Text;
            GridView1.Visible = false;
        }
    }
}