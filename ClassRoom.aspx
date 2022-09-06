<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ClassRoom.aspx.cs" Inherits="CollegeManegmentSystem.ClassRoom" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="row">
        <div class="col-md-4">
             <h2 class="  bg-light">Insert Class Information</h2>
            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="234px" AutoGenerateRows="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                <EditRowStyle BackColor="#999999" />
                <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                <Fields>
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:TemplateField HeaderText="CatName" SortExpression="CatName">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CatName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtCatName" runat="server" Text='<%# Bind("CatName") %>'></asp:TextBox>
                            <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Name should be at least 4 char!!" ControlToValidate="txtCatName" ForeColor="Red" OnServerValidate="CustomValidator1_ServerValidate1"></asp:CustomValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("CatName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" />
                    <asp:CommandField ShowInsertButton="True" />
                </Fields>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
             </asp:DetailsView>
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BABUConnectionString %>" DeleteCommand="DELETE FROM [Ccategories] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Ccategories] ([CatName], [Cost]) VALUES (@CatName, @Cost)" SelectCommand="SELECT * FROM [Ccategories]" UpdateCommand="UPDATE [Ccategories] SET [CatName] = @CatName, [Cost] = @Cost WHERE [Id] = @Id">
                 <DeleteParameters>
                     <asp:Parameter Name="Id" Type="Int32" />
                 </DeleteParameters>
                 <InsertParameters>
                     <asp:Parameter Name="CatName" Type="String" />
                     <asp:Parameter Name="Cost" Type="Int32" />
                 </InsertParameters>
                 <UpdateParameters>
                     <asp:Parameter Name="CatName" Type="String" />
                     <asp:Parameter Name="Cost" Type="Int32" />
                     <asp:Parameter Name="Id" Type="Int32" />
                 </UpdateParameters>
             </asp:SqlDataSource>
        </div>
            <div class="col-6">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="580px">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:TemplateField HeaderText="Class Name" SortExpression="CatName">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CatName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("CatName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
            </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
