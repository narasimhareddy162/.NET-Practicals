<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="pricatical5.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Leave Application <br /><be />
            Employee Name :
            <asp:TextBox ID="txtemp" runat="server"></asp:TextBox>
            <br /><br />

            Leave Date :
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                
            <br /><br />

            Leave Type :
            <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem>Select Leave Type</asp:ListItem>
                    <asp:ListItem>personal Leave</asp:ListItem>
                    <asp:ListItem>Medical Leave</asp:ListItem>
            </asp:DropDownList>
            <br /><br />

            Reason :
            <asp:TextBox ID="txtReason" runat="server"
                Textmode="MultiLine" Rows="4" Columns="20">
            </asp:TextBox>
            <br /><br />

            Rememberme :
            
                <asp:CheckBox ID="checkBox" runat="server"
                    Text="Remember my Name"></asp:CheckBox>
            <br /><br />

            <asp:Button ID="btnSubmit" runat="server" Text="Submit Leave" OnClick="btnSubmit_Click" />
            <asp:Label runat="server" ID="lblMsg" ForeColor="#6600CC"></asp:Label>
        </div>
    </form>
</body>
</html>
