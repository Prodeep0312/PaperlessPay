//using iTextSharp.text;
////using iTextSharp.text.html.simpleparser;
//using iTextSharp.text.pdf;
//using iTextSharp.tool.xml;
//using System;
//using System.Collections.Generic;
////using System.Drawing;
//using System.IO;
//using System.Linq;
//using System.Text;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;
//using BarcodeLib;
//using ZXing;
//using ZXing.Common;
//using System.Web.UI;
//using System.Drawing;
//using System.Drawing.Imaging;
//using System.Data.SqlClient;

//namespace Project
//{
//    public partial class NewForm : System.Web.UI.Page
//    {
//        public object TYPE { get; private set; }

//        protected void Page_Load(object sender, EventArgs e)
//        {
//            if (!IsPostBack)
//            {
//                if (Request.QueryString["username"] != null)
//                {
//                    string username = Request.QueryString["username"];
                   
//                }
//            }


//        }

//        protected void TextBox3_TextChanged(object sender, EventArgs e)
//        {

//        }
//        protected void TextBox4_TextChanged(object sender, EventArgs e)
//        {

//        }

//        protected void TextBox1_TextChanged(object sender, EventArgs e)
//        {

//        }

//        protected void TextBox2_TextChanged(object sender, EventArgs e)
//        {

//        }

//        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
//        {

//        }

//        protected void TextBox5_TextChanged(object sender, EventArgs e)
//        {

//        }
//        public static string ConvertNumbertoWords(int number)
//        {
//            if (number == 0)
//                return "ZERO";
//            if (number < 0)
//                return "minus " + ConvertNumbertoWords(Math.Abs(number));
//            string words = "";

//            //if ((number / 1000000000) > 0)
//            //{
//            //    words += ConvertNumbertoWords(number / 1000000000) + " Billion ";
//            //    number %= 1000000000;
//            //}

//            if ((number / 100000000) > 0 || (number / 10000000) > 0)
//            {
//                if ((number / 10000000) > 0)
//                {
//                    words += ConvertNumbertoWords(number / 10000000) + " CRORE ";
//                    number %= 10000000;
//                }
//                if ((number / 100000000) > 0)
//                {
//                    words += ConvertNumbertoWords(number / 100000000) + " CRORE ";
//                    number %= 100000000;
//                }
//            }

//            if ((number / 1000000) > 0 || (number / 100000) > 0)
//            {
//                if ((number / 100000) > 0)
//                {
//                    words += ConvertNumbertoWords(number / 100000) + " LAKH ";
//                    number %= 100000;
//                }
//                if ((number / 1000000) > 0)
//                {
//                    words += ConvertNumbertoWords(number / 1000000) + " LAKH ";
//                    number %= 1000000;
//                }

//            }
//            if ((number / 1000) > 0)
//            {
//                words += ConvertNumbertoWords(number / 1000) + " THOUSAND ";
//                number %= 1000;
//            }
//            if ((number / 100) > 0)
//            {
//                words += ConvertNumbertoWords(number / 100) + " HUNDRED ";
//                number %= 100;
//            }
//            if (number > 0)
//            {
//                if (words != "")
//                    words += "AND ";
//                var unitsMap = new[] { "ZERO", "ONE", "TWO", "THREE", "FOUR", "FIVE", "SIX", "SEVEN", "EIGHT", "NINE", "TEN", "ELEVEN", "TWELVE",
//     "THIRTEEN", "FOURTEEN","FIFTEEN", "SIXTEEN", "SEVENTEEN", "EIGHTEEN", "NINETEEN" };
//                var tensMap = new[] { "ZERO", "TEN", "TWENTY", "THIRTY", "FORTY", "FIFTY", "SIXTY", "SEVENTY", "EIGHTY", "NINETY" };

//                if (number < 20)
//                    words += unitsMap[number];
//                else
//                {
//                    words += tensMap[number / 10];
//                    if ((number % 10) > 0)
//                        words += " " + unitsMap[number % 10];
//                }
//            }
//            return words;
//        }

        
//        protected void Button1_Click(object sender, EventArgs e)
//        {
//            //string pdfName = string.Empty;
//            string pdfName = "File_" + DateTime.Now.ToString("ddMMyyyyhhmmss") + ".pdf";




//            string connectionString = "Data Source=LAPTOP-F51OHCG1\\MSSQLSERVER01;Initial Catalog=LoginDB;Integrated Security=True";

//            using (SqlConnection connection = new SqlConnection(connectionString))
//            {
//                string username = Request.QueryString["username"];

//                string studentName = TextBox1.Text;
//                string address = TextBox2.Text;
//                string paymentType = DropDownList1.SelectedItem.Text;
//                string date = TextBox3.Text; // Current date and time
//                string course = TextBox5.Text;
//                decimal fees = decimal.Parse(TextBox4.Text);

//                connection.Open();

//                // Insert the form data into the Invoice table
//                string queryInsertInvoice = "INSERT INTO Invoice (Username, StudentName, Address, PaymentType, Date, Course, Fees) " +
//                    "VALUES (@Username, @StudentName, @Address, @PaymentType, @Date, @Course, @Fees,@PDFName)";
//                SqlCommand cmdInsertInvoice = new SqlCommand(queryInsertInvoice, connection);
//                cmdInsertInvoice.Parameters.AddWithValue("@Username", username);
//                cmdInsertInvoice.Parameters.AddWithValue("@StudentName", studentName);
//                cmdInsertInvoice.Parameters.AddWithValue("@Address", address);
//                cmdInsertInvoice.Parameters.AddWithValue("@PaymentType", paymentType);
//                cmdInsertInvoice.Parameters.AddWithValue("@Date", date);
//                cmdInsertInvoice.Parameters.AddWithValue("@Course", course);
//                cmdInsertInvoice.Parameters.AddWithValue("@Fees", fees);
                

//                //pdfName = "File_" + DateTime.Now.ToString("ddMMyyyyhhmmss") + ".pdf";
//                cmdInsertInvoice.Parameters.AddWithValue("@PDFName", pdfName);
//                    cmdInsertInvoice.ExecuteNonQuery();


//                ClientScript.RegisterStartupScript(this.GetType(), "Invoice Generated!", "alert('Invoice Generated!');", true);
//            }







//            string img = Server.MapPath("~/Img/sign2.png");
//            string logo = Server.MapPath("~/Img/logo.jpg");
//            string word = ConvertNumbertoWords(Convert.ToInt32(Math.Round(Convert.ToDecimal(TextBox4.Text))));
//            Random r = new Random();
//            int num = r.Next();

//            StringBuilder sb = new StringBuilder();
//            sb.Append("<header class='clearfix'>");
//            sb.Append("<div style='text-align: center;'>");
//            sb.Append("<img src='" + logo + "' style='width: 200px; height: 120px;' />");
//            sb.Append("</div>");

//            sb.Append("<p align='center' style='font-size:12px'><b>5th Flr., T.O.P  Commercial Complex, Juhu Chaupati ,Mumbai ,India - 400053. </b></p>");
//            sb.Append("<br/>");
//            sb.Append("<p align='center' style='font-size:12px'><b>Phone</b>(243) 758-4368 </p>");
//            sb.Append("<br/>");
//            sb.Append("<p align='center' style='font-size:12px'><b>Fax</b>(243) 758-5839 </p>");
//            sb.Append("<br/>");
//            sb.Append("<b> <p align ='center'>Fees Slip</p></b>");
//            sb.Append("<br/>");
//            sb.Append("<br/>");
//            sb.Append("</header>");
//            sb.Append("<main>");
//            sb.Append("<p align='left'><b>INVOICE NO : " + num.ToString() + ".</b></p>");
//            sb.Append("<br/>");
//            sb.Append("<p align='left'><b>Student Name : Mr/Mrs./Miss:"+TextBox1.Text+".</b></p>");
//            sb.Append("<br/>");
//            sb.Append("<p align='left'><b>Address : " + TextBox2.Text + ".</b></p>");
//            sb.Append("<br/>");
//            sb.Append("<p align='left'><b>Payment Type : " + DropDownList1.SelectedItem.Text + ".</b></p>");
//            sb.Append("<br/>");
//            sb.Append("<p align='left'><b>Date : " + TextBox3.Text + ".</b></p>");
//            sb.Append("<br/>");
//            sb.Append("<br/>");
//            sb.Append("<br/>");
//            //sb.Append("<table border=1 align='center'>");
//            //sb.Append("<table border=1 align='center'>");
//            sb.Append("<table border='1' align='center' style='width: 100%; border-collapse: collapse; padding: 5px;'>");

