using System;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Project
{
    public partial class RegistrationForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
            GridView1.PageIndexChanging += GridView1_PageIndexChanging;

        }


        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            BindGrid(); 
        }


        private void BindGrid()
        {
            DatabaseHelper dbHelper = new DatabaseHelper();
            GridView1.DataSource = dbHelper.GetUsers();
            GridView1.DataBind();
        }


        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            BindGrid();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            DatabaseHelper dbHelper = new DatabaseHelper();
            string userId = GridView1.DataKeys[e.RowIndex].Value.ToString();
            string username = ((TextBox)GridView1.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
            string password = ((TextBox)GridView1.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
            string active = ((TextBox)GridView1.Rows[e.RowIndex].Cells[3].Controls[0]).Text;

            dbHelper.UpdateUser(userId, username, password, active);

            GridView1.EditIndex = -1;
            BindGrid();
        }

        protected void txtusername_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtpass_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string username = txtusername.Text;
            string password = txtpass.Text;

            DatabaseHelper dbHelper = new DatabaseHelper();

            if (dbHelper.IsUsernameDuplicate(username))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Duplicate Username", "alert('Username already exists. Please choose a different username.');", true);
            }
            else
            {
                dbHelper.InsertUser(username, password);
                ClientScript.RegisterStartupScript(this.GetType(), "Registration Successful!", "alert('Registration Success! Info added in DB');", true);
            }






        }

        
    }
}