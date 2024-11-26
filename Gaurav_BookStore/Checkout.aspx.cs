using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using Gaurav_BookStore.Models;
//Checkout.aspx.cs
namespace Gaurav_BookStore
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DisplayCartSummary();
                PopulateStateDropdown();
            }
        }

        // Display Cart
        private void DisplayCartSummary()
        {
            var cart = (List<Book>)Session["CartItems"];
            if (cart != null && cart.Count > 0)
            {
                GridViewCartSummary.DataSource = cart;
                GridViewCartSummary.DataBind();
            }
            else
            {
                lblCartSummary.Text = "Your cart is empty.";
            }
        }

        // Dropdown with sample data
        private void PopulateStateDropdown()
        {
            ddlState.Items.Add(new ListItem("Select State", ""));
            ddlState.Items.Add(new ListItem("Ontario", "ON"));
            ddlState.Items.Add(new ListItem("British Columbia", "BC"));
            ddlState.Items.Add(new ListItem("New Brunswick", "NBC"));
        }

        // Order Button Click Event
        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {

                // Clear the cart
                Session["CartItems"] = null;
                Response.Redirect("~/Message.aspx");
            }
        }

        // Go Back to Cart
        protected void btnGoBackToCart_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Cart.aspx");
        }
    }
}
