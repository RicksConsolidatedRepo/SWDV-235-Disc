<%@ Page Language="C#" AutoEventWireup="true" CodeFile="artists.aspx.cs" Inherits="artists"
 MasterPageFile="~/MasterPage.Master" %>

<asp:Content ID="Content" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <h1>User "tester" has permission to edit, delete, or remove artists from the database.</h1>
    <form runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ArtistID"
            CssClass="table table-bordered table-condensed" DataSourceID="SqlDataSource"
            OnRowDeleted="grdArtist_RowDeleted" OnRowUpdated="grdArtist_RowUpdated">
            <Columns>
                <asp:TemplateField HeaderText="ID">
                    <ItemTemplate>
                                <asp:Label ID="lblGridID" runat="server" 
                                    Text='<%# Eval("ArtistID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                <asp:TemplateField HeaderText="First Name">
                            <EditItemTemplate>
                                <asp:RequiredFieldValidator ID="rfvFname" runat="server" Display="Dynamic" 
                                    ControlToValidate="Fnametxt" CssClass="text-danger"
                                    ErrorMessage="First Name is a required field." Text="*"
                                    ValidationGroup="insertVal">
                                </asp:RequiredFieldValidator>
                                <asp:TextBox ID="Fnametxt" runat="server" 
                                    Text='<%# Bind("Fname") %>' CssClass="form-control" />  
                            </EditItemTemplate>
                    <ItemTemplate>
                                <asp:Label ID="lblGridFname" runat="server" 
                                    Text='<%# Bind("Fname") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        
                        <asp:TemplateField HeaderText="Last Name">
                            <EditItemTemplate>
                                <asp:RequiredFieldValidator ID="rfvLname" runat="server" Display="Dynamic" 
                                    ControlToValidate="Lnametxt" CssClass="text-danger"
                                    ErrorMessage="Last Name is a required field." Text="*"
                                    ValidationGroup="insertVal">
                                </asp:RequiredFieldValidator>
                                <asp:TextBox ID="Lnametxt" runat="server" 
                                    Text='<%# Bind("Lname") %>' CssClass="form-control" />  
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblGridLname" runat="server" 
                                    Text='<%# Bind("Lname") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Group Name">
                            <EditItemTemplate>
                                <asp:RequiredFieldValidator ID="rfvGroupName" runat="server" Display="Dynamic" 
                                    ControlToValidate="GroupNametxt" CssClass="text-danger"
                                    ErrorMessage="Artist Group Name is a required field." Text="*"
                                    ValidationGroup="insertVal">
                                </asp:RequiredFieldValidator>
                                <asp:TextBox ID="GroupNametxt" runat="server" 
                                    Text='<%# Bind("GroupName") %>' CssClass="form-control" />  
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblGridGroupName" runat="server" 
                                    Text='<%# Bind("GroupName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                       
                        <asp:TemplateField HeaderText="Artist Type">
                            <EditItemTemplate>
                                <asp:RequiredFieldValidator ID="rfvArtist_typeID" runat="server" Display="Dynamic" 
                                    ControlToValidate="Artist_typeIDtxt" CssClass="text-danger"
                                    ErrorMessage="Artist Type is a required field." Text="*"
                                    ValidationGroup="insertVal">
                                </asp:RequiredFieldValidator>
                                <asp:TextBox ID="Artist_typeIDtxt" runat="server" 
                                    Text='<%# Bind("Artist_typeID") %>' CssClass="form-control" />  
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblGridArtist_typeID" runat="server" 
                                    Text='<%# Bind("Artist_typeID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                <asp:CommandField ButtonType="Button" ShowEditButton="True" />
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />

            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:disk_inventoryConnectionString %>" 
            DeleteCommand="SPDeleteArtist" DeleteCommandType="StoredProcedure" 
            InsertCommand="SPInsertArtist" InsertCommandType="StoredProcedure" 
            SelectCommand="SELECT ArtistID, Fname, Lname, GroupName, Artist_typeID FROM Artist" 
            UpdateCommand="SPUpdateArtist" UpdateCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="ArtistID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Fname" Type="String" />
                <asp:Parameter Name="Lname" Type="String" />
                <asp:Parameter Name="GroupName" Type="String" />
                <asp:Parameter Name="Artist_typeID" Type="int16" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Fname" Type="String" />
                <asp:Parameter Name="Lname" Type="String" />
                <asp:Parameter Name="GroupName" Type="String" />
                <asp:Parameter Name="Artist_typeID" Type="int16" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="Edit"/>
                <asp:DetailsView ID="dvInventory" runat="server" CssClass="table table-bordered table-condensed" 
                    AutoGenerateRows="False" DataKeyNames="ArtistID" DataSourceID="SqlDataSource"
                    defaultMode="Insert" OnItemInserted="dvArtist_ItemInserted">
                    <HeaderTemplate><p>To create a new Artist, enter the information 
                    and click Insert</p></HeaderTemplate>
                    <Fields>
                        
                        <asp:TemplateField>
                            <InsertItemTemplate>
                                <label for="Fnametxt">Artist First Name:</label>
                                <asp:RequiredFieldValidator ID="rfvFname" runat="server" Display="Dynamic" 
                                    ControlToValidate="Fnametxt" CssClass="text-danger"
                                    ErrorMessage="First Name is a required field." Text="*"
                                    ValidationGroup="insertVal">
                                </asp:RequiredFieldValidator>
                                <asp:TextBox ID="Fnametxt" runat="server" 
                                    Text='<%# Bind("Fname") %>' CssClass="form-control" />  
                            </InsertItemTemplate>
                        </asp:TemplateField>

                        
                        <asp:TemplateField>
                            <InsertItemTemplate>
                                <label for="Lnametxt">Artist Last Name:</label>
                                <asp:RequiredFieldValidator ID="rfvLname" runat="server" Display="Dynamic" 
                                    ControlToValidate="Lnametxt" CssClass="text-danger"
                                    ErrorMessage="Last Name is a required field." Text="*"
                                    ValidationGroup="insertVal">
                                </asp:RequiredFieldValidator>
                                <asp:TextBox ID="Lnametxt" runat="server" 
                                    Text='<%# Bind("Lname") %>' CssClass="form-control" />  
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <InsertItemTemplate>
                                <label for="GroupNametxt">Artist Group Name:</label>
                                <asp:RequiredFieldValidator ID="rfvGroupName" runat="server" Display="Dynamic" 
                                    ControlToValidate="GroupNametxt" CssClass="text-danger"
                                    ErrorMessage="Artist Group Name is a required field." Text="*"
                                    ValidationGroup="insertVal">
                                </asp:RequiredFieldValidator>
                                <asp:TextBox ID="GroupNametxt" runat="server" 
                                    Text='<%# Bind("GroupName") %>' CssClass="form-control" />  
                            </InsertItemTemplate>
                        </asp:TemplateField>
                       
                        <asp:TemplateField>
                            <InsertItemTemplate>
                                <label for="Artist_typeIDtxt">Artist Type:</label>
                                <asp:TextBox ID="Artist_typeIDtxt" runat="server" 
                                    Text='<%# Bind("Artist_typeID") %>' CssClass="form-control" />
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowInsertButton="True" ValidationGroup="insertVal"/>
                    </Fields>
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
