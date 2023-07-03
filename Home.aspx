<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Project.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>
    <html>
    <head>
        <title></title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
        <style>
            .main-content {
                width: 100%;
                position: absolute;
                top: 50%;
                transform: translateY(-50%);
                text-align: center;
                color: #fff;
            }

            .main-content h1 {
                font-size: 70px;
                margin-top: 80px;
            }

            .main-content p {
                margin: 20px auto;
                font-weight: 100;
                line-height: 25px;
            }
             
            .welcome-message {
                font-size: 35px;
                margin: 0;
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

            * {
                box-sizing: border-box;
            }

            .tns-slider {
                max-width: 100%;
                margin-bottom: 20px;
                margin-top: 200px;
            }

            .tns-slider img {
                max-width: 100%;
                height: 70px;
                margin: 2px; /* Add margin for spacing between images */
            }
            .my-slider
            {
                 margin-bottom: 20px;
            }
        </style>
    </head>
    <body>
        <div class="main-content">
            <% if (!string.IsNullOrEmpty(Request.QueryString["username"])) { %>
            <div>
                <p class="welcome-message">Welcome, <%: Request.QueryString["username"] %></p>
            </div>
            <% } %>
            <h1>GENERATE ONLINE INVOICE</h1>
            <p>We provide an efficient and easy-to-use solution for generating invoices online.<br />Create professional-looking invoices in minutes.</p>
        </div>

        <div class="tns-slider">
            <div class="my-slider">
                <img src="Img/invoice1.png" alt="Invoice 1">
                <img src="Img/invoice2.jpg" alt="Invoice 2">
                <img src="Img/invoice3.jpg" alt="Invoice 3">
                <img src="Img/invoice4.jpeg" alt="Invoice 4">
                <img src="Img/invoice5.png" alt="Invoice 5">
                <img src="Img/invoice5.jpg" alt="Invoice 6">
                <img src="Img/invoice6.png" alt="Invoice 7">
                <img src="Img/invoice8.jpg" alt="Invoice 8">
                <img src="Img/invoice9.jpg" alt="Invoice 9">
                <img src="Img/invoice10.png" alt="Invoice 10">
                <img src="Img/invoice11.jpg" alt="Invoice 11">
                <img src="Img/invoice12.png" alt="Invoice 12">
            </div>
        </div>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/tiny-slider/2.9.3/min/tiny-slider.js"></script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var slider = tns({
                    container: '.my-slider',
                    items: 1,
                    slideBy: 'page',
                    autoplay: true,
                    autoplayButtonOutput: false,
                    controls: false,
                    navPosition: 'bottom',
                    loop: true, // Enable circular loop
                    gutter: 20 // Add spacing between images
                });
            });
        </script>
    </body>
    </html>


    <asp:Table ID="Table1" runat="server" Height="83px" Width="1349px">
</asp:Table>
    

</asp:Content>