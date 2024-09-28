<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Gaurav_BookStore.Home" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container mt-5 text-center">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <h1 class="display-4">Welcome to Our Book Store</h1>
                <p class="lead mt-4">Explore a wide variety of books and start shopping with us today!</p>
                <a href="Products.aspx" class="btn btn-primary btn-lg mt-3">Browse Products</a>
            </div>
        </div>
    </div>

</asp:Content>
