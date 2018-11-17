<%@ Page Language="C#" AutoEventWireup="true" CodeFile="blu_inventory.aspx.cs" Inherits="blu_inventory"
 MasterPageFile="~/MasterPage.Master" %>

<asp:Content ID="Content" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
        <form id="form1" runat="server">
        <div>
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="InventoryID" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem">
                <AlternatingItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            <asp:Label ID="InventoryIDLabel" runat="server" Text='<%# Eval("InventoryID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="InventoryNameLabel" runat="server" Text='<%# Eval("InventoryName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Release_dateLabel" runat="server" Text='<%# Eval("Release_date") %>' />
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                        <td>
                            <asp:Label ID="InventoryIDLabel1" runat="server" Text='<%# Eval("InventoryID") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="InventoryNameTextBox" runat="server" Text='<%# Bind("InventoryName") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="Release_dateTextBox" runat="server" Text='<%# Bind("Release_date") %>' />
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        </td>
                        <td>
                            <asp:TextBox ID="InventoryIDTextBox" runat="server" Text='<%# Bind("InventoryID") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="InventoryNameTextBox" runat="server" Text='<%# Bind("InventoryName") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="Release_dateTextBox" runat="server" Text='<%# Bind("Release_date") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            <asp:Label ID="InventoryIDLabel" runat="server" Text='<%# Eval("InventoryID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="InventoryNameLabel" runat="server" Text='<%# Eval("InventoryName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Release_dateLabel" runat="server" Text='<%# Eval("Release_date") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                    <tr runat="server" style="">
                                        <th runat="server"></th>
                                        <th runat="server">InventoryID</th>
                                        <th runat="server">InventoryName</th>
                                        <th runat="server">Release_date</th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="">
                                <asp:DataPager ID="DataPager1" runat="server">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            <asp:Label ID="InventoryIDLabel" runat="server" Text='<%# Eval("InventoryID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="InventoryNameLabel" runat="server" Text='<%# Eval("InventoryName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Release_dateLabel" runat="server" Text='<%# Eval("Release_date") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:HalloweenConnectionString %>" 
                DeleteCommand="DELETE FROM [Inventory] WHERE [InventoryID] = @InventoryID" 
                InsertCommand="INSERT INTO [Inventory] ([InventoryID], [InventoryName], [Release_date]) VALUES (@InventoryID, @InventoryName, @Release_date)" 
                SelectCommand="SELECT * FROM [Inventory]" 
                UpdateCommand="UPDATE [Inventory] SET [InventoryName] = @InventoryName, [Release_date] = @Release_date WHERE [InventoryID] = @InventoryID">
                <DeleteParameters>
                    <asp:Parameter Name="InventoryID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="InventoryID" Type="String" />
                    <asp:Parameter Name="InventoryName" Type="String" />
                    <asp:Parameter Name="Release_date" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="InventoryName" Type="String" />
                    <asp:Parameter Name="Release_date" Type="String" />
                    <asp:Parameter Name="InventoryID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
     </asp:Content>
