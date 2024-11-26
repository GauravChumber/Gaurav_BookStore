<%@ Page Title="Admin" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Gaurav_BookStore.Admin" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        /* Flex row for books display */
        .book-details {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 8px;
            margin-bottom: 10px;
            background-color: #f8f9fa;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .book-details p {
            margin: 0;
        }
        .book-details-buttons {
            display: flex;
            gap: 10px;
        }

        /* Button styles */
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            color: #fff;
            padding: 5px 10px;
            border-radius: 4px;
            transition: all 0.3s ease;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #004085;
        }
        .btn-success {
            background-color: #28a745;
            border-color: #28a745;
            color: #fff;
            padding: 5px 10px;
            border-radius: 4px;
            transition: all 0.3s ease;
        }
        .btn-success:hover {
            background-color: #218838;
            border-color: #1e7e34;
        }
        .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
            color: #fff;
            padding: 5px 10px;
            border-radius: 4px;
            transition: all 0.3s ease;
        }
        .btn-secondary:hover {
            background-color: #5a6268;
            border-color: #545b62;
        }
    </style>

    <div class="container mt-5">
        <h2>Admin Panel</h2>

        <!-- Dropdown to Display Genres -->
        <div class="form-group">
            <label for="ddlGenres">Select Genre:</label>
            <asp:DropDownList ID="ddlGenres" runat="server" DataSourceID="SqlDataSourceGenres" DataTextField="GenreName" DataValueField="GenreID" AutoPostBack="True" CssClass="form-control">
                <asp:ListItem Text="Select the genre" Value="" Selected="True"></asp:ListItem>
            </asp:DropDownList>
        </div>

        <!-- DataList to Display Books of Selected Genre -->
        <asp:DataList ID="DataListBooks" runat="server" DataSourceID="SqlDataSourceBooks" RepeatDirection="Vertical" CssClass="list-group" OnEditCommand="DataListBooks_EditCommand" OnCancelCommand="DataListBooks_CancelCommand" OnUpdateCommand="DataListBooks_UpdateCommand">
            <ItemTemplate>
                <div class="book-details">
                    <div>
                        <p><strong>ID:</strong> <%# Eval("BookID") %></p>
                        <p><strong>Title:</strong> <%# Eval("Title") %></p>
                        <p><strong>Price:</strong> <%# Eval("Price", "{0:C}") %></p>
                    </div>
                    <div class="book-details-buttons">
                        <asp:Button ID="btnEdit" runat="server" CommandName="Edit" CommandArgument='<%# Eval("BookID") %>' Text="Edit" CssClass="btn btn-primary btn-sm" />
                    </div>
                </div>
            </ItemTemplate>
            <EditItemTemplate>
                <div class="book-details">
                    <div>
                        <p><strong>ID:</strong> <%# Eval("BookID") %></p>
                        <p><strong>Title:</strong>
                            <asp:TextBox ID="txtTitle" runat="server" Text='<%# Bind("Title") %>' CssClass="form-control" />
                        </p>
                        <p><strong>Price:</strong>
                            <asp:TextBox ID="txtPrice" runat="server" Text='<%# Bind("Price") %>' CssClass="form-control" />
                        </p>
                    </div>
                    <div class="book-details-buttons">
                        <asp:Button ID="btnUpdate" runat="server" CommandName="Update" CommandArgument='<%# Eval("BookID") %>' Text="Update" CssClass="btn btn-success btn-sm" />
                        <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary btn-sm" />
                    </div>
                </div>
            </EditItemTemplate>
        </asp:DataList>

        <!-- SQL DataSource for Genres -->
        <asp:SqlDataSource ID="SqlDataSourceGenres" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT GenreID, GenreName FROM Genre"></asp:SqlDataSource>

        <!-- SQL DataSource for Books -->
        <asp:SqlDataSource ID="SqlDataSourceBooks" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT BookID, Title, Price, GenreID FROM Books WHERE GenreID = @GenreID"
            InsertCommand="INSERT INTO Books (Title, Price, GenreID) VALUES (@Title, @Price, @GenreID)"
            UpdateCommand="UPDATE Books SET Title = @Title, Price = @Price, GenreID = @GenreID WHERE BookID = @BookID"
            DeleteCommand="DELETE FROM Books WHERE BookID = @BookID">
            <SelectParameters>
                <asp:ControlParameter Name="GenreID" ControlID="ddlGenres" PropertyName="SelectedValue" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="Price" Type="Decimal" />
                <asp:Parameter Name="GenreID" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="Price" Type="Decimal" />
                <asp:Parameter Name="GenreID" Type="Int32" />
                <asp:Parameter Name="BookID" Type="Int32" />
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="BookID" Type="Int32" />
            </DeleteParameters>
        </asp:SqlDataSource>

        <hr />

        <!-- Genre Maintenance Section -->
        <h3>Genre Maintenance</h3>
        <asp:GridView ID="GridViewGenreMaintenance" runat="server" AutoGenerateColumns="False" DataKeyNames="GenreID" DataSourceID="SqlDataSourceGenreMaintenance" CssClass="table table-bordered mt-4">
            <Columns>
                <asp:BoundField DataField="GenreID" HeaderText="Genre ID" ReadOnly="True" />
                <asp:BoundField DataField="GenreName" HeaderText="Genre Name" />
                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>

        <!-- SQL DataSource for Genre Maintenance -->
        <asp:SqlDataSource ID="SqlDataSourceGenreMaintenance" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT GenreID, GenreName FROM Genre"
            UpdateCommand="UPDATE Genre SET GenreName = @GenreName WHERE GenreID = @GenreID"
            DeleteCommand="DELETE FROM Genre WHERE GenreID = @GenreID"
            OnUpdated="SqlDataSourceGenreMaintenance_Updated"
            OnDeleted="SqlDataSourceGenreMaintenance_Deleted">
            <UpdateParameters>
                <asp:Parameter Name="GenreName" Type="String" />
                <asp:Parameter Name="GenreID" Type="Int32" />
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="GenreID" Type="Int32" />
            </DeleteParameters>
        </asp:SqlDataSource>

        <!-- Form to Add New Genre -->
        <div class="form-group">
            <label for="txtNewGenre">Add New Genre:</label>
            <asp:TextBox ID="txtNewGenre" runat="server" CssClass="form-control" Placeholder="Enter genre name"></asp:TextBox>
            <asp:Button ID="btnAddGenre" runat="server" Text="Add Genre" CssClass="btn btn-primary mt-2" OnClick="btnAddGenre_Click" />
        </div>
    </div>
</asp:Content>
