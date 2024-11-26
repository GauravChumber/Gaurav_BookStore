using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using Gaurav_BookStore.Models;
 //Cart.aspx.cs
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
                btnEmptyCart.Enabled = false;
            }
        }

        // Continue Shopping Button 
        protected void btnContinueShopping_Click(object sender, EventArgs e)
        {
           
            Response.Redirect("~/Products.aspx");
        }
        protected void btnEmptyCart_Click(object sender, EventArgs e)
        {
            // Clear the cart session and refresh the display
            Session["CartItems"] = new List<Book>();
            DisplayCartItems();
        }

        protected void GridViewCart_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "UpdateQuantity")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridViewCart.Rows[rowIndex];
                TextBox txtQuantity = (TextBox)row.FindControl("txtQuantity");

                int quantity;
                if (int.TryParse(txtQuantity.Text, out quantity) && quantity > 0)
                {
                    // Update quantity in session cart list
                    var cart = (List<Book>)Session["CartItems"];
                    cart[rowIndex].Quantity = quantity;
                    Session["CartItems"] = cart;
                    DisplayCartItems();
                }
                else
                {
                    lblEmptyCartMessage.Text = "Quantity must be a positive number.";
                    lblEmptyCartMessage.Visible = true;
                }
            }
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
