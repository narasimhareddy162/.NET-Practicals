using System;

namespace EventRegistrationPortal
{
    public partial class Success : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var reg = Session["Registration"] as Registration;

            // If someone opens this page directly, send them to the form
            if (reg == null)
            {
                Response.Redirect("RegistrationForm.aspx");
                return;
            }

            lblId.Text = reg.RegistrationId;
            lblName.Text = Server.HtmlEncode(reg.FullName);
            lblEmail.Text = Server.HtmlEncode(reg.Email);
            lblPhone.Text = reg.Phone;
            lblAgeGender.Text = reg.Age + " / " + reg.Gender;
            lblEvent.Text = reg.EventName;
            lblTicket.Text = reg.TicketType;
            lblQty.Text = reg.Tickets.ToString();
            lblInterests.Text = reg.Interests;
            lblAddress.Text = Server.HtmlEncode(reg.Address);
            lblTotal.Text = "Rs. " + reg.TotalAmount.ToString("N2");
            lblDate.Text = reg.RegisteredOn.ToString("dd MMM yyyy, hh:mm tt");
        }
    }
}