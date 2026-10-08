<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrationForm.aspx.cs" Inherits="EventRegistrationPortal.RegistrationForm" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Online Event Registration Portal</title>
    <link href="Content/Style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        // Client-side check for the Terms checkbox
        function validateTerms(sender, args) {
            var chk = document.getElementById('<%= chkTerms.ClientID %>');
            args.IsValid = chk.checked;
        }
        // Client-side check: at least one interest selected
        function validateInterests(sender, args) {
            var list = document.getElementById('<%= cblInterests.ClientID %>');
            var boxes = list.getElementsByTagName('input');
            args.IsValid = false;
            for (var i = 0; i < boxes.length; i++) {
                if (boxes[i].checked) { args.IsValid = true; break; }
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Online Event Registration</h1>
            <div class="subtitle">Fill in the details below to reserve your seat</div>

            <asp:ValidationSummary ID="vsSummary" runat="server" CssClass="summary"
                HeaderText="Please correct the following errors:" DisplayMode="BulletList" />

            <table class="form">
                <tr>
                    <td class="label">Full Name *</td>
                    <td>
                        <asp:TextBox ID="txtName" runat="server" CssClass="input" MaxLength="50" />
                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName"
                            ErrorMessage="Full name is required." Text="Required" CssClass="error" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="revName" runat="server" ControlToValidate="txtName"
                            ValidationExpression="^[A-Za-z ]{3,50}$"
                            ErrorMessage="Name must be 3-50 letters (alphabets and spaces only)."
                            Text="Only letters, min 3" CssClass="error" Display="Dynamic" />
                    </td>
                </tr>
                <tr>
                    <td class="label">Email *</td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="input" TextMode="Email" />
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
                            ErrorMessage="Email is required." Text="Required" CssClass="error" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                            ValidationExpression="^[\w\.\-]+@([\w\-]+\.)+[A-Za-z]{2,4}$"
                            ErrorMessage="Enter a valid email address." Text="Invalid email" CssClass="error" Display="Dynamic" />
                    </td>
                </tr>
                <tr>
                    <td class="label">Mobile Number *</td>
                    <td>
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="input" MaxLength="10" />
                        <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhone"
                            ErrorMessage="Mobile number is required." Text="Required" CssClass="error" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="txtPhone"
                            ValidationExpression="^[6-9]\d{9}$"
                            ErrorMessage="Mobile must be 10 digits and start with 6-9."
                            Text="Invalid mobile" CssClass="error" Display="Dynamic" />
                    </td>
                </tr>
                <tr>
                    <td class="label">Age *</td>
                    <td>
                        <asp:TextBox ID="txtAge" runat="server" CssClass="input" MaxLength="3" />
                        <asp:RequiredFieldValidator ID="rfvAge" runat="server" ControlToValidate="txtAge"
                            ErrorMessage="Age is required." Text="Required" CssClass="error" Display="Dynamic" />
                        <asp:RangeValidator ID="rvAge" runat="server" ControlToValidate="txtAge"
                            MinimumValue="16" MaximumValue="60" Type="Integer"
                            ErrorMessage="Age must be between 16 and 60." Text="Age 16-60 only"
                            CssClass="error" Display="Dynamic" />
                    </td>
                </tr>
                <tr>
                    <td class="label">Gender *</td>
                    <td>
                        <asp:RadioButtonList ID="rblGender" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Text="Male" Value="Male" />
                            <asp:ListItem Text="Female" Value="Female" />
                            <asp:ListItem Text="Other" Value="Other" />
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="rfvGender" runat="server" ControlToValidate="rblGender"
                            ErrorMessage="Please select your gender." Text="Select gender" CssClass="error" Display="Dynamic" />
                    </td>
                </tr>
                <tr>
                    <td class="label">Select Event *</td>
                    <td>
                        <asp:DropDownList ID="ddlEvent" runat="server" CssClass="input">
                            <asp:ListItem Text="-- Select Event --" Value="0" />
                            <asp:ListItem Text="Tech Summit 2026" Value="Tech Summit 2026" />
                            <asp:ListItem Text="Cultural Fest" Value="Cultural Fest" />
                            <asp:ListItem Text="Startup Pitch Day" Value="Startup Pitch Day" />
                            <asp:ListItem Text="Music Night" Value="Music Night" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvEvent" runat="server" ControlToValidate="ddlEvent"
                            InitialValue="0" ErrorMessage="Please select an event." Text="Select an event"
                            CssClass="error" Display="Dynamic" />
                    </td>
                </tr>
                <tr>
                    <td class="label">Ticket Type *</td>
                    <td>
                        <asp:DropDownList ID="ddlTicket" runat="server" CssClass="input">
                            <asp:ListItem Text="-- Select Ticket --" Value="0" />
                            <asp:ListItem Text="Student (Rs. 250)" Value="Student" />
                            <asp:ListItem Text="General (Rs. 500)" Value="General" />
                            <asp:ListItem Text="VIP (Rs. 1500)" Value="VIP" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvTicket" runat="server" ControlToValidate="ddlTicket"
                            InitialValue="0" ErrorMessage="Please select a ticket type." Text="Select a ticket"
                            CssClass="error" Display="Dynamic" />
                    </td>
                </tr>
                <tr>
                    <td class="label">No. of Tickets *</td>
                    <td>
                        <asp:TextBox ID="txtTickets" runat="server" CssClass="input" MaxLength="2" />
                        <asp:RequiredFieldValidator ID="rfvTickets" runat="server" ControlToValidate="txtTickets"
                            ErrorMessage="Number of tickets is required." Text="Required" CssClass="error" Display="Dynamic" />
                        <asp:RangeValidator ID="rvTickets" runat="server" ControlToValidate="txtTickets"
                            MinimumValue="1" MaximumValue="10" Type="Integer"
                            ErrorMessage="You can book 1 to 10 tickets." Text="Allowed 1-10"
                            CssClass="error" Display="Dynamic" />
                    </td>
                </tr>
                <tr>
                    <td class="label">Interests *</td>
                    <td>
                        <asp:CheckBoxList ID="cblInterests" runat="server" RepeatColumns="2">
                            <asp:ListItem Text="Networking" Value="Networking" />
                            <asp:ListItem Text="Workshops" Value="Workshops" />
                            <asp:ListItem Text="Competitions" Value="Competitions" />
                            <asp:ListItem Text="Food Stalls" Value="Food Stalls" />
                        </asp:CheckBoxList>
                        <asp:CustomValidator ID="cvInterests" runat="server"
                            ClientValidationFunction="validateInterests"
                            OnServerValidate="cvInterests_ServerValidate"
                            ErrorMessage="Select at least one interest." Text="Select at least one"
                            CssClass="error" Display="Dynamic" />
                    </td>
                </tr>
                <tr>
                    <td class="label">Password *</td>
                    <td>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="input" TextMode="Password" />
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword"
                            ErrorMessage="Password is required." Text="Required" CssClass="error" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="revPassword" runat="server" ControlToValidate="txtPassword"
                            ValidationExpression="^(?=.*[A-Za-z])(?=.*\d).{6,15}$"
                            ErrorMessage="Password must be 6-15 characters with letters and digits."
                            Text="6-15 chars, letters + digits" CssClass="error" Display="Dynamic" />
                    </td>
                </tr>
                <tr>
                    <td class="label">Confirm Password *</td>
                    <td>
                        <asp:TextBox ID="txtConfirm" runat="server" CssClass="input" TextMode="Password" />
                        <asp:RequiredFieldValidator ID="rfvConfirm" runat="server" ControlToValidate="txtConfirm"
                            ErrorMessage="Please confirm your password." Text="Required" CssClass="error" Display="Dynamic" />
                        <asp:CompareValidator ID="cmpPassword" runat="server" ControlToValidate="txtConfirm"
                            ControlToCompare="txtPassword" Operator="Equal" Type="String"
                            ErrorMessage="Password and Confirm Password do not match."
                            Text="Passwords do not match" CssClass="error" Display="Dynamic" />
                    </td>
                </tr>
                <tr>
                    <td class="label">Address</td>
                    <td>
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="input" TextMode="MultiLine" Rows="3" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:CheckBox ID="chkTerms" runat="server" Text=" I agree to the Terms &amp; Conditions" />
                        <asp:CustomValidator ID="cvTerms" runat="server"
                            ClientValidationFunction="validateTerms"
                            OnServerValidate="cvTerms_ServerValidate"
                            ErrorMessage="You must accept the Terms &amp; Conditions."
                            Text="Accept terms to continue" CssClass="error" Display="Dynamic" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="padding-top:15px;">
                        <asp:Button ID="btnSubmit" runat="server" Text="Register" CssClass="btn btn-primary"
                            OnClick="btnSubmit_Click" />
                        <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btn btn-secondary"
                            CausesValidation="false" OnClick="btnReset_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>