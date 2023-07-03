<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginForm.aspx.cs" Inherits="Project.LoginForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
     <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <%--<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Amatic+SC" />--%>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css" />
    <link rel="stylesheet" href="assets/css/style.css" />

     <style>
         /*body,h1,h2,h3,h4,h5,h6 {font-family: "Amatic SC", sans-serif}*/
     body {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      /*background-color: #1eabad;*/
      background-image:url('bg5.jpeg');
        background-repeat:no-repeat;
        background-attachment:fixed;
         background-size:cover;
         opacity: 0.7;
         
    }

    .login-box {
      width: 500px;
      padding: 20px;
      background-color: #343638;
      border: 1px solid;
      border-radius: 4px;
    }

    .login-box h2 {
      color: #fff;
      text-align: center;
      margin-bottom: 20px;
    }

    .login-box label {
      color: #fff;
    }
     .lg h2{
        height:20px;
        padding:0px 12px 3px 12px;
    }
     .text-right label:hover{
         color: yellow;
         transition: 0.2s;
     }
     .b1,.b2 {
  background-color: white; 
  color: black; 
  border: 2px solid #4CAF50;
}
     .b1:hover{
         background-color:forestgreen;
         transition: 0.2s;
         color:white;
     }
     .b2:hover{
         background-color:forestgreen;
         transition: 0.2s;
         color:white;
     }
     .Regi{
         margin-left:100px;
     }
       

     

    label{width:100px;display:inline-block;vertical-align:top}

    .remember label{width:150px;display:inline-block;vertical-align:top}
  </style>
</head>
<body>
    <form id="form1" runat="server">
     <div class="login-box rounded-bottom   shadow-lg p-3 mb-5 bg-body w3-button w3-xxlarge w3-black" onsubmit="validateForm(event)">
           <div class="p-3 mb-2 bg-danger text-white lg rounded-pill"><h2>Login</h2></div>
    
    
        
      

      <div class="form-group">
        <label for="txtusername">Username</label>
<%--        <input type="email" class="form-control" id="email" placeholder="Enter your username" required="" />--%>
          <asp:TextBox ID="txtusername" runat ="server" ClientIDMode="Static" class="form-control" placeholder="Enter your username" required="" OnTextChanged="txtusername_TextChanged" ></asp:TextBox>
      </div>
             

      <div class="form-group">
        <%--<label for="password">Password</label>--%>
        <%--<input type="password" class="form-control" id="password" placeholder="Enter your password" required="" />--%>
          <%--<asp:TextBox ID="txtpass" runat ="server" ClientIDMode="Static" class="form-control" placeholder="Enter your password" required="" OnTextChanged="txtpass_TextChanged"  ></asp:TextBox>--%>

           <%--<button type="submit" class="btn btn-success">Submit</button>--%>


         <%-- <label for="password">Password</label>
    <div class="input-group">
        <asp:TextBox ID="txtpass" runat="server" ClientIDMode="Static" CssClass="form-control" placeholder="Enter your password" TextMode="Password" RequiredFieldValidatorID="rfvPassword" OnTextChanged="txtpass_TextChanged"></asp:TextBox>
        <div class="input-group-append">
            <span class="input-group-text" onclick="togglePasswordVisibility('txtpass')">
                <i class="fa fa-eye-slash"></i>
            </span>
        </div>
    </div>
    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtpass" ErrorMessage="Password is required." ValidationGroup="LoginRegistration"></asp:RequiredFieldValidator>--%>

          <label for="password">Password</label>
    <div class="input-group">
        <asp:TextBox ID="txtpass" runat="server" ClientIDMode="Static" CssClass="form-control" placeholder="Enter your password" TextMode="Password" RequiredFieldValidatorID="rfvPassword"></asp:TextBox>
        <div class="input-group-append">
            <span class="input-group-text" onclick="togglePasswordVisibility('txtpass')">
                <i class="fa fa-eye-slash"></i>
            </span>
        </div>
    </div>
    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtpass" ErrorMessage="Password is required." ValidationGroup="LoginRegistration"></asp:RequiredFieldValidator>

          </br>
  <div style="display: flex;">
    <asp:Button ID="Button1" runat="server" Text="Submit" type="submit" class="btn b1" OnClick="Button1_Click" style="margin-right: auto;" />
    <div style="margin-right: auto;"></div> <!-- Empty div for creating space in the middle -->
    <label for="Regi" style="margin-right: 5px;">New User?</label>
    <asp:Button ID="Regi" runat="server" Text="Register" class="btn b2" OnClick="Regi_Click" formnovalidate="true" />
</div>


            <%--<asp:Button runat="server" a href="RegistrationForm.aspx" class="btn btn-primary" ID="reg">Register</asp:Button>--%>
            




    
  </div>
         </div>

    </form>
   

    <script>
    function togglePasswordVisibility(passwordFieldId) {
        var passwordField = document.getElementById(passwordFieldId);
        var icon = passwordField.parentElement.querySelector('.input-group-text i');

        if (passwordField.type === 'password') {
            passwordField.type = 'text';
            icon.classList.remove('fa-eye-slash');
            icon.classList.add('fa-eye');
        } else {
            passwordField.type = 'password';
            icon.classList.remove('fa-eye');
            icon.classList.add('fa-eye-slash');
        }
    }
    </script>
</body>
</html>
