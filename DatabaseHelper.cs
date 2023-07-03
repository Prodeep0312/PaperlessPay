using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace Project
{

    public class DatabaseHelper
    {
        private readonly string connectionString;

        public DatabaseHelper()
        {
            // Retrieve the connection string from the configuration file
            connectionString = "Data Source=LAPTOP-F51OHCG1\\MSSQLSERVER01;Initial Catalog=LoginDB;Integrated Security=True";
        }

        public bool AuthenticateUser(string username, string password)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM Users WHERE Username=@username AND Password=@password";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@username", username);
                command.Parameters.AddWithValue("@password", password);

                try
                {
                    connection.Open();
                    int userCount = (int)command.ExecuteScalar();
                    return (userCount > 0);
                }
                catch (Exception ex)
                {
                    // Handle any exceptions
                    return false;
                }
            }
        }

        public DataTable GetUsers()
        {
            string query = "SELECT ID, Username, Password, isactive FROM Users ORDER BY ID";
            return ExecuteQuery(query);
        }

        public void UpdateUser(string userId, string username, string password, string active)
        {
            string query = "UPDATE Users SET Username = @Username, Password = @Password, isactive = @isactive WHERE ID = @ID";
            SqlCommand command = new SqlCommand(query);

            command.Parameters.AddWithValue("@Username", username);
            command.Parameters.AddWithValue("@Password", password);
            command.Parameters.AddWithValue("@isactive", active);
            command.Parameters.AddWithValue("@ID", userId);

            ExecuteNonQuery(command);


        }

        public void InsertUser(string username, string password)
        {
            string query = "INSERT INTO Users (Username, Password, isactive) VALUES (@Username, @Password, 1)";
            SqlCommand command = new SqlCommand(query);

            command.Parameters.AddWithValue("@Username", username);
            command.Parameters.AddWithValue("@Password", password);

            ExecuteNonQuery(command);
        }

        public bool IsUsernameDuplicate(string username)
        {
            string query = "SELECT COUNT(*) FROM Users WHERE Username = @Username";
            SqlCommand command = new SqlCommand(query);
            command.Parameters.AddWithValue("@Username", username);

            int duplicateCount = (int)ExecuteScalar(command);
            return (duplicateCount > 0);
        }

        public void InsertInvoice(string username, string studentName, string address, string paymentType, string date, string course, decimal fees, string pdfName)
        {
            string query = "INSERT INTO Invoice (Username, StudentName, Address, PaymentType, Date, Course, Fees, PDFName) " +
                "VALUES (@Username, @StudentName, @Address, @PaymentType, @Date, @Course, @Fees, @PDFName)";
            SqlCommand command = new SqlCommand(query);

            command.Parameters.AddWithValue("@Username", username);
            command.Parameters.AddWithValue("@StudentName", studentName);
            command.Parameters.AddWithValue("@Address", address);
            command.Parameters.AddWithValue("@PaymentType", paymentType);
            command.Parameters.AddWithValue("@Date", date);
            command.Parameters.AddWithValue("@Course", course);
            command.Parameters.AddWithValue("@Fees", fees);
            command.Parameters.AddWithValue("@PDFName", pdfName);

            ExecuteNonQuery(command);
        }

        public DataTable GetInvoiceRecords(string username, DateTime? startDate, DateTime? endDate)
        {
            string query = "SELECT Sno, Username, StudentName, Address, PaymentType, Date, Course, Fees, PDFName FROM Invoice WHERE Username = @Username";
            SqlCommand command = new SqlCommand(query);
            command.Parameters.AddWithValue("@Username", username);

            if (startDate.HasValue && endDate.HasValue)
            {
                query += " AND Date >= @StartDate AND Date <= @EndDate";
                command.Parameters.AddWithValue("@StartDate", startDate.Value);
                command.Parameters.AddWithValue("@EndDate", endDate.Value);
            }
            command.CommandText = query;

            return ExecuteQuery(command);
        }

        private DataTable ExecuteQuery(string query)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        DataTable dataTable = new DataTable();
                        adapter.Fill(dataTable);
                        return dataTable;
                    }
                }
            }
        }

        private DataTable ExecuteQuery(SqlCommand command)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                command.Connection = connection;
                using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                {
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);
                    return dataTable;
                }
            }
        }

        private object ExecuteScalar(SqlCommand command)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                command.Connection = connection;
                connection.Open();
                return command.ExecuteScalar();
            }
        }

        private void ExecuteNonQuery(SqlCommand command)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                command.Connection = connection;
                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }
}