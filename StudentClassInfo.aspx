<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StudentClassInfo.aspx.cs" Inherits="CollegeManegmentSystem.StudentClassInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="row">
        <div class="col">
            <h2 class="  bg-light">Enter Student Class Info</h2>
            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="classId" DataSourceID="SqlDataSource1" OnItemInserting="DetailsView1_ItemInserting">
                <Fields>
                    <asp:BoundField DataField="classId" HeaderText="classId" InsertVisible="False" ReadOnly="True" SortExpression="classId" />
                    <asp:BoundField DataField="className" HeaderText="className" SortExpression="className" />
                    <asp:TemplateField HeaderText="classType" SortExpression="classType">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("classType") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList1" DataSourceID="SqlDataSource2" CssClass="form-control" DataTextField="CatName" DataValueField="Id" SelectedValue='<%#Bind("classType") %>' runat="server"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BABUConnectionString %>" SelectCommand="SELECT * FROM [Ccategories]"></asp:SqlDataSource>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("classType") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Picture" SortExpression="Picture">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Picture") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:FileUpload ID="fuPicture" CssClass="form-control" runat="server" />
                            <asp:HiddenField ID="HiddenField1" Value='<%#Bind("Picture") %>' runat="server" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Picture") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CheckBoxField DataField="IsAvialable" HeaderText="IsAvialable" SortExpression="IsAvialable" />
                    <asp:CommandField ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BABUConnectionString %>" DeleteCommand="DELETE FROM [class] WHERE [classId] = @classId" InsertCommand="INSERT INTO [class] ([className], [classType], [Picture], [IsAvialable]) VALUES (@className, @classType, @Picture, @IsAvialable)" SelectCommand="SELECT * FROM [class]" UpdateCommand="UPDATE [class] SET [className] = @className, [classType] = @classType, [Picture] = @Picture, [IsAvialable] = @IsAvialable WHERE [classId] = @classId">
                <DeleteParameters>
                    <asp:Parameter Name="classId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="className" Type="String" />
                    <asp:Parameter Name="classType" Type="Int32" />
                    <asp:Parameter Name="Picture" Type="String" />
                    <asp:Parameter Name="IsAvialable" Type="Boolean" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="className" Type="String" />
                    <asp:Parameter Name="classType" Type="Int32" />
                    <asp:Parameter Name="Picture" Type="String" />
                    <asp:Parameter Name="IsAvialable" Type="Boolean" />
                    <asp:Parameter Name="classId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <div class="col-6">
             <h2>StudentClass Shown</h2>
            <asp:GridView ID="GridView1" runat="server" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" OnRowUpdating="GridView1_RowUpdating">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:TemplateField HeaderText="classId" InsertVisible="False" SortExpression="classId">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("classId") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("classId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Picture" SortExpression="Picture">
                        <EditItemTemplate>
                            <asp:FileUpload ID="fuPicture" runat="server" />
                            <asp:HiddenField ID="HiddenField2" Value='<%#Bind("Picture") %>' runat="server" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Image ID="Image1" ImageUrl='<%#Eval("picture","~/Images/{0}") %>'  runat="server" Width="70px" />
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
