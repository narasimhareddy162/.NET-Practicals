using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pricatical5
{
    public partial class WebForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            Response.Redirect("WebForm1.aspx");
        }

        protected void Calendar2_SelectionChanged(object sender, EventArgs e)
        {
            DateTime selectDt = Calendar2.SelectedDate;
            Label1.Text = "Selected Date : "
                + selectDt.ToString("dd-MM-yyyy");
            Session["leavedate"] = selectDt;
        }
    }
}