using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string username = Request.QueryString["username"];

                // Update the href link for the "Generate Invoice" navigation link
                string generateInvoiceUrl = "GenerateInvoice.aspx";
                if (!string.IsNullOrEmpty(username))
                {
                    generateInvoiceUrl += "?username=" + Server.UrlEncode(username);
                }

                string invoiceRecordsUrl = "InvoiceRecords.aspx";
                if (!string.IsNullOrEmpty(username))
                {
                    invoiceRecordsUrl += "?username=" + Server.UrlEncode(username);
                }


                string HomeUrl = "Home.aspx";
                if (!string.IsNullOrEmpty(username))
                {
                    HomeUrl += "?username=" + Server.UrlEncode(username);
                }

                string LogoutUrl = "Logout.aspx";
                if (!string.IsNullOrEmpty(username))
                {
                    LogoutUrl += "?username=" + Server.UrlEncode(username);
                }

                // Update the URL of the "Generate Invoice" link in the navigation bar
                generateInvoiceLink.HRef = generateInvoiceUrl;
                invoiceRecordsLink.HRef = invoiceRecordsUrl;
                HomeLink.HRef = HomeUrl;
                logoutLink.HRef = LogoutUrl;
            }
        }
    }
}