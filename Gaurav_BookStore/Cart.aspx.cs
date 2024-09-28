using System;
using System.Collections.Generic;
using Gaurav_BookStore.Models;

namespace Gaurav_BookStore
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DisplayCartItems();
            }
        }

        private void DisplayCartItems()
        {
            var cart = (List<Book>)Session["CartItems"];
            if (cart != null && cart.Count > 0)
            {
                GridViewCart.DataSource = cart;
                GridViewCart.DataBind();
                lblEmptyCartMessage.Visible = false;
            }
            else
            {
                // Display a message when the cart is empty
                lblEmptyCartMessage.Visible = true;
                GridViewCart.Visible = false;
            }
        }

        // Continue Shopping Button 
        protected void btnContinueShopping_Click(object sender, EventArgs e)
        {
           
            Response.Redirect("~/Products.aspx");
        }

        // Checkout Button 
        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            var cart = (List<Book>)Session["CartItems"];
            if (cart != null && cart.Count > 0)
            {
                // If cart is not empty
                Response.Redirect("~/Checkout.aspx");
            }
            else
            {
                // If cart is empty
                lblEmptyCartMessage.Text = "Your cart is empty. Please add items before proceeding to checkout.";
                lblEmptyCartMessage.Visible = true;
            }
        }
    }
}
