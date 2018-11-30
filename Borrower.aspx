<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Borrower.aspx.cs" Inherits="Borrower" 
    MasterPageFile="~/MasterPage.Master" %>

<%--Project 3 update, insert, and delete borrowers table--%>

<asp:Content ID="Content" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
     <h1>User "tester" has permission to edit, delete, or remove borrowers from the database.</h1>
     <form id="form1" runat="server" class="form-horizontal">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="BorrowerID"
            CssClass="table table-bordered table-condensed" DataSourceID="SqlDataSource"
            OnRowDeleted="grdBorrower_RowDeleted" OnRowUpdated="grdBorrower_RowUpdated">
            <Columns>
                
                <asp:TemplateField HeaderText="ID">
                    <ItemTemplate>
                        <asp:Label ID="lblID" runat="server" Text='<%# Eval("BorrowerID") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="First Name: ">
                            <EditItemTemplate>
                                <div class="col-xs-11 col-edit">
                                    <asp:TextBox ID="txtGridFname" runat="server" 
                                        MaxLength="15" CssClass="form-control"  
                                        Text='<%# Bind("Fname") %>'></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvGridFname" runat="server" 
                                    ControlToValidate="txtGridFname" ValidationGroup="Edit" 
                                    ErrorMessage="First Name is a required field" Text="*"
                                    CssClass="text-danger"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblGridFname" runat="server" 
                                    Text='<%# Bind("Fname") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle CssClass="col-xs-4" />
                        </asp:TemplateField>

                <asp:TemplateField HeaderText="Last Name">
                            <EditItemTemplate>
                                <div class="col-xs-11 col-edit">
                                    <asp:TextBox ID="txtGridLname" runat="server" 
                                        MaxLength="15" CssClass="form-control"  
                                        Text='<%# Bind("Lname") %>'></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvGridLname" runat="server" 
                                    ControlToValidate="txtGridLname" ValidationGroup="Edit" 
                                    ErrorMessage="Last Name is a required field" Text="*"
                                    CssClass="text-danger"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblGridLname" runat="server" 
                                    Text='<%# Bind("Lname") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle CssClass="col-xs-4" />
                        </asp:TemplateField>

                <asp:TemplateField HeaderText="Phone Number">
                            <EditItemTemplate>
                                <div class="col-xs-11 col-edit">
                                    <asp:TextBox ID="txtGridPhone" runat="server" 
                                        MaxLength="15" CssClass="form-control"  
                                        Text='<%# Bind("Borrower_phone_number") %>'></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvGridPhone" runat="server" 
                                    ControlToValidate="txtGridPhone" ValidationGroup="Edit" 
                                    ErrorMessage="Phone Number is a required field" Text="*"
                                    CssClass="text-danger"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revPhone" runat="server" 
                            ControlToValidate="txtGridPhone" Text="Use this format: 999-999-9999"
                            Display="Dynamic" CssClass="text-danger" 
                            ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"
                            ErrorMessage="Please enter the phone number in the correct format."
                                    ValidationGroup="Edit">
                        </asp:RegularExpressionValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblGridPhone" runat="server" 
                                    Text='<%# Bind("Borrower_phone_number") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle CssClass="col-xs-4" />
                        </asp:TemplateField>

                <asp:CommandField ButtonType="Button" ShowEditButton="True" ValidationGroup="Edit"/>
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:disk_inventoryConnectionString %>" 
            DeleteCommand="SPDeleteBorrower" DeleteCommandType="StoredProcedure" 
            InsertCommand="SPInsertBorrower" InsertCommandType="StoredProcedure" 
            SelectCommand="SELECT BorrowerID, Fname, Lname, Borrower_phone_number FROM Borrower" 
            UpdateCommand="SPUpdateBorrower" UpdateCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="BorrowerID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Fname" Type="String" />
                <asp:Parameter Name="Lname" Type="String" />
                <asp:Parameter Name="Borrower_phone_number" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Fname" Type="String" />
                <asp:Parameter Name="Lname" Type="String" />
                <asp:Parameter Name="Borrower_phone_number" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="Edit"/>
                <asp:DetailsView ID="dvBorrower" runat="server" CssClass="table table-bordered table-condensed" 
                    AutoGenerateRows="False" DataKeyNames="BorrowerID" DataSourceID="SqlDataSource"
                    defaultMode="Insert" OnItemInserted="dvBorrower_ItemInserted">
                    <HeaderTemplate><p>To create a new Borrower, enter the information 
                    and click Insert</p></HeaderTemplate>
                    <Fields>
                        <asp:TemplateField>
                            <InsertItemTemplate>
                                <label for="Fnametxt">First Name:</label>
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
                                <label for="Lnametxt">Last Name:</label>
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
                                <label for="Phonetxt">Phone Number:</label>
                                <asp:RequiredFieldValidator ID="rfvPhone" runat="server" Display="Dynamic" 
                                    ControlToValidate="Phonetxt" CssClass="text-danger"
                                    ErrorMessage="Phone Number is a required field." Text="*"
                                    ValidationGroup="insertVal">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revPhone" runat="server" 
                            ControlToValidate="Phonetxt" Text="Use this format: 999-999-9999"
                            Display="Dynamic" CssClass="text-danger" 
                            ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"
                            ErrorMessage="Please enter the phone number in the correct format."
                                    ValidationGroup="Edit">
                        </asp:RegularExpressionValidator>
                                <asp:TextBox ID="Phonetxt" runat="server" 
                                    Text='<%# Bind("Borrower_phone_number") %>' CssClass="form-control" />  
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