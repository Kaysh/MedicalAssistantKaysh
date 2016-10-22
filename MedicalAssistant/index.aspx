<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="MedicalAssistant.WebForm1" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        
        .auto-style3 {
            width: 278px;
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
        .auto-style7 {
            width: 157px;
            height: 30px;
        }
        .auto-style8 {
            height: 30px;
        }
        .auto-style9 {
            height: 30px;
            width: 307px;
        }
        .auto-style10 {
            width: 307px;
        }
        .auto-style11 {
            height: 37px;
        }
        .auto-style12 {
            width: 157px;
            height: 56px;
        }
        .auto-style13 {
            width: 307px;
            height: 56px;
        }
        .auto-style14 {
            height: 56px;
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
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Search Medical Aid</asp:LinkButton>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">Search Location</asp:LinkButton>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click" PostBackUrl="~/stats.aspx">View Stats</asp:LinkButton>
            <br />
            &nbsp;&nbsp;&nbsp;
    
        </div>
        <div id ="DivTable" runat="server">
            <table style="width:100%;">
                <tr>
                    <td class="auto-style11">Name Of Medical Aid</td>
                    <td class="auto-style11">
                    <asp:DropDownList ID="drdMedName" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="MedName_" DataTextField="MedName" DataValueField="MedName" Height="27px" OnSelectedIndexChanged="drdMedName_SelectedIndexChanged" Width="322px">
                        <asp:ListItem Selected="True">Select</asp:ListItem>
                    </asp:DropDownList>
                    </td>
                    <td class="auto-style11">
                    <asp:SqlDataSource ID="MedName_" runat="server" ConnectionString="<%$ ConnectionStrings:MedicalGPAssistConnectionString %>" SelectCommand="SELECT DISTINCT MedName FROM KeyCare$"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style11">Type of Scheme</td>
                    <td class="auto-style11">
                    <asp:DropDownList ID="MedScheme" runat="server" AutoPostBack="True" DataSourceID="Scheme_" DataTextField="Description" DataValueField="Description" Height="27px" OnSelectedIndexChanged="MedScheme_SelectedIndexChanged" Width="321px" style="margin-left: 0px">
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                    </td>
                    <td class="auto-style11">
                    <asp:SqlDataSource ID="Scheme_" runat="server" ConnectionString="<%$ ConnectionStrings:MedicalGPAssistConnectionString %>" SelectCommand="SELECT distinct Description, MedName FROM KeyCare$ WHERE (MedName = @MedName)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="drdMedName" Name="MedName" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
        <div id ="DivSuburb" runat ="server">
        <table style="width: 100%; height: 37px;" id="tbl_">
            <tr>
                <td class="auto-style3">Name Of Medical Aid</td>
                <td class="auto-style4">
                    <asp:DropDownList ID="drdmednamesub" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="MedName_0" DataTextField="MedName" DataValueField="MedName" Height="34px" Width="326px">
                        <asp:ListItem>Select</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style5">
                    <asp:SqlDataSource ID="MedName_0" runat="server" ConnectionString="<%$ ConnectionStrings:MedicalGPAssistConnectionString %>" SelectCommand="SELECT DISTINCT MedName FROM KeyCare$"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Type of Scheme</td>
                <td class="auto-style4">
                    <asp:DropDownList ID="drdtypesub" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="Scheme_0" DataTextField="Description" DataValueField="Description" Height="34px" Width="326px">
                        <asp:ListItem>Select</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style5">
                    <asp:SqlDataSource ID="Scheme_0" runat="server" ConnectionString="<%$ ConnectionStrings:MedicalGPAssistConnectionString %>" SelectCommand="SELECT distinct Description, MedName FROM KeyCare$ WHERE (MedName = @MedName)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="drdmednamesub" Name="MedName" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSourcestats" runat="server" ConnectionString="<%$ ConnectionStrings:MedicalGPAssistConnectionString %>" InsertCommand="INSERT INTO AuditTrial(searchtype, DateCaptured) VALUES (N'Searched by Suburb', GETDATE())" ProviderName="<%$ ConnectionStrings:MedicalGPAssistConnectionString.ProviderName %>"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Suburb</td>
                <td class="auto-style4">
                    <asp:DropDownList ID="Suburb_" runat="server" AutoPostBack="True" DataSourceID="Surburb" DataTextField="Suburb" DataValueField="Suburb" Height="36px" OnSelectedIndexChanged="Suburb__SelectedIndexChanged" Width="325px" AppendDataBoundItems="True" style="margin-left: 0px">
                        <asp:ListItem>Select</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style5">
                    <asp:SqlDataSource ID="Surburb" runat="server" ConnectionString="<%$ ConnectionStrings:MedicalGPAssistConnectionString %>" SelectCommand="SELECT DISTINCT Suburb, Description, MedName FROM KeyCare$ WHERE (Description = @desc ) AND (MedName = @medname)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="drdtypesub" Name="desc" PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="drdmednamesub" Name="medname" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
            </div>
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
        <asp:SqlDataSource ID="Sqlgrid" runat="server" ConnectionString="<%$ ConnectionStrings:MedicalGPAssistConnectionString %>" SelectCommand="SELECT DISTINCT [id], [Dr Name] AS Dr_Name, [Tel No] AS Tel_No, [Physical Address] AS Physical_Address FROM [KeyCare$] WHERE (([Description] = @Description) )" InsertCommand="INSERT INTO DocAppointment(ID_KeyCare, Time, Date, [User], DateCaptured) VALUES (@id, @time, @date, N'AdminUser', GETDATE())">
            <InsertParameters>
                <asp:ControlParameter ControlID="lblid" Name="id" PropertyName="Text" />
                <asp:ControlParameter ControlID="lbltime" Name="time" PropertyName="Text" />
                <asp:ControlParameter ControlID="lbldate" Name="date" PropertyName="Text" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="drdMedName" Name="MedName" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="MedScheme" Name="Description" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Label ID="lblid" runat="server" Visible="False"></asp:Label>
        <div id = "DivApp" runat = "server">
        <table id ="tbl_2" style="width: 100%; margin-bottom: 0px;">
            <tr>
                <td class="auto-style7">Doctor Name</td>
                <td class="auto-style9">
                    <asp:Label ID="lbldoctor" runat="server"></asp:Label>
                </td>
                <td class="auto-style8">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">Date of Appointment</td>
                <td class="auto-style9">
                    DD<asp:DropDownList ID="drddate" runat="server" Height="17px" Width="42px" AutoPostBack="True" OnSelectedIndexChanged="drddate_SelectedIndexChanged">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem>9</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                        <asp:ListItem>13</asp:ListItem>
                        <asp:ListItem>14</asp:ListItem>
                        <asp:ListItem>15</asp:ListItem>
                        <asp:ListItem>16</asp:ListItem>
                        <asp:ListItem>17</asp:ListItem>
                        <asp:ListItem>18</asp:ListItem>
                        <asp:ListItem>19</asp:ListItem>
                        <asp:ListItem>20</asp:ListItem>
                        <asp:ListItem>21</asp:ListItem>
                        <asp:ListItem>22</asp:ListItem>
                        <asp:ListItem>23</asp:ListItem>
                        <asp:ListItem>24</asp:ListItem>
                        <asp:ListItem>25</asp:ListItem>
                        <asp:ListItem>26</asp:ListItem>
                        <asp:ListItem>27</asp:ListItem>
                        <asp:ListItem>28</asp:ListItem>
                        <asp:ListItem>29</asp:ListItem>
                        <asp:ListItem>30</asp:ListItem>
                        <asp:ListItem>31</asp:ListItem>
                    </asp:DropDownList>
&nbsp;&nbsp;&nbsp;MM
                    <asp:DropDownList ID="drdmonth" runat="server" Height="16px" Width="47px" AutoPostBack="True" OnSelectedIndexChanged="drdmonth_SelectedIndexChanged">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem>9</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                    </asp:DropDownList>
&nbsp;&nbsp;YYYY
                    <asp:DropDownList ID="drdyear" runat="server" OnSelectedIndexChanged="drdyear_SelectedIndexChanged" AutoPostBack="True" Height="17px" Width="57px">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>2016</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style8">
                    <asp:Label ID="lbldate" runat="server"></asp:Label>
                    <asp:SqlDataSource ID="insert" runat="server" ConnectionString="<%$ ConnectionStrings:MedicalGPAssistConnectionString %>" InsertCommand="INSERT INTO DocAppointment(ID_KeyCare, Time, Date, [User], DateCaptured, DocName) VALUES (@id, @time, @date, N'AdminUser', GETDATE(), @docname)" ProviderName="<%$ ConnectionStrings:MedicalGPAssistConnectionString.ProviderName %>">
                        <InsertParameters>
                            <asp:ControlParameter ControlID="lblid" Name="id" PropertyName="Text" />
                            <asp:ControlParameter ControlID="lbltime" Name="time" PropertyName="Text" />
                            <asp:ControlParameter ControlID="lbldate" Name="date" PropertyName="Text" />
                            <asp:ControlParameter ControlID="lbldoctor" Name="docname" PropertyName="Text" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style12">Time</td>
                <td class="auto-style13">
                    HH<asp:DropDownList ID="drdtime" runat="server" Height="17px" Width="43px" AutoPostBack="True" OnSelectedIndexChanged="drdtime_SelectedIndexChanged">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem>9</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                    </asp:DropDownList>
&nbsp;&nbsp;&nbsp;MM
                    <asp:DropDownList ID="drdminutes" runat="server" Height="16px" Width="44px" AutoPostBack="True" OnSelectedIndexChanged="drdminutes_SelectedIndexChanged">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>00</asp:ListItem>
                        <asp:ListItem>30</asp:ListItem>
                    </asp:DropDownList>
&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="drdhours" runat="server" Height="16px" Width="53px" AutoPostBack="True" OnSelectedIndexChanged="drdhours_SelectedIndexChanged">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>AM</asp:ListItem>
                        <asp:ListItem>PM</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style14">
                    <asp:Label ID="lbltime" runat="server"></asp:Label>
                    <asp:SqlDataSource ID="checkapp" runat="server" ConnectionString="<%$ ConnectionStrings:MedicalGPAssistConnectionString %>" ProviderName="<%$ ConnectionStrings:MedicalGPAssistConnectionString.ProviderName %>" SelectCommand="SELECT Time, Date, DocName FROM DocAppointment WHERE (Time = @timeval) AND (Date = @dateval) AND (DocName = @docval)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="lbltime" Name="timeval" PropertyName="Text" />
                            <asp:ControlParameter ControlID="lbldate" Name="dateval" PropertyName="Text" />
                            <asp:ControlParameter ControlID="lbldoctor" Name="docval" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">Email</td>
                <td class="auto-style10">
                    <asp:TextBox ID="txtmail" runat="server" Height="19px" Width="244px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style10">
                    <asp:Button ID="Button1" runat="server" Height="30px" OnClick="Button1_Click" Text="Submit" Width="82px" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
            </div>
                    <asp:Label ID="lblvalidate" runat="server" Font-Italic="True" Text="Time slot not available. please select another time." Visible="False"></asp:Label>
        <br />
                    <asp:Label ID="lblconfirm" runat="server" Font-Italic="True" Text="Your appointment has been booked. Kindly await confirmation." Visible="False"></asp:Label>
        <br />
        <br />
        <div id ="DivGoogle" runat="server"> 
        <iframe id="googleMapiFrame" width="600" height="450" frameborder="0" style="border: 0" src="" allowfullscreen></iframe>
            </div> 
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
