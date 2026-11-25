<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PlacementDashboard.DefaultPage" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Student Placement Dashboard</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f3f6fb; color: #243047; margin: 0; }
        main { max-width: 1050px; margin: 35px auto; padding: 24px; }
        h1 { margin-bottom: 4px; color: #183b70; }
        .muted { color: #68758a; }
        .cards { display: flex; gap: 14px; margin: 22px 0; }
        .card, .panel { background: white; border: 1px solid #dce3ed; border-radius: 9px; padding: 18px; }
        .card { flex: 1; }
        .number { display: block; font-size: 27px; font-weight: bold; color: #2457a6; margin-top: 7px; }
        .layout { display: grid; grid-template-columns: 2fr 1fr; gap: 18px; }
        .filter { margin: 12px 0; }
        select { padding: 7px; margin-left: 8px; }
        .grid { width: 100%; border-collapse: collapse; }
        .grid th { background: #2457a6; color: white; text-align: left; }
        .grid th, .grid td { padding: 10px 8px; border: 1px solid #dce3ed; }
        .grid tr:nth-child(even) { background: #f6f8fc; }
        .select { color: #2457a6; }
        @media (max-width: 720px) { main { margin: 10px; padding: 12px; } .cards, .layout { display: block; } .card, .panel { margin-bottom: 12px; overflow-x: auto; } }
    </style>
</head>
<body>
<form id="form1" runat="server">
    <main>
        <h1>Student Placement Dashboard</h1>
        <div class="muted">View campus placement opportunities and eligibility details.</div>

        <section class="cards">
            <div class="card">Companies <asp:Label ID="CompanyCount" runat="server" CssClass="number" /></div>
            <div class="card">Open opportunities <asp:Label ID="OpenCount" runat="server" CssClass="number" /></div>
            <div class="card">Placed students <asp:Label ID="PlacedCount" runat="server" CssClass="number" /></div>
        </section>

        <section class="layout">
            <div class="panel">
                <h2>Placement opportunities</h2>
                <div class="filter">Filter by status:
                    <asp:DropDownList ID="StatusFilter" runat="server" AutoPostBack="true" OnSelectedIndexChanged="StatusFilter_Changed" />
                </div>
                <asp:GridView ID="PlacementGrid" runat="server" AutoGenerateColumns="false" DataKeyNames="Company"
                    CssClass="grid" OnSelectedIndexChanged="PlacementGrid_SelectedIndexChanged" EmptyDataText="No opportunities match this filter.">
                    <Columns>
                        <asp:BoundField DataField="Company" HeaderText="Company" />
                        <asp:BoundField DataField="Role" HeaderText="Role" />
                        <asp:BoundField DataField="Package" HeaderText="Package (LPA)" />
                        <asp:BoundField DataField="Status" HeaderText="Status" />
                        <asp:CommandField ShowSelectButton="true" SelectText="Details" ItemStyle-CssClass="select" />
                    </Columns>
                </asp:GridView>
            </div>
            <div class="panel">
                <h2>Selected opportunity</h2>
                <asp:DetailsView ID="PlacementDetails" runat="server" AutoGenerateRows="true" GridLines="None"
                    EmptyDataText="Select Details in the table to see more information." />
            </div>
        </section>
        <p class="muted">Sample data is stored in this page's Session and resets when the browser session ends.</p>
    </main>
</form>
</body>
</html>
