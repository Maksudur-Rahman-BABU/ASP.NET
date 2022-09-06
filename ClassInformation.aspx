<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ClassInformation.aspx.cs" Inherits="CollegeManegmentSystem.ClassInformation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="row">
        <div class="col-md-6">
            <asp:FormView ID="FormView1" DataSourceID="ObjectDataSource1" CssClass="table table-bordered" runat="server" DefaultMode="Insert" DataKeyNames="Id">
                <ItemTemplate>
                    <tr>
                        <th>Id</th>
                        <td><%# Eval("Id") %></td>
                    </tr>
                    <tr>
                        <th>Category Name</th>
                        <td><%# Eval("CatName") %></td>
                    </tr>
                    <tr>
                        <th>Cost</th>
                        <td><%# Eval("Cost") %></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:LinkButton ID="btnAddNew" CssClass="btn btn-primary btn-sm" CommandName="New" runat="server">Add New</asp:LinkButton>
                        </td>
                    </tr>
                </ItemTemplate>
                <InsertItemTemplate>
                    <tr>

                    </tr>
                    <tr>

                        <th>Category Name</th>
                        <td>
                            <asp:TextBox ID="txtInsertCategory" runat="server" CssClass="form-control" Text='<%# Bind("CatName") %>'></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <th>Cost</th>
                        <td>
                            <asp:TextBox ID="txtInsertCost" runat="server" CssClass="form-control" Text='<%# Bind("Cost") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtInsertCost" ErrorMessage="Price can't be empty!!" ForeColor="Red"></asp:RequiredFieldValidator>
                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtInsertCost" ErrorMessage="Pease insert value correct way!!" ForeColor="Red" ValidationExpression="^\d{0,8}(\.\d{1,4})?$"></asp:RegularExpressionValidator>
                         </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:LinkButton ID="btnInsert" runat="server" CommandName="Insert" CssClass="btn btn-primary btn-sm">Save</asp:LinkButton>
                            <asp:LinkButton ID="btnCancel" runat="server" CommandName="Cancel" CssClass="btn btn-danger btn-sm">Cancel</asp:LinkButton>
                        </td>
                    </tr>
                </InsertItemTemplate>
            </asp:FormView>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="CollegeManegmentSystem.Models.Catagory" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="Get" TypeName="CollegeManegmentSystem.DAL.CatagoryGetWay" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
            </asp:ObjectDataSource>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
