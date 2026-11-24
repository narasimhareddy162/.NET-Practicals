<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs"
    Inherits="Practical9.Default" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Placement Dashboard</title>

    <style>
        body {
            font-family: Arial;
            margin: 30px;
            background-color: #f5f5f5;
        }

        h1 {
            text-align: center;
        }

        .cards {
            display: flex;
            gap: 20px;
            justify-content: center;
            margin: 30px 0;
        }

        .card {
            background-color: white;
            padding: 20px;
            width: 180px;
            text-align: center;
            border-radius: 8px;
            box-shadow: 0 2px 8px #ccc;
        }

        .number {
            font-size: 28px;
            font-weight: bold;
        }

        .table {
            width: 100%;
            background-color: white;
        }
    </style>
</head>

<body>

<form id="form1" runat="server">

    <h1>Placement Dashboard</h1>

    <div class="cards">

        <div class="card">
            <h3>Total Students</h3>
            <asp:Label ID="lblTotal"
                runat="server"
                CssClass="number">
            </asp:Label>
        </div>

        <div class="card">
            <h3>Placed Students</h3>
            <asp:Label ID="lblPlaced"
                runat="server"
                CssClass="number">
            </asp:Label>
        </div>

        <div class="card">
            <h3>Unplaced Students</h3>
            <asp:Label ID="lblUnplaced"
                runat="server"
                CssClass="number">
            </asp:Label>
        </div>

        <div class="card">
            <h3>Highest Package</h3>
            <asp:Label ID="lblHighestPackage"
                runat="server"
                CssClass="number">
            </asp:Label>
            LPA
        </div>

        <div class="card">
            <h3>Placement %</h3>
            <asp:Label ID="lblPercentage"
                runat="server"
                CssClass="number">
            </asp:Label>
        </div>

    </div>

    <h2>Student Placement Details</h2>

    <asp:GridView
        ID="gvPlacements"
        runat="server"
        AutoGenerateColumns="true"
        CssClass="table"
        BorderWidth="1"
        CellPadding="8">
    </asp:GridView>

</form>

</body>
</html>