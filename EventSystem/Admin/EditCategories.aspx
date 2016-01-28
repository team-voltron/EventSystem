<%@ Page Title="Edit categories" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditCategories.aspx.cs" Inherits="EventSystem.Admin.EditCategories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3 class="text-center alert alert-info col-md-8 col-md-offset-2 modal-content"><%: this.Title %></h3>

    <asp:Panel runat="server" CssClass="col-md-8 col-md-offset-2 modal-content">

    <asp:ListView runat="server"
        ID="ListViewCategories"
        ItemType="EventSystem.Models.Category"
        SelectMethod="ListViewCategories_GetData"
        UpdateMethod="ListViewCategories_UpdateItem"
        DeleteMethod="ListViewCategories_DeleteItem"
        InsertMethod="ListViewCategories_InsertItem"
        InsertItemPosition="LastItem"
       
        DataKeyNames="ID">

        <LayoutTemplate>
            <table class="table table-responsive table-condensed table-striped info content-table">
                <thead>
                    <tr>
                        <th>
                            <asp:LinkButton runat="server"
                                Text="Category Name"
                                ID="LinkButtonSortByCategory"
                                CommandName="Sort"
                                CommandArgument="Name" />
                        </th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:PlaceHolder ID="ItemPlaceHolder" runat="server" />
                    <tr>
                        <td>
                            <asp:DataPager runat="server" ID="DataPagerCategories" PagedControlID="ListViewCategories" PageSize="5">
                                <Fields>
                                    <asp:NumericPagerField />

                                </Fields>
                            </asp:DataPager>
                            <asp:DataPager runat="server" ID="DataPagerCategoriesOther" PagedControlID="ListViewCategories"
                                PageSize="5">
                                <Fields>
                                    <asp:NextPreviousPagerField />
                                </Fields>
                            </asp:DataPager>
                            
                        </td>
                        <td>
                            <asp:LinkButton 
                                runat="server" 
                                OnClientClick="function(){ 
                                    $('#InsertTableRowForm').show();
                                 }" 
                                ID="LinkButtonInsert" 
                                CssClass="btn btn-sm btn-success" 
                                Text="Insert" />
                        </td>
                    </tr>
                </tbody>
            </table>

        </LayoutTemplate>

        
        <ItemTemplate>
            <tr>
                <td><%#: Item.Name %></td>
                <td>
                    <asp:LinkButton CssClass="btn btn-sm btn-warning" runat="server" ID="ButtonEdit" CommandName="Edit" Text="Edit" />
                    <asp:LinkButton CssClass="btn btn-sm btn-danger" runat="server" ID="ButtonDelete" CommandName="Delete" Text="Delete" />
                </td>
            </tr>
        </ItemTemplate>

        <EditItemTemplate>
            <tr>
                <td>
                    <asp:TextBox runat="server" ID="TextBoxName" Text="<%#: BindItem.Name %>" />
                </td>
                <td>
                    <asp:LinkButton CssClass="btn btn-sm btn-warning" runat="server" ID="ButtonEdit" CommandName="Update" Text="Save" />
                    <asp:LinkButton CssClass="btn btn-sm btn-danger" runat="server" ID="ButtonDelete" CommandName="Cancel" Text="Cancel" />
                </td>
            </tr>
        </EditItemTemplate>

        <InsertItemTemplate>
            <tr ID="InsertTableRowForm">
                <td>
                    <asp:TextBox runat="server" ID="TextBoxName" Text="<%#: BindItem.Name %>" />
                </td>
                <td>
                    <asp:LinkButton CssClass="btn btn-sm btn-warning" runat="server" ID="ButtonEdit" CommandName="Insert" Text="Insert" OnClientClick />
                    <asp:LinkButton CssClass="btn btn-sm btn-danger" runat="server" ID="ButtonDelete" CommandName="Cancel" Text="Cancel" />
                </td>
            </tr>
        </InsertItemTemplate>

    </asp:ListView>
        </asp:Panel>
</asp:Content>
