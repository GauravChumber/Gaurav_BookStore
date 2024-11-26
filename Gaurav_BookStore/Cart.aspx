

<%@ Page Title="Cart" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Gaurav_BookStore.Cart" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Cart.aspx -->
    <div class="container mt-5">
        <h2>Your Cart</h2>

        <asp:Label ID="lblEmptyCartMessage" runat="server" Text="Your cart is empty." CssClass="alert alert-warning" Visible="False" />

       <!-- Empty Cart Message -->
<asp:Label ID="Label1" runat="server" Text="Your cart is empty." CssClass="alert alert-warning" Visible="False" />

<!-- GridView with Update Quantity Button -->
<asp:GridView ID="GridViewCart" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped" OnRowCommand="GridViewCart_RowCommand">
    <Columns>
        <asp:BoundField DataField="Title" HeaderText="Title" />
        <asp:BoundField DataField="Author" HeaderText="Author" />
        <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:C}" />
        <asp:TemplateField HeaderText="Quantity">
            <ItemTemplate>
                <asp:TextBox ID="txtQuantity" runat="server" Text='<%# Eval("Quantity") %>' CssClass="form-control" Width="50px" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="GenreName" HeaderText="Genre" />
        <asp:ButtonField CommandName="UpdateQuantity" Text="Update" ButtonType="Button" />
    </Columns>
</asp:GridView>

<!-- Buttons for Emptying Cart and Checkout -->
<div class="mt-4">
    <asp:Button ID="btnEmptyCart" runat="server" Text="Empty Cart" CssClass="btn btn-danger" OnClick="btnEmptyCart_Click" />
</div>


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
