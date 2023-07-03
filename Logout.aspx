<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="Project.Logout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            background-color: #f9f9f9;
            font-family: Arial, sans-serif;
            text-align: center;
        }

        .logout-container {
            margin-top: 100px;
        }

        h1 {
            font-size: 28px;
            color: #fff;
        }

        .logout-btn {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            color: #fff;
            background-color: #333;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .logout-btn:hover {
            background-color: #666;
        }
        .confirmation-dialog {
        color: white;
    }
    </style>
    <script type="text/javascript">
        function confirmLogout() {
            var logout = confirm("Are you sure you want to logout?");
          
            if (logout) {
                // Redirect to the login page
                window.location.href = "LoginForm.aspx";
            } else {
                // Redirect back to the previous page
                window.location.href = "Home.aspx";
            }
            document.querySelector('.confirm').classList.add('confirmation-dialog');
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="logout-container">
        <h1>Logout</h1>
        <p>Are you sure you want to logout?</p>
        <asp:Button ID="btnYes" runat="server" CssClass="logout-btn" Text="Yes" OnClick="btnYes_Click" />
        <asp:Button ID="btnNo" runat="server" CssClass="logout-btn" Text="No" OnClick="btnNo_Click" />
    </div>
</asp:Content>
