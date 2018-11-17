<%@ Page Language="C#" AutoEventWireup="true" CodeFile="discs.aspx.cs" Inherits="discs"
    MasterPageFile="~/MasterPage.Master" %>

<asp:Content ID="Content" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <h1>User "tester" has permission to edit, delete, or remove discs from the database.</h1>
    <form runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="InventoryID"
            CssClass="table table-bordered table-condensed" DataSourceID="SqlDataSource"
            OnRowDeleted="grdInventory_RowDeleted" OnRowUpdated="grdInventory_RowUpdated">
            <Columns>
                
               
                <asp:TemplateField HeaderText="Inventory ID" ControlStyle-CssClass="">
                            <ItemTemplate>
                                <asp:Label ID="lblGridID" runat="server" 
                                    Text='<%# Eval("InventoryID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                <asp:TemplateField HeaderText="Inventory Name">
                            <EditItemTemplate>
                                <div class="col-xs-11 col-edit">
                                    <asp:TextBox ID="txtGridName" runat="server" 
                                        MaxLength="15" CssClass="form-control"  
                                        Text='<%# Bind("InventoryName") %>'></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvGridName" runat="server" 
                                    ControlToValidate="txtGridName" ValidationGroup="Edit" 
                                    ErrorMessage="Inventory Name is a required field" Text="*"
                                    CssClass="text-danger"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblGridName" runat="server" 
                                    Text='<%# Bind("InventoryName") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle CssClass="col-xs-3" />
                        </asp:TemplateField>

                <asp:TemplateField HeaderText="Release Date">
                            <EditItemTemplate>
                                <div class="col-xs-11 col-edit">
                                    <asp:TextBox ID="txtGridRelease_date" runat="server" 
                                        MaxLength="15" CssClass="form-control"  
                                        Text='<%# Bind("Release_date") %>'></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvGridRelease_date" runat="server" 
                                    ControlToValidate="txtGridRelease_date" ValidationGroup="Edit" 
                                    ErrorMessage="Release Date is a required field" Text="*"
                                    CssClass="text-danger"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                    ErrorMessage="Use format: MM/DD/YYYY" ControlToValidate="txtGridRelease_date" Operator="DataTypeCheck">
                                </asp:CompareValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblGridRelease_date" runat="server" 
                                    Text='<%# Bind("Release_date") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle CssClass="col-xs-3" />
                        </asp:TemplateField>

                <asp:TemplateField HeaderText="Inventory Type">
                            <ItemTemplate>
                                <asp:Label ID="lblGridInventory_type" runat="server" 
                                    Text='<%# Eval("Inventory_type") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle CssClass="col-xs-3" />
                        </asp:TemplateField>

                <asp:TemplateField HeaderText="Status Code">
                            <ItemTemplate>
                                <asp:Label ID="lblGridStatus_code" runat="server" 
                                    Text='<%# Eval("Status_code") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle CssClass="col-xs-3" />
                        </asp:TemplateField>
                
                <asp:TemplateField HeaderText="Genre ID">
                            <ItemTemplate>
                                <asp:Label ID="lblGridGenreID" runat="server" 
                                    Text='<%# Eval("GenreID") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle CssClass="col-xs-3" />
                        </asp:TemplateField>

                <asp:CommandField ButtonType="Button" ShowEditButton="True" ValidationGroup="Edit"/>
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />

            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource" runat="server"
            ConnectionString="<%$ ConnectionStrings:disk_inventoryConnectionString %>" 
            DeleteCommand="SPDeleteDisc" DeleteCommandType="StoredProcedure" 
            InsertCommand="SPInsertDisc" InsertCommandType="StoredProcedure" 
            SelectCommand="SELECT InventoryID, InventoryName, Release_date, Inventory_type, Status_code, GenreID FROM Inventory" 
            UpdateCommand="SPUpdateDisc" UpdateCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="InventoryID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="InventoryName" Type="String" />
                <asp:Parameter Name="Inventory_type" Type="Int16" />
                <asp:Parameter Name="Status_code" Type="Int16" />
                <asp:Parameter Name="GenreID" Type="Int16" />
                <asp:Parameter DbType="Date" Name="Release_date" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="InventoryName" Type="String" />
                <asp:Parameter DbType="Date" Name="Release_Date" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="Edit"/>
                <asp:DetailsView ID="dvInventory" runat="server" CssClass="table table-bordered table-condensed" 
                    AutoGenerateRows="False" DataKeyNames="InventoryID" DataSourceID="SqlDataSource"
                    defaultMode="Insert" OnItemInserted="dvInventory_ItemInserted">
                    <HeaderTemplate><p>To create a new Disc, enter the information 
                    and click Insert</p></HeaderTemplate>
                    <Fields>
                        <asp:TemplateField>
                            <InsertItemTemplate>
                                <label for="Disctxt">Disc Name:</label>
                                <asp:RequiredFieldValidator ID="rfvDisc" runat="server" Display="Dynamic" 
                                    ControlToValidate="Disctxt" CssClass="text-danger"
                                    ErrorMessage="Disc Name is a required field." Text="*"
                                    ValidationGroup="insertVal">
                                </asp:RequiredFieldValidator>
                                <asp:TextBox ID="Disctxt" runat="server" 
                                    Text='<%# Bind("InventoryName") %>' CssClass="form-control" />  
                            </InsertItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField>
                            <InsertItemTemplate>
                                <label for="Release_datetxt">Release_date:</label>
                                <asp:RequiredFieldValidator ID="rfvRelease_date" runat="server" Display="Dynamic" 
                                    ControlToValidate="Release_datetxt" CssClass="text-danger"
                                    ErrorMessage="Release Date is a required field." Text="*"
                                    ValidationGroup="insertVal">
                                </asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidator2" runat="server" 
                                    ErrorMessage="Please enter a date in this format: MM/DD/YYYY"
                                    ControlToValidate="Release_datetxt" Type="Date" ValidationGroup="insertVal" 
                                    Operator="DataTypeCheck"></asp:CompareValidator>
                                <asp:TextBox ID="Release_datetxt" runat="server" 
                                    Text='<%# Bind("Release_date") %>' CssClass="form-control" />  
                                </InsertItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField>
                            <InsertItemTemplate>
                                <label for="Inventory_typetxt">Inventory_type:</label>
                                <asp:RequiredFieldValidator ID="rfvInventory_type" runat="server" Display="Dynamic" 
                                    ControlToValidate="Inventory_typetxt" CssClass="text-danger"
                                    ErrorMessage="Inventory Type is a required field." Text="*"
                                    ValidationGroup="insertVal">
                                </asp:RequiredFieldValidator>
                                <asp:TextBox ID="Inventory_typetxt" runat="server" 
                                    Text='<%# Bind("Inventory_type") %>' CssClass="form-control" />  
                            </InsertItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField>
                            <InsertItemTemplate>
                                <label for="Status_codetxt">Status Code:</label>
                                <asp:RequiredFieldValidator ID="rfvStatus_code" runat="server" Display="Dynamic" 
                                    ControlToValidate="Status_codetxt" CssClass="text-danger"
                                    ErrorMessage="Status Code is a required field." Text="*"
                                    ValidationGroup="insertVal">
                                </asp:RequiredFieldValidator>
                                <asp:TextBox ID="Status_codetxt" runat="server" 
                                    Text='<%# Bind("Status_code") %>' CssClass="form-control" />  
                            </InsertItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField>
                            <InsertItemTemplate>
                                <label for="GenreIDtxt">Genre ID:</label>
                                <asp:RequiredFieldValidator ID="rfvGenreID" runat="server" Display="Dynamic" 
                                    ControlToValidate="GenreIDtxt" CssClass="text-danger"
                                    ErrorMessage="Genre ID is a required field." Text="*"
                                    ValidationGroup="insertVal">
                                </asp:RequiredFieldValidator>
                                <asp:TextBox ID="GenreIDtxt" runat="server" 
                                    Text='<%# Bind("GenreID") %>' CssClass="form-control" />  
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowInsertButton="True" ValidationGroup="insertVal"/>
                    </Fields>
                    <HeaderStyle CssClass="bg-halloween"/>
                </asp:DetailsView>
                <asp:ValidationSummary ID="ValidationSummary2" runat="server" ValidationGroup="insertVal"
                    CssClass="text-danger"/>
          
                <%-- message label --%>
                <div class="form-group">
                    <div class="col-sm-offset-1 col-sm-11">
                        <asp:Label ID="lblMessage" runat="server" CssClass="text-danger"></asp:Label>
                    </div>
                </div>
        </form>
     </asp:Content>
