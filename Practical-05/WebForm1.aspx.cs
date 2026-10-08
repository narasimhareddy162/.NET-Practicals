using System;

namespace pricatical5
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["leavedate"] != null)
            {
                DateTime leavedate = (DateTime) Session["leavedate"];
                Label1.Text = leavedate.ToString("dd-MM-yyyy");
            }
            else
            {
                Label1.Text = "Select a Date First";
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string ename = txtemp.Text;
            string leaveTp = DropDownList1.SelectedValue;
            string reason = txtReason.Text;

            // Store data in Session
            Session["empName"] = ename;
            Session["LeaveType"] = leaveTp;
            Session["Reason"] = reason;

            // Store employee name in Cookie
            if (checkBox.Checked)
            {
                Response.Cookies["empName"].Value = ename;
                Response.Cookies["empName"].Expires =
                    DateTime.Now.AddDays(7);
            }
            DateTime leavedate = (DateTime)Session["leavedate"];
            String leaveD = leavedate.ToString("dd-MM-yyyy");

            // Display message
            lblMsg.Text = "<b>Leave Application Submitted Successfully.</b>"
                        + "<br/>Employee Name: " + ename
                        + "<br/>Leave Type: " + leaveTp
                        + "<br/>Leave Date:" + leaveD
                        + "<br/>Reason: " + reason;
        }
    }
}