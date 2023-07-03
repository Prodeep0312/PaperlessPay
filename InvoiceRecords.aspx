<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InvoiceRecords.aspx.cs" Inherits="Project.InvoiceRecord" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .grid-container {
            display: grid;
            grid-template-columns: auto auto;
            grid-gap: 10px;
            padding: 10px;
            overflow-x: hidden;
        }

        .no-records-label {
            font-weight: bold;
            color: red;
        }

        .main-content {
            width: 100%;
            position: absolute;
            transform: translateY(-50%);
            text-align: center;
            color: #fff;
        }

        .main-content h1 {
            font-size: 70px;
            margin-top: 80px;
        }

        .main-content * {
                opacity: 0;
                animation: fade-in 5s forwards;
            }

            @keyframes fade-in {
                0% {
                    opacity: 0;
                }
                100% {
                    opacity: 1;
                }
            }

        .grid-container {
            width: 100%;
            position: absolute;
            transform: translateY(-50%);
            text-align: center;
            color: #fff;
            margin-top: 80px;
            overflow-x: hidden;
        }

        .btn {
            width: 200px;
            padding: 15px 0;
            text-align: center;
            margin: 20px 10px;
            border-radius: 25px;
            font-weight: bold;
            border: 2px solid #009688;
            background: transparent;
            color: #fff;
            cursor: pointer;
            position: relative;
            overflow: hidden;
        }

        .btn1{
            width: 200px;
            padding: 15px 0;
            text-align: center;
            margin: 20px 10px;
            border-radius: 25px;
            font-weight: bold;
            border: 2px solid #009688;
            background: transparent;
            color: #fff;
            cursor: pointer;
            position: relative;
            overflow: hidden;
        }

        .btndownload {
            width: 200px;
            padding: 3px 0;
            text-align: center;
            margin: 20px 10px;
            border-radius: 25px;
            font-weight: bold;
            border: 2px solid #009688;
            background: transparent;
            color: #fff;
            cursor: pointer;
            position: relative;
            overflow: hidden;
        }

        .btn span {
            background: #009688;
            height: 100%;
            width: 0;
            border-radius: 25px;
            position: absolute;
            left: 0;
            bottom: 0;
            z-index: -1;
            transition: 0.5s;
        }

        .Gv {
            margin-top: 80px;
            color: #fff;
            margin-bottom: 20px; /* Add margin or space at the bottom */
        }

        .container {
           /* display: flex;
            justify-content: flex-end;
            align-items: center;*/

            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 20px;
        }

        .btncontainer {
    margin-top: 10px;
}

        .date-input {
            background: transparent;
        }

        .gridview {
            font-family: Arial;
            background-color: #FFFFFF;
            border: solid 1px #CCCCCC;
        }

        .Gv td {
            padding: 15px 20px 15px 20px;
        }

        .Gv th {
            padding: 5px 50px 5px 5px;
            text-align: left;
        }

        .Gv th a {
            color: #003300;
            text-decoration: none;
        }

        .Gv th a:hover {
            color: #003300;
            text-decoration: underline;
        }

        .Gv td a {
            color: #003300;
            text-decoration: none;
        }

        .Gv td a:hover {
            color: red;
            text-decoration: underline;
        }

        .gridViewHeader {
            background-color: #0066CC;
            color: #FFFFFF;
            text-align: left;
        }

        .gridViewRow {
            background-color: #99CCFF;
            color: #000000;
        }

        .gridtable {
            margin: 0px 10px 20px 10px; /* Adjust the margin as needed */
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lblNoRecords" runat="server" Text="No records found." Visible="false"></asp:Label>
    <div class="main-content">
        <h1>Invoice Records</h1>
    </div>
    <br /><br /><br /><br /><br /><br />

    <div class="grid-container">
    <div>
        <label for="startDate">Start Date:</label>
        <asp:TextBox ID="startDate" runat="server" TextMode="Date" CssClass="date-input btn"></asp:TextBox>
    </div>

    <div>
        <label for="endDate">End Date:</label>
        <asp:TextBox ID="endDate" runat="server" TextMode="Date" CssClass="date-input btn"></asp:TextBox>
    </div>
       </div>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />


    <div class="container">
        <asp:Button ID="btnSearch" runat="server" Text="SEARCH" CssClass="btn1" class="btncontainer" OnClick="btnSearch_Click"></asp:Button>
    
</div>
   
    <div class="gridtable">
        <asp:GridView ID="gridView" runat="server" AutoGenerateColumns="False" OnRowDataBound="gridView_RowDataBound" OnPageIndexChanging="gridView_PageIndexChanging" DataKeyNames="PDFName" class="Gv" AllowPaging="true" PageSize="3">


            <Columns>
                <asp:BoundField DataField="Sno" HeaderText="Invoice No" />
                <asp:BoundField DataField="Username" HeaderText="Username" />
                <asp:BoundField DataField="StudentName" HeaderText="Student Name" />
                <asp:BoundField DataField="Address" HeaderText="Address" />
                <asp:BoundField DataField="PaymentType" HeaderText="Payment Type" />
                <asp:BoundField DataField="Date" HeaderText="Date" DataFormatString="{0:dd/MM/yyyy}" />
                <asp:BoundField DataField="Course" HeaderText="Course" />
                <asp:BoundField DataField="Fees" HeaderText="Fees" DataFormatString="{0:C}" />

                <asp:TemplateField HeaderText="PDF Name">
                    <ItemTemplate>
                        <%# Eval("PDFName", "{0:ddMMyyyyhhmm}").ToString() %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Download">
                    <ItemTemplate>
                        <asp:Button ID="btnDownload" runat="server" CssClass="btndownload" Text="Download PDF" OnClick="btnDownload_Click"
                            CommandArgument='<%# Eval("Sno") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>

            <PagerSettings Position="Bottom" /> 
            <PagerStyle HorizontalAlign="Center" /> 
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" /> 
        </asp:GridView>
    </div>
</asp:Content>
