<%@ Page Title="Cart" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Gaurav_BookStore.Cart" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <h2>Your Cart</h2>

        <asp:Label ID="lblEmptyCartMessage" runat="server" Text="Your cart is empty." CssClass="alert alert-warning" Visible="False" />

        <!-- display cart items -->
        <asp:GridView ID="GridViewCart" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped">
            <Columns>
                <asp:BoundField DataField="Title" HeaderText="Title" />
                <asp:BoundField DataField="Author" HeaderText="Author" />
                <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:C}" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                <asp:BoundField DataField="GenreName" HeaderText="Genre" />
            </Columns>
        </asp:GridView>

        <!-- Cart-->
        <div class="mt-4">
            <div class="row">
                <div class="col-md-6">
                    <!-- Shopping Button -->
                    <asp:Button ID="btnContinueShopping" runat="server" Text="Continue Shopping" OnClick="btnContinueShopping_Click" CssClass="btn btn-primary btn-block" />
                </div>
                <div class="col-md-6">
                    <!-- Checkout Button -->
                    <asp:Button ID="btnCheckout" runat="server" Text="Checkout" OnClick="btnCheckout_Click" CssClass="btn btn-success btn-block" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
