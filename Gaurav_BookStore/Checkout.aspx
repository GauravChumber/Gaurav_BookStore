
<%@ Page Title="Checkout" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="Gaurav_BookStore.Checkout" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Checkout.aspx -->
    <div class="container mt-5">
        <h2 class="mb-4">Check Out Page</h2>

        <!-- Cart List on Checkout -->
        <div class="mb-4">
            <asp:Label ID="lblCartSummary" runat="server" Text="Your cart summary:" CssClass="h4" Visible="False" />
            <asp:GridView ID="GridViewCartSummary" runat="server" CssClass="table table-striped" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="Title" HeaderText="Title" />
                    <asp:BoundField DataField="Author" HeaderText="Author" />
                    <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:C}" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                </Columns>
            </asp:GridView>
        </div>

   
        <h3>Contact Information</h3>
        <div class="row">
            <div class="form-group col-md-6">
                <label for="txtEmail">Email Address</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email Address" />
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required." CssClass="text-danger" />
                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                    ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" ErrorMessage="Invalid email format." CssClass="text-danger" />
            </div>
            <div class="form-group col-md-6">
                <label for="txtPhoneNumber">Phone Number</label>
                <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-control" placeholder="Phone Number" />
                <asp:RequiredFieldValidator ID="rfvPhoneNumber" runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage="Phone number is required." CssClass="text-danger" />
                <asp:RegularExpressionValidator ID="revPhoneNumber" runat="server" ControlToValidate="txtPhoneNumber"
                    ValidationExpression="^\d{10}$" ErrorMessage="Phone number must be 10 digits." CssClass="text-danger" />
            </div>
        </div>

        <div class="row">
            <div class="form-group col-md-6">
                <label for="txtFirstName">First Name</label>
                <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" placeholder="First Name" />
                <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName" ErrorMessage="First name is required." CssClass="text-danger" />
            </div>
            <div class="form-group col-md-6">
                <label for="txtLastName">Last Name</label>
                <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" placeholder="Last Name" />
                <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="txtLastName" ErrorMessage="Last name is required." CssClass="text-danger" />
            </div>
        </div>

        <!-- Address Section -->
        <h3>Billing Address</h3>
        <div class="row">
            <div class="form-group col-md-12">
                <label for="txtAddress">Address</label>
                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Address" />
                <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAddress" ErrorMessage="Address is required." CssClass="text-danger" />
            </div>
        </div>
        <div class="row">
            <div class="form-group col-md-6">
                <label for="txtCity">City</label>
                <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" placeholder="City" />
                <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="txtCity" ErrorMessage="City is required." CssClass="text-danger" />
            </div>
            <div class="form-group col-md-3">
                <label for="ddlState">State</label>
                <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvState" runat="server" ControlToValidate="ddlState" InitialValue="" ErrorMessage="State is required." CssClass="text-danger" />
            </div>
            <div class="form-group col-md-3">
                <label for="txtZipCode">Zip Code</label>
                <asp:TextBox ID="txtZipCode" runat="server" CssClass="form-control" placeholder="Zip Code" />
                <asp:RequiredFieldValidator ID="rfvZipCode" runat="server" ControlToValidate="txtZipCode" ErrorMessage="Zip code is required." CssClass="text-danger" />
                <asp:RegularExpressionValidator ID="revZipCode" runat="server" ControlToValidate="txtZipCode"
                    ValidationExpression="^\d{6}$" ErrorMessage="Zip code must be 6 digits." CssClass="text-danger" />
            </div>
        </div>

        <h3>Extra Data</h3>
        <div class="form-group">
            <asp:CheckBoxList ID="chkOptionalData" runat="server" CssClass="form-check">
                <asp:ListItem>New Products</asp:ListItem>
                <asp:ListItem>Special Offers</asp:ListItem>
                <asp:ListItem>New Editions</asp:ListItem>
                <asp:ListItem>Local Events</asp:ListItem>
            </asp:CheckBoxList>
        </div>

        <!-- Buttons -->
        <div class="form-group">
            <asp:Button ID="btnPlaceOrder" runat="server" CssClass="btn btn-success" Text="Place Order" OnClick="btnPlaceOrder_Click" />
            <asp:Button ID="btnGoBackToCart" runat="server" CssClass="btn btn-warning ml-2" Text="Go Back to Cart" OnClick="btnGoBackToCart_Click" />
        </div>

        <!-- Validation -->
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="text-danger" HeaderText="Please correct the following errors:" />
    </div>
</asp:Content>
