

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Message.aspx.cs" Inherits="Gaurav_BookStore.Message" %>
<!DOCTYPE html>
<!-- Message.aspx -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Order Successful</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f8f9fa;
        }
        .card {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        .btn-custom {
            background-color: #007bff;
            border-color: #007bff;
            color: white;
        }
        .btn-custom:hover {
            background-color: #0056b3;
            border-color: #004085;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container d-flex align-items-center justify-content-center" style="height: 100vh;">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card p-4 text-center">
                        <div class="card-body">
                            <div class="mb-4">
                                <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="green" class="bi bi-check-circle" viewBox="0 0 16 16">
                                    <path d="M8 0a8 8 0 1 0 16 0A8 8 0 0 0 8 0zM7.5 12.5 4 9l.707-.707L7.5 11.086l4.793-4.793L13 7.5l-5.5 5.5z"/>
                                </svg>
                            </div>
                            <h2 class="text-success">Thank You for Your Order!</h2>
                            <p class="lead mt-2">Your order has been placed successfully.</p>
                            <asp:Button ID="btnContinueShopping" runat="server" CssClass="btn btn-custom btn-lg mt-4" Text="Continue Shopping" OnClick="btnContinueShopping_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
