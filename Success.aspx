<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Success.aspx.cs" Inherits="EventRegistrationPortal.Success" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Successful</title>
    <link href="Content/Style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1 class="success-title">Registration Successful!</h1>
            <div class="subtitle">Thank you for registering. Your details are below.</div>

            <table class="result">
                <tr><td class="key">Registration ID</td><td><asp:Label ID="lblId" runat="server" /></td></tr>
                <tr><td class="key">Full Name</td><td><asp:Label ID="lblName" runat="server" /></td></tr>
                <tr><td class="key">Email</td><td><asp:Label ID="lblEmail" runat="server" /></td></tr>
                <tr><td class="key">Mobile</td><td><asp:Label ID="lblPhone" runat="server" /></td></tr>
                <tr><td class="key">Age / Gender</td><td><asp:Label ID="lblAgeGender" runat="server" /></td></tr>
                <tr><td class="key">Event</td><td><asp:Label ID="lblEvent" runat="server" /></td></tr>
                <tr><td class="key">Ticket Type</td><td><asp:Label ID="lblTicket" runat="server" /></td></tr>
                <tr><td class="key">No. of Tickets</td><td><asp:Label ID="lblQty" runat="server" /></td></tr>
                <tr><td class="key">Interests</td><td><asp:Label ID="lblInterests" runat="server" /></td></tr>
                <tr><td class="key">Address</td><td><asp:Label ID="lblAddress" runat="server" /></td></tr>
                <tr><td class="key">Total Amount</td><td><b><asp:Label ID="lblTotal" runat="server" /></b></td></tr>
                <tr><td class="key">Registered On</td><td><asp:Label ID="lblDate" runat="server" /></td></tr>
            </table>

            <br />
            <asp:HyperLink ID="lnkBack" runat="server" NavigateUrl="~/RegistrationForm.aspx">&laquo; Register another person</asp:HyperLink>
        </div>
    </form>
</body>
</html>