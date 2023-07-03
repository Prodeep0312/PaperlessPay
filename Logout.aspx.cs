using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            Response.Redirect("LoginForm.aspx");
        }

        protected void btnNo_Click(object sender, EventArgs e)
        {

             string username = Request.QueryString["username"];
               Response.Redirect("Home.aspx?username=" + Server.UrlEncode(username));

                

            
        }
    }
}