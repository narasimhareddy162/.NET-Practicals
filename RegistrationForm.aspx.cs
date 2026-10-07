using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace EventRegistrationPortal
{
    public partial class RegistrationForm : System.Web.UI.Page
    {
        // Ticket prices in rupees
        private static readonly Dictionary<string, decimal> TicketPrices =
            new Dictionary<string, decimal>
            {
                { "Student", 250m },
                { "General", 500m },
                { "VIP", 1500m }
            };

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtName.Focus();
            }
        }

        // Server-side validation: at least one interest
        protected void cvInterests_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = cblInterests.Items.Cast<ListItem>().Any(i => i.Selected);
        }

        // Server-side validation: terms accepted
        protected void cvTerms_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = chkTerms.Checked;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Always re-check on the server, even if client-side passed
            if (!Page.IsValid)
            {
                return;
            }

            int tickets = int.Parse(txtTickets.Text.Trim());
            string ticketType = ddlTicket.SelectedValue;

            var interests = cblInterests.Items.Cast<ListItem>()
                                        .Where(i => i.Selected)
                                        .Select(i => i.Value);

            var reg = new Registration
            {
                RegistrationId = "EVT-" + DateTime.Now.ToString("yyyyMMddHHmmss"),
                FullName = txtName.Text.Trim(),
                Email = txtEmail.Text.Trim(),
                Phone = txtPhone.Text.Trim(),
                Age = int.Parse(txtAge.Text.Trim()),
                Gender = rblGender.SelectedValue,
                EventName = ddlEvent.SelectedValue,
                TicketType = ticketType,
                Tickets = tickets,
                Interests = string.Join(", ", interests),
                Address = string.IsNullOrWhiteSpace(txtAddress.Text) ? "Not provided" : txtAddress.Text.Trim(),
                TotalAmount = TicketPrices[ticketType] * tickets,
                RegisteredOn = DateTime.Now
            };

            Session["Registration"] = reg;
            Response.Redirect("Success.aspx");
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtName.Text = txtEmail.Text = txtPhone.Text = txtAge.Text = string.Empty;
            txtTickets.Text = txtPassword.Text = txtConfirm.Text = txtAddress.Text = string.Empty;
            rblGender.ClearSelection();
            cblInterests.ClearSelection();
            ddlEvent.SelectedIndex = 0;
            ddlTicket.SelectedIndex = 0;
            chkTerms.Checked = false;
            txtName.Focus();
        }
    }
}