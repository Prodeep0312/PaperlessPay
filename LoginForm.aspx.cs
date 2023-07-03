using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class LoginForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool False = false;
        }

        protected void txtusername_TextChanged(object sender, EventArgs e)
        {
            bool False = false;
        }

        protected void txtpass_TextChanged(object sender, EventArgs e)
        {
            bool False = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string username = txtusername.Text.Trim();
            string password = txtpass.Text.Trim();

            if (AuthenticateUser(username, password))
            {

                Response.Redirect("Home.aspx?username=" + Server.UrlEncode(username));

            }
            else
            {
                //lblError.Text = "Invalid username or password";
                ClientScript.RegisterStartupScript(this.GetType(), "InvalidLogin", "alert('Invalid username or password');", true);

            }
        }

            private bool AuthenticateUser(string username, string password)
            {
            DatabaseHelper dbHelper = new DatabaseHelper();
            return dbHelper.AuthenticateUser(username, password);
        }

        protected void Regi_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegistrationForm.aspx");
        }
    }
    }
;