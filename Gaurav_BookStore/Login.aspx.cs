using System;
using System.Web;
//Login.aspx.cs
namespace Gaurav_BookStore
{
    public partial class Login : System.Web.UI.Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // Store the first name in the session
            Session["FirstName"] = txtFirstName.Text;
            // Redirect to Products page
            Response.Redirect("Products.aspx");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            // Redirect to Home page
            Response.Redirect("Home.aspx");
        }
    }
}
