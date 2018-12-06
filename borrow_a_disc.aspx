<%@ Page Language="C#" AutoEventWireup="true" CodeFile="borrow_a_disc.aspx.cs" Inherits="borrow_a_disc"
MasterPageFile="~/MasterPage.Master" %>

<%--page created on 11/30/2018
allows selection of a disc, borrower, borrowed date, return date
updates database on DiscHasBorrower table--%>

<asp:Content ID="Content" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
		<form runat="server">
    <br />
    <asp:DetailsView ID="dvBorrow" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSourceInventory"
        CssClass="table table-bordered table-condensed" DataKeyNames="InventoryID"
        defaultMode="Insert" OnItemInserted="dvBorrow_ItemInserted">
        <HeaderTemplate><p>To check out a disk, select the information and click insert.</p></HeaderTemplate>
        <Fields>
            <asp:TemplateField>
                <InsertItemTemplate>
                    <label for="Inventoryddl">CD:</label>
                        <asp:DropDownList ID="Inventoryddl" runat="server" CssClass="form-control" DataSourceID="sqlDataSourceInventory" 
                            DataTextField="InventoryName" DataValueField="InventoryID" SelectedValue='<%# Bind("InventoryID") %>'>
                        </asp:DropDownList>
                 </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <InsertItemTemplate>
                    <label for="Borrowerddl">Borrower:</label>
                        <asp:DropDownList ID="Borrowerddl" runat="server" CssClass="form-control" DataSourceID="sqlDataSourceBorrower" 
                            DataTextField="full_name" DataValueField="BorrowerID" SelectedValue='<%# Bind("BorrowerID") %>'>
                        </asp:DropDownList>
                 </InsertItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField>
                <InsertItemTemplate>
                    <label for="BDatetxt">Date:</label>
                    <asp:TextBox ID="BDatetxt" runat="server" CssClass="form-control" TextMode="Date" 
                        Text='<%# Bind("Borrowed_date") %>'></asp:TextBox>  
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="Please enter a date" ControlToValidate="BDatetxt" 
                        CssClass="text-danger"></asp:RequiredFieldValidator>
                 </InsertItemTemplate>
            </asp:TemplateField>

			    <asp:TemplateField>
                <InsertItemTemplate>
                    <label for="RDatetxt">Date:</label>
                    <asp:TextBox ID="RDatetxt" runat="server" CssClass="form-control" TextMode="Date" 
                        Text='<%# Bind("Returned_date") %>'></asp:TextBox>  
                   <%-- Commented out so that return date can be null
					   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="Please enter a date" ControlToValidate="RDatetxt" 
                        CssClass="text-danger"></asp:RequiredFieldValidator>--%>
                 </InsertItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowInsertButton="True"/>
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSourceBorrower" runat="server" 
		ConnectionString="<%$ ConnectionStrings:disk_inventoryConnectionString3 %>" 
		SelectCommand="SELECT Concat([Fname], ' ' , [Lname]) AS full_name, [BorrowerID] FROM [Borrower]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceInventory" runat="server"
		ConnectionString="<%$ ConnectionStrings:disk_inventoryConnectionString2 %>"
		SelectCommand="SELECT [InventoryName], [InventoryID] FROM [Inventory] WHERE Status_code = '2'"
		InsertCommand="INSERT INTO [DiscHasBorrower] ([InventoryID], [BorrowerID], [Borrowed_date], [Returned_date])
		VALUES (@InventoryID, @BorrowerID, @Borrowed_date, @Returned_date)" >
        <InsertParameters>
            <asp:Parameter Name="InventoryID" Type="Int32" />
            <asp:Parameter Name="BorrowerID" Type="Int32" />
            <asp:Parameter Name="Borrowed_date" Type="DateTime" />
			<asp:Parameter Name="Returned_date" Type="DateTime" />
        </InsertParameters>
    </asp:SqlDataSource>
    <br />
    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>

    </form>
     </asp:Content>
