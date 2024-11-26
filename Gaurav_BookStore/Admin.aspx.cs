using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace Gaurav_BookStore
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // No specific Page_Load logic needed yet
        }

        // Add New Genre Button Click Event
        protected void btnAddGenre_Click(object sender, EventArgs e)
        {
            string newGenre = txtNewGenre.Text.Trim();

            if (!string.IsNullOrEmpty(newGenre))
            {
                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO Genre (GenreName) VALUES (@GenreName)";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@GenreName", newGenre);

                    try
                    {
                        connection.Open();
                        command.ExecuteNonQuery();
                        txtNewGenre.Text = string.Empty; // Clear the input field

                        // Rebind Dropdown and GridView
                        ddlGenres.DataBind();
                        GridViewGenreMaintenance.DataBind();
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                    }
                }
            }
            else
            {
                Response.Write("<script>alert('Genre name cannot be empty.');</script>");
            }
        }

        // Handle Edit Command for Books
        protected void DataListBooks_EditCommand(object source, DataListCommandEventArgs e)
        {
            DataListBooks.EditItemIndex = e.Item.ItemIndex;
            DataListBooks.DataBind();
        }

        // Handle Cancel Command for Books
        protected void DataListBooks_CancelCommand(object source, DataListCommandEventArgs e)
        {
            DataListBooks.EditItemIndex = -1;
            DataListBooks.DataBind();
        }

        // Handle Update Command for Books
        protected void DataListBooks_UpdateCommand(object source, DataListCommandEventArgs e)
        {
            int bookID = Convert.ToInt32(e.CommandArgument);
            TextBox txtTitle = (TextBox)e.Item.FindControl("txtTitle");
            TextBox txtPrice = (TextBox)e.Item.FindControl("txtPrice");

            if (txtTitle != null && txtPrice != null)
            {
                string title = txtTitle.Text.Trim();
                decimal price = decimal.Parse(txtPrice.Text.Trim());

                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "UPDATE Books SET Title = @Title, Price = @Price WHERE BookID = @BookID";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@Title", title);
                    command.Parameters.AddWithValue("@Price", price);
                    command.Parameters.AddWithValue("@BookID", bookID);

                    try
                    {
                        connection.Open();
                        command.ExecuteNonQuery();

                        DataListBooks.EditItemIndex = -1;
                        DataListBooks.DataBind();
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                    }
                }
            }
        }

        // Handle SqlDataSource Update for Genre Maintenance
        protected void SqlDataSourceGenreMaintenance_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
            ddlGenres.DataBind();
        }

        // Handle SqlDataSource Delete for Genre Maintenance
        protected void SqlDataSourceGenreMaintenance_Deleted(object sender, SqlDataSourceStatusEventArgs e)
        {
            ddlGenres.DataBind();
        }
    }
}