//            sb.Append("<thead>");
//            sb.Append("<tr>");
//            sb.Append("<th style='width:3px;'>Fees No</th>");
//            sb.Append("<th style='width:20px;'>Course Type</th>");
//            sb.Append("<th style='width:10px;'>Amount Paid</th>");
//            sb.Append("</tr>");
//            sb.Append("</thead>");
//            sb.Append("<tbody>");
//            sb.Append("<tr>");
//            sb.Append("<td align='center'>1</td>");
//            sb.Append("<td align='center'>" + TextBox5.Text +"</td>");
//            sb.Append("<td align='center'>Rs. " + TextBox4.Text +"</td>");
//            sb.Append("</tr>");
//            sb.Append("</tbody>");
//            sb.Append("</table>");
//            sb.Append("</main>");
//            sb.Append("<br/>");
//            sb.Append("<p align='left'><b>Amount in Word: RUPEES " + word + "ONLY.</b></p>");
//            sb.Append("<br/>");
//            sb.Append("<br/>");
//            //sb.Append("<img align='right' src='" + img + "' width='60px' height='40px' />");
//            sb.Append("<div style='text-align: right;'>");
//            sb.Append("<img src='" + img + "' style='width: 200px; height: 120px;' />");
//            sb.Append("</div>");
//            sb.Append("<br/>");
//            sb.Append("<p align='right'><b>Signature</b></p>");
//            sb.Append("<br/>");
            


//            // Generate the barcode image
//            BarcodeWriter barcodeWriter = new BarcodeWriter();
//            EncodingOptions encodingOptions = new EncodingOptions
//            {
//                Width = 150,
//                Height = 80,
//                Margin = 0
//            };
//            barcodeWriter.Format = BarcodeFormat.CODE_128;
//            barcodeWriter.Options = encodingOptions;
//            Bitmap barcodeBitmap = barcodeWriter.Write(num.ToString());
//            string barcodeImagePath = Server.MapPath("~/Img/barcode.jpg");

//            // Save barcode image to a file
           
//            barcodeBitmap.Save(barcodeImagePath, ImageFormat.Jpeg);
//            // Load the barcode image
            
//            iTextSharp.text.Image barcodeImage = iTextSharp.text.Image.GetInstance(barcodeImagePath);

//            // Set the position and size of the barcode image
//            barcodeImage.SetAbsolutePosition(10, 30); // Adjust the X and Y coordinates as needed
//            barcodeImage.ScaleAbsolute(100, 50); // Adjust the width and height as needed

            

//            sb.Append("<div style='position: fixed; bottom: 30px; left: 0; right: 0; text-align: center;'>");
//            sb.Append("<p>Note: Fees Once Paid Will Not Be Refundable Under Any Circumstances</p>");
//            sb.Append("<div style='width: 100%; border-bottom: 1px dashed #000; line-height: 0.1em; margin: 8px auto;'></div>");
//            sb.Append("...............................................................................................................................");
//            sb.Append("</div>");
            
//            StringReader sr = new StringReader(sb.ToString());
//            Document pdfDoc = new Document(PageSize.A4,10f,10f,10f,0f);
          
            


            
//            using(MemoryStream memoryStream=new MemoryStream())
//            {
//                PdfWriter writer = PdfWriter.GetInstance(pdfDoc, memoryStream);
//                pdfDoc.Open();
//                pdfDoc.Add(barcodeImage);


                


//                XMLWorkerHelper.GetInstance().ParseXHtml(writer, pdfDoc, sr);
//                //htmlparser.Parse(sr);
//                pdfDoc.Close();
//                byte[] bytes = memoryStream.ToArray();
//                System.IO.File.WriteAllBytes(Server.MapPath("~/downloads/")+pdfName,bytes);
//                memoryStream.Close();

                
                
//                Response.Clear();
//                Response.ContentType = "application/pdf";
//                Response.AddHeader("Content-Disposition", "attachment; filename="+pdfName) ;
//                Response.Buffer = true;
//                Response.Cache.SetCacheability(HttpCacheability.NoCache);
//                Response.BinaryWrite(bytes);
//                Response.Flush();
//                Response.Close();
//                Response.End();
//            }









//        }

        
//    }
//}