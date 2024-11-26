<%@ Page Title="Products" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="Gaurav_BookStore.Products" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Products.aspx -->
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <h2 class="text-center mb-4 text-primary">Browse and Select Your Favorite Book</h2>
                <h4 class="text-center mb-3">
                    <asp:Label ID="lblWelcome" runat="server" CssClass="text-success"></asp:Label>
                </h4>

                <!-- Dropdown to Select a Book -->
                <div class="form-group">
                    <label for="ddlProducts" class="h5 text-secondary">Select a Book:</label>
                    <asp:DropDownList 
                        ID="ddlProducts" 
                        runat="server" 
                        DataSourceID="SqlDataSource1" 
                        DataTextField="Title" 
                        DataValueField="BookID" 
                        AutoPostBack="True" 
                        CssClass="form-control" 
                        OnSelectedIndexChanged="ddlProducts_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>

                <!-- Book Details Section -->
                <div class="mt-4 p-4 bg-light border rounded shadow">
                    <h3 class="text-center text-info">Book Details</h3>
                    <p><strong>Author:</strong> <asp:Label ID="lblAuthor" runat="server" CssClass="text-dark" /></p>
                    <p><strong>Price:</strong> <asp:Label ID="lblPrice" runat="server" CssClass="text-dark" /></p>
                    <p><strong>Genre:</strong> <asp:Label ID="lblGenre" runat="server" CssClass="text-dark" /></p>
                </div>

                <!-- Book Image Section -->
                <div class="mt-4">
                    <h3 class="text-center text-info">Book Image</h3>
                    <div class="d-flex justify-content-center">
                        <asp:Image ID="imgBook" runat="server" CssClass="img-thumbnail" Width="200px" Height="250px" />
                    </div>
                </div>

                <!-- Quantity Section -->
                <div class="form-group mt-4">
                    <label for="txtQuantity" class="h5 text-secondary">Quantity:</label>
                    <asp:TextBox 
                        ID="txtQuantity" 
                        runat="server" 
                        CssClass="form-control d-inline-block" 
                        Width="80px" 
                        Text="0">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator 
                        ID="rfvQuantity" 
                        runat="server" 
                        ControlToValidate="txtQuantity" 
                        ErrorMessage="Quantity is required!" 
                        ForeColor="Red" 
                        Display="Dynamic" />
                </div>

                <!-- Action Buttons -->
                <div class="mt-4 text-center">
                    <asp:Button 
                        ID="btnAddToCart" 
                        runat="server" 
                        Text="Add to Cart" 
                        CssClass="btn btn-success btn-lg px-4 py-2 shadow" 
                        OnClick="btnAddToCart_Click" />

                    <asp:Button 
                        ID="btnGoToCart" 
                        runat="server" 
                        Text="Go to Cart" 
                        CssClass="btn btn-secondary btn-lg px-4 py-2 shadow ms-3" 
                        OnClick="btnGoToCart_Click" />
                </div>

                <!-- Error Message -->
                <div class="mt-3 text-center">
                    <asp:Label ID="lblErrorMessage" runat="server" Visible="False" CssClass="text-danger h6"></asp:Label>
                </div>
            </div>
        </div>
    </div>

    <!-- SQL DataSource for fetching book data -->
    <asp:SqlDataSource 
        ID="SqlDataSource1" 
        runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT BookID, Title, Author, Price, GenreID FROM Books">
    </asp:SqlDataSource>
</asp:Content>
