using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using Gaurav_BookStore.Models;
//Products.aspx.cs
namespace Gaurav_BookStore
{
    public partial class Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (Session["FirstName"] != null)
                {
                    lblWelcome.Text = $"Welcome, {Session["FirstName"]}!";
                }
                else
                {
                    lblWelcome.Text = "Welcome, Guest!";
                }
            }
        }

        // book selection changes
        protected void ddlProducts_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedBookID = int.Parse(ddlProducts.SelectedValue);
            LoadBookDetails(selectedBookID);
        }

        // Load book details
        private void LoadBookDetails(int bookID)
        {
            Book selectedBook = GetBookFromDatabase(bookID);
            if (selectedBook != null)
            {
                lblAuthor.Text = selectedBook.Author;
                lblPrice.Text = string.Format("{0:C}", selectedBook.Price); // Format price as currency
                lblGenre.Text = selectedBook.GenreName;

                // Display image
                imgBook.ImageUrl = ResolveUrl($"~/{selectedBook.PictureUrl}");
            }
        }

        // Retrieve book from database
        private Book GetBookFromDatabase(int bookID)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT b.BookID, b.Title, b.Author, b.Price, g.GenreName, b.PictureUrl FROM Books b " +
                               "INNER JOIN Genre g ON b.GenreID = g.GenreID WHERE b.BookID = @BookID";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@BookID", bookID);

                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    return new Book
                    {
                        BookID = (int)reader["BookID"],
                        Title = reader["Title"].ToString(),
                        Author = reader["Author"].ToString(),
                        Price = (decimal)reader["Price"],
                        GenreName = reader["GenreName"].ToString(),
                        PictureUrl = reader["PictureUrl"].ToString()  // Get the Picture URL from the database
                    };
                }
            }

            return null;
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            // Server-side validation for quantity
            if (string.IsNullOrWhiteSpace(txtQuantity.Text))
            {
                lblErrorMessage.Text = "Please enter a valid quantity.";
                lblErrorMessage.Visible = true;
                return;
            }

            if (!int.TryParse(txtQuantity.Text, out int quantity) || quantity <= 0)
            {
                lblErrorMessage.Text = "Quantity should be more than 0";
                lblErrorMessage.Visible = true;
                return;
            }

            // Proceed if quantity is valid
            int selectedBookID = int.Parse(ddlProducts.SelectedValue);
            Book selectedBook = GetBookFromDatabase(selectedBookID);

            if (selectedBook != null)
            {
                var cart = (List<Book>)Session["CartItems"] ?? new List<Book>();

                // Add the book with quantity
                selectedBook.Quantity = quantity;
                cart.Add(selectedBook);

                // Store the cart in session
                Session["CartItems"] = cart;

                lblErrorMessage.Visible = false;
            }
        }


        protected void btnGoToCart_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Cart.aspx");
        }
    }
}
