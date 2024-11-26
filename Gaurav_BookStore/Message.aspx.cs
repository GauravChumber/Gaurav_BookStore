using System;
using System.Web.UI;
//Message.aspx.cs
namespace Gaurav_BookStore
{
    public partial class Message : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnContinueShopping_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Products.aspx");
        }
    }
}
