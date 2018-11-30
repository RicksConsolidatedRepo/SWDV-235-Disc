<%@ Page Language="C#" AutoEventWireup="true" CodeFile="disc_history.aspx.cs" Inherits="disc_history"
	MasterPageFile="~/MasterPage.Master" %>

<%--page created on 11/30/2018 for Project 4
Displays the borrowed and returned history for discs--%>

<asp:Content ID="Content" ContentPlaceHolderID="mainContentPlaceholder" runat="server">
    <form id="form1" runat="server">
    <h1>History of all borrowed discs.</h1>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource"
            CssClass="table table-bordered table-condensed" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="InventoryName" HeaderText="Inventory Name" SortExpression="InventoryName" />
                <asp:BoundField DataField="Fname" HeaderText="Borrower First Name" SortExpression="Fname" />
                <asp:BoundField DataField="Borrowed_date" HeaderText="Borrowed Date" SortExpression="Borrowed_date" />
                <asp:BoundField DataField="Returned_date" HeaderText="Returned Date" SortExpression="Returned_date" />
            </Columns>
        </asp:GridView> 
        <asp:SqlDataSource ID="SqlDataSource" runat="server" 
			ConnectionString="<%$ ConnectionStrings:disk_inventoryConnectionString %>" 
			SelectCommand="SELECT InventoryName, Fname, Borrowed_date, Returned_date
FROM Borrower
	JOIN DiscHasBorrower ON Borrower.BorrowerID = DiscHasBorrower.BorrowerID
	JOIN Inventory ON DiscHasBorrower.InventoryID = Inventory.InventoryID
ORDER BY InventoryName, Returned_date">
        </asp:SqlDataSource>
    </form>
</asp:content>
