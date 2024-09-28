<%@ Page Title="Products" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="Gaurav_BookStore.Products" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-6 offset-md-3 text-center">
                <h2 class="mb-4">Select Your Book</h2>
                
                <!-- Dropdown -->
                <div class="form-group">
                    <label for="ddlProducts" class="h5">Please select a book:</label>
                    <asp:DropDownList ID="ddlProducts" DataSourceID="SqlDataSource1" DataTextField="Title" AutoPostBack="True" DataValueField="BookID" OnSelectedIndexChanged="ddlProducts_SelectedIndexChanged" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>

                <!-- Book Information  -->
                <div class="mt-4 p-3 bg-light border rounded">
                    <h3>Book Details</h3>
                    <p><strong>Author:</strong> <asp:Label ID="lblAuthor" runat="server" /></p>
                    <p><strong>Price:</strong> <asp:Label ID="lblPrice" runat="server" /></p>
                    <p><strong>Genre:</strong> <asp:Label ID="lblGenre" runat="server" /></p>
                </div>

                <!-- Book Image -->
                <div class="mt-4">
                    <h3>Book Image</h3>
                    <div class="image-container" style="text-align: center;">
                        <asp:Image ID="imgBook" runat="server" CssClass="img-thumbnail" Width="200px" Height="250px" />
                    </div>
                </div>

                <!-- Quantity -->
                <div class="form-group mt-4">
                    <label for="txtQuantity" class="h5">Quantity:</label>
                    <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control d-inline-block" Width="80px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvQuantity" runat="server" ControlToValidate="txtQuantity" ErrorMessage="Quantity is required!" ForeColor="Red" Display="Dynamic" />
                </div>

                <!-- Cart Button -->
                <div class="mt-3">
                    <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart" CssClass="btn btn-primary btn-lg" OnClick="btnAddToCart_Click" />
                </div>

                <!-- Go to Cart -->
                <div class="mt-3">
                    <asp:Button ID="btnGoToCart" runat="server" Text="Go to Cart" CssClass="btn btn-secondary btn-lg" OnClick="btnGoToCart_Click" />
                </div>

                <!-- error messages -->
                <div class="mt-3">
                    <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red" Visible="False" CssClass="text-danger"></asp:Label>
                </div>
            </div>
        </div>
    </div>

    <!-- SQL DataSource for fetching book data using query -->
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT BookID, Title, Author, Price, GenreID FROM Books">
    </asp:SqlDataSource>
</asp:Content>
