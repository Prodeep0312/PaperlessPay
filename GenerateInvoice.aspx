
<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GenerateInvoice.aspx.cs" Inherits="Project.GenerateInvoice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
        <style >
            .auto-style1 {
                width: 175px;
            }
            .auto-style2 {
                width: 611px;
            }
            .heading{
                font-size: xx-large;
                text-align: center;
                font-family: Georgia;
            }

            body{
                /*background-image: url('~Img/bgform.jpg');*/
                /*background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: cover;
                opacity: 0.7;*/
                color: white;
            }

            table{
                border-spacing: 0 30px;
            }

            .auto-style3 {
                margin-top: 65px;
            }
            .auto-style4 {
                margin-top: 56;
            }
            .auto-style5 {
                margin-top: 52px;
                margin-bottom: 0px;
            }
            .btn{
                width:200px;
                padding:15px 0;
                text-align:center;
                margin:0px 10px 50px 10px;
                border-radius:25px;
                font-weight:bold;
                border:2px solid #009688;
                background:transparent;
                color:#fff;
                cursor:pointer;
                position:relative;
                overflow:hidden;


            }
           .main-content{
                width:100%;
                position:absolute;
                /*top:50%;*/
                transform:translateY(-50%);
                text-align:left;
                color:#fff;
            }
            .main-content h1{
                font-size:70px;
                margin-top:20px;
                /*margin-bottom:80px;*/
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

            .buttons-container {
                display: flex;
                justify-content: space-between;
                margin-bottom: 60px;
            }

            #contentContainer {
                margin-bottom: 100px;
            }
             table {
        border-collapse: collapse;
        width: 100%;
    }

    th, td {
        border: 1px solid white;
        padding: 8px;
        color: white;
    }
            
        </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewForm.aspx.cs" Inherits="Project.NewForm" %>--%>

   
       <div id="contentContainer">

            <table  class="row justify-content-center" style="width: 100%; height: 233px;">
            <tr>
                <td class="auto-style1">
                    &nbsp;
                </td>
                <td class="auto-style2">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <div class="main-content">
        <h1>Fee Slips </h1>
            </div>
                </td>
                <td>
                    <br />
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label2" runat="server" Text="Student Name :-"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="TextBox1" runat="server" Width="600px" CssClass="auto-style3" Height="33px" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                    <br />
                    <br />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">Address :-</td>
                <td class="auto-style2">
                    <asp:TextBox ID="TextBox2" runat="server" Height="140px" TextMode="MultiLine" Width="605px" CssClass="auto-style4" OnTextChanged="TextBox2_TextChanged"></asp:TextBox>
                    <br />
                    <br />
                    <br />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">Payment Type :-</td>
                <td class="auto-style2">
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="auto-style5" Height="30px" Width="610px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        <asp:ListItem Value="Select Type---">Select Type---</asp:ListItem>
                        <asp:ListItem>Cash</asp:ListItem>
                        <asp:ListItem>Cheque</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <br />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">Date:-</td>
                <td class="auto-style2">
                    <asp:TextBox ID="TextBox3" runat="server" TextMode="Date" Width="603px" OnTextChanged="TextBox3_TextChanged"></asp:TextBox>
                </td>
                <td>
                    <br />
                    <br />
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Course:-</td>
                <td class="auto-style2">
                    <asp:DropDownList ID="DropDownList2" runat="server" CssClass="auto-style5" Height="30px" Width="610px" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                        <asp:ListItem Value="Select Type---">Select Type---</asp:ListItem>
                        <asp:ListItem>DSA</asp:ListItem>
                        <asp:ListItem>C,C#,C++</asp:ListItem>
                        <asp:ListItem>MBA</asp:ListItem>
                        <asp:ListItem>Cricket</asp:ListItem>
                        <asp:ListItem>Fashion Design</asp:ListItem>
                        <asp:ListItem>Yoga</asp:ListItem>
                         <asp:ListItem>Teaching</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Fees :-</td>
                <td class="auto-style2">
                    <asp:TextBox ID="TextBox4" runat="server" Width="601px" OnTextChanged="TextBox4_TextChanged"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td >
                     <div class="buttons-container">
        <asp:Button ID="SaveButton" runat="server" Text="Save" OnClick="SaveButton_Click" class="btn" />
        <asp:Button ID="GeneratePDFButton" runat="server" Text="Generate PDF" OnClick="GeneratePDFButton_Click" class="btn" Enabled="false" />
    </div>
                </td>
                <td>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                </td>
            </tr>
        </table>

           
    
       </div>
    
       
    
</asp:Content>