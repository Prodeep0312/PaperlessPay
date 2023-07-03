<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrationForm.aspx.cs" Inherits="Project.RegistrationForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Page </title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"  />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
     <style>
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

    .register-box {
      width: 500px;
      padding: 20px;
      background-color: #343638;
      border: 1px solid;
      border-radius: 4px;
      margin: 0 auto; /* Added margin to center the box */
            margin-top: 500px; /* Adjust the top margin as needed */
    }

    .register-box h2 {
      color: #fff;
      text-align: center;
      margin-bottom: 20px;
    }

    .register-box label {
      color: #fff;
    }
     .lg h2{
        height:20px;
        padding:0px 12px 3px 12px;
    }
     .b1{
         background-color: white; 
  color: black; 
  border: 2px solid #4CAF50;
     }
     .b1:hover{
         background-color:forestgreen;
         transition: 0.2s;
         color:white;
     }
    label{width:100px;display:inline-block;vertical-align:top}

    .remember label{width:150px;display:inline-block;vertical-align:top}
    .rbutton{
        margin-left:260px;
    }
    

        .main-content * {
                opacity: 0;
                animation: fade-in 2s forwards;
            }
        @keyframes fade-in {
                0% {
                    opacity: 0;
                }
                100% {
                    opacity: 1;
                }
            }
    

  </style>

</head>
<body>
    <form id="form1" runat="server" style="width: 1400px;">
        <div class="register-box rounded-bottom border border-5  shadow-lg p-3 mb-5 bg-body" onsubmit="validateForm(event)">
           <div class="p-3 mb-2 bg-danger text-white lg rounded-pill"><h2>Registration</h2></div>
    
    
        
      

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

          <br />
           <asp:Button ID="Button1" runat="server" Text="Submit" type="submit" class="btn b1" OnClick="Button1_Click" />
          <%--  --%>

          <%--<asp:Button ID="Button2" runat="server" Text="Back to Login" class="btn b1 rbutton" OnClick="Button2_Click" CausesValidation="false" />--%>
          <asp:Button ID="Button2" runat="server" Text="Back to Login" class="btn b1 rbutton"  OnClientClick="return goToLoginPage();" />


         </div>




    
  </div>
        <div class="main-content">

             <h2 style="color: white;">Registered Users</h2>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowEditing="GridView1_RowEditing"
    OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_RowUpdating"
     DataKeyNames="ID" PageSize="6" AllowPaging="true" CssClass="table table-striped table-bordered" style="color: white;">
    <Columns>
        <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
        <asp:BoundField DataField="Username" HeaderText="Username" />
        <asp:BoundField DataField="Password" HeaderText="Password" />
        <asp:BoundField DataField="isactive" HeaderText="isactive" />
        <asp:CommandField ShowEditButton="true" ButtonType="Button" HeaderText="Edit" CausesValidation="false" />
    </Columns>
</asp:GridView>
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


    <script>
        function goToLoginPage() {
            // Redirect to the login page
            window.location.href = "LoginForm.aspx";
            return false; // Prevent form submission
        }
    </script>
</body>
</html>
