<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="stats.aspx.cs" Inherits="MedicalAssistant.stats" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSourceview" ForeColor="#333333" GridLines="None" Height="250px" Width="529px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="SearchType" HeaderText="Type of Activity" SortExpression="SearchType" />
                <asp:BoundField DataField="Total" HeaderText="Activity Count" ReadOnly="True" SortExpression="Total" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceview" runat="server" ConnectionString="<%$ ConnectionStrings:MedicalGPAssistConnectionString %>" SelectCommand="SELECT SearchType, count (searchtype) Total  FROM [AuditTrial]
group by searchtype"></asp:SqlDataSource>
    </form>
</body>
</html>
