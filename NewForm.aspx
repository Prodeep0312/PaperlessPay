<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewForm.aspx.cs" Inherits="Project.NewForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <style type="text/css">
        .auto-style1 {
            width: 175px;
        }
        .auto-style2 {
            width: 611px;
        }
        .heading{
            font-size:xx-large;
            text-align:center;
            font-family:Georgia;
        }

        body{

             background-image:url('bgform.jpg');
        background-repeat:no-repeat;
        background-attachment:fixed;
         background-size:cover;
         opacity: 0.7;
         color:white;

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
        
    </style>
</head>
<body style="width: 864px">
    <form id="form1" runat="server">

        <table style="width: 100%; height: 233px;">
            <tr>
                <td class="auto-style1">
                    &nbsp;</td>
                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label1"  class="heading" runat="server" Text="Fee Slips"></asp:Label>
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
                    <asp:TextBox ID="TextBox5" runat="server" Width="604px" OnTextChanged="TextBox5_TextChanged"></asp:TextBox>
                </td>
                <td>
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
                <td class="auto-style2">
                    <asp:Button ID="Button1" runat="server" Text="Generate PDF" Width="124px" OnClick="Button1_Click" />
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

       </form>
    </body>
</html>













