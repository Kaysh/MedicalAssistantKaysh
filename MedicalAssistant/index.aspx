<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="MedicalAssistant.WebForm1" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 215px;
        }

        .auto-style2 {
            width: 359px;
        }

        .auto-style3 {
            width: 215px;
            height: 50px;
        }

        .auto-style4 {
            width: 359px;
            height: 50px;
        }

        .auto-style5 {
            height: 50px;
        }

        .auto-style6 {
            width: 157px;
        }
    </style>
    <script src="Scripts/jquery-2.2.4.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="#003366" Text="Search for Network GP"></asp:Label>
            <br />
            <br />
            <br />
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Search for Doctor</asp:LinkButton>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
        </div>
        <p></p>
        <table style="width: 100%; height: 153px;" id="tbl_">
            <tr>
                <td class="auto-style3">Name Of Medical Aid</td>
                <td class="auto-style4">
                    <asp:DropDownList ID="drdMedName" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="MedName_" DataTextField="MedName" DataValueField="MedName" Height="27px" OnSelectedIndexChanged="drdMedName_SelectedIndexChanged" Width="322px">
                        <asp:ListItem Selected="True">Select</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style5">
                    <asp:SqlDataSource ID="MedName_" runat="server" ConnectionString="<%$ ConnectionStrings:MedicalGPAssistConnectionString %>" SelectCommand="SELECT DISTINCT MedName FROM KeyCare$"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Type of Scheme</td>
                <td class="auto-style2">
                    <asp:DropDownList ID="MedScheme" runat="server" AutoPostBack="True" DataSourceID="Scheme_" DataTextField="Description" DataValueField="Description" Height="27px" OnSelectedIndexChanged="MedScheme_SelectedIndexChanged" Width="321px">
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:SqlDataSource ID="Scheme_" runat="server" ConnectionString="<%$ ConnectionStrings:MedicalGPAssistConnectionString %>" SelectCommand="SELECT distinct Description, MedName FROM KeyCare$ WHERE (MedName = @MedName)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="drdMedName" Name="MedName" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Suburb</td>
                <td class="auto-style4">
                    <asp:DropDownList ID="Suburb_" runat="server" AutoPostBack="True" DataSourceID="Surburb" DataTextField="Suburb" DataValueField="Suburb" Height="36px" OnSelectedIndexChanged="Suburb__SelectedIndexChanged" Width="325px">
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style5">
                    <asp:SqlDataSource ID="Surburb" runat="server" ConnectionString="<%$ ConnectionStrings:MedicalGPAssistConnectionString %>" SelectCommand="SELECT DISTINCT [Suburb] FROM [KeyCare$]"></asp:SqlDataSource>
                </td>
            </tr>
        </table>
        <p></p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="Sqlgrid" ForeColor="#333333" GridLines="None" Visible="False" Width="591px" DataKeyNames="id" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField SelectText="Book Appointment" ShowSelectButton="True" />
                <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
                <asp:BoundField DataField="Dr_Name" HeaderText="Dr_Name" SortExpression="Dr_Name" />
                <asp:BoundField DataField="Tel_No" HeaderText="Tel_No" SortExpression="Tel_No" />
                <asp:BoundField DataField="Physical_Address" HeaderText="Physical_Address" SortExpression="Physical_Address" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <EmptyDataTemplate>
                There are no doctors under this network.
            </EmptyDataTemplate>
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
        <asp:SqlDataSource ID="Sqlgrid" runat="server" ConnectionString="<%$ ConnectionStrings:MedicalGPAssistConnectionString %>" SelectCommand="SELECT DISTINCT [id], [Dr Name] AS Dr_Name, [Tel No] AS Tel_No, [Physical Address] AS Physical_Address FROM [KeyCare$] WHERE (([MedName] = @MedName) AND ([Description] = @Description) AND ([Suburb] = @Suburb))">
            <SelectParameters>
                <asp:ControlParameter ControlID="drdMedName" Name="MedName" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="MedScheme" Name="Description" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="Suburb_" Name="Suburb" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Label ID="Label2" runat="server" Visible="False"></asp:Label>
        <table style="width: 100%;">
            <tr>
                <td class="auto-style6">Date of Appointment</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" Height="16px" Width="204px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <br />
        <br />
        <iframe id="googleMapiFrame" width="600" height="450" frameborder="0" style="border: 0" src="" allowfullscreen></iframe>
    </form>
    <script>
        $(function () {

            var apiKey = "AIzaSyCpZIV0Kz0sKvRyBDigNVGR_4vmP177A2c";// "AIzaSyAg1OxEX_KREPBl0l9LhxtT867amfl3gFE";
            var destination = $('#Suburb_').val() + ",South+Africa;";//"Gateway,Durban,South+Africa";

            function runGoogleMaps() {

                if (navigator.geolocation) {

                    navigator.geolocation.getCurrentPosition(function showPosition(position) {

                        var origin = position.coords.latitude + ',' + position.coords.longitude;
                        $("#googleMapiFrame").attr("src", "https://www.google.com/maps/embed/v1/directions?key=" + apiKey + "&origin=" + origin + '&destination=' + destination);
                    }, function () {

                        $("#googleMapiFrame").attr("src", "https://www.google.com/maps/embed/v1/place?key=" + apiKey + "&q=" + destination + '');
                    });

                } else {

                    $("#googleMapiFrame").attr("src", "https://www.google.com/maps/embed/v1/place?key=" + apiKey + "&q=" + destination + '');
                }
            }

            runGoogleMaps();
            $('#Suburb_').change(runGoogleMaps);
        });
    </script>
</body>
</html>
