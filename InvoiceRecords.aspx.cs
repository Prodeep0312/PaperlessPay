using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Diagnostics;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class InvoiceRecord : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }

            gridView.PageIndexChanging += gridView_PageIndexChanging;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindGridView();
        }

        private void BindGridView()
        {


            try
            {
                // Existing code for binding the grid view
                string username = Request.QueryString["username"];
                //Debug.WriteLine(username);
                DateTime? startDate = GetStartDate();
                //Debug.WriteLine(startDate);
                DateTime? endDate = GetEndDate();
                //Debug.WriteLine(endDate);

                DatabaseHelper dbHelper = new DatabaseHelper();
                DataTable dt = dbHelper.GetInvoiceRecords(username, startDate, endDate);


                if (dt.Rows.Count > 0)
                    {
                        gridView.DataSource = dt;
                        gridView.DataBind();
                        lblNoRecords.Visible = false; // Hide the "No records found" message
                    }
                    else
                    {
                        gridView.DataSource = null;
                        gridView.DataBind();
                        lblNoRecords.Visible = true; // Show the "No records found" message
                    }
                
            }
            catch (Exception ex)
            {

                Console.WriteLine("Error: " + ex.Message);
            }

        }

        private DateTime? GetStartDate()
        {
            DateTime startDateValue;
            if (DateTime.TryParseExact(startDate.Text, "yyyy-MM-dd", null, System.Globalization.DateTimeStyles.None, out startDateValue))
            {
                return startDateValue;
            }
            return null;
        }

        private DateTime? GetEndDate()
        {
            DateTime endDateValue;
            if (DateTime.TryParseExact(endDate.Text, "yyyy-MM-dd", null, System.Globalization.DateTimeStyles.None, out endDateValue))
            {
                // Adjust the end date to include the whole day
                endDateValue = endDateValue.AddDays(1).AddSeconds(-1);
                return endDateValue;
            }
            return null;
        }

        protected void gridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DateTime date = Convert.ToDateTime(DataBinder.Eval(e.Row.DataItem, "Date"));
                e.Row.Cells[5].Text = date.ToString("dd/MM/yyyy");
            }
        }

        protected void gridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridView.PageIndex = e.NewPageIndex;
            BindGridView();
        }

        

        protected void btnDownload_Click(object sender, EventArgs e)
        {
            Button btnDownload = (Button)sender;
            string sno = btnDownload.CommandArgument.ToString();

            // Find the corresponding row in the GridView
            GridViewRow gridViewRow = (GridViewRow)btnDownload.NamingContainer;

            // Retrieve the PDF Name value using the DataKeyNames
            string pdfName = gridView.DataKeys[gridViewRow.RowIndex]["PDFName"].ToString();
            Debug.WriteLine(pdfName + "1234");

            if (!string.IsNullOrEmpty(pdfName))
            {

                // Remove the last two characters from the file name
                string fileNameWithoutSeconds = pdfName.Substring(0, pdfName.Length - 6) + pdfName.Substring(pdfName.Length - 4);
                Debug.WriteLine(fileNameWithoutSeconds + "1234");

                // Generate the file path
                string directoryPath = Server.MapPath("~/downloads/");
                string filePath = Path.Combine(directoryPath, pdfName);

                // Create the directory if it doesn't exist
                Directory.CreateDirectory(directoryPath);

                // Download the file
                Response.ContentType = "application/pdf";
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + pdfName);
                Response.TransmitFile(filePath);
                Response.End();
            }

        }
    }
}