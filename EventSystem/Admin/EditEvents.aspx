<%@ Page Title="Edit events" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditEvents.aspx.cs" Inherits="EventSystem.Admin.EditEvents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
            
    <h1><%: this.Title %></h1>
    <hr />

    <asp:GridView runat="server"
        ID="GridViewBooks"
        ItemType="EventSystem.Models.Event"
        SelectMethod="GridViewBooks_GetData"
        UpdateMethod="GridViewBooks_UpdateItem"
        DeleteMethod="GridViewBooks_DeleteItem"
        AutoGenerateColumns="false"
        AllowSorting="true"
        AllowPaging="true"
        PageSize="5"
        DataKeyNames="ID">
            
        <Columns>
            <asp:BoundField
                DataField="Name"
                HeaderText="Name"
                SortExpression="Name" />
            
            <asp:BoundField
                DataField="DateCreated"
                HeaderText="DateCreated"
                SortExpression="DateCreated" />

            <asp:BoundField
                DataField="Category.Name"
                HeaderText="Category"
                SortExpression="Category.Name" />

            <asp:BoundField
                DataField="Author.UserName"
                HeaderText="Author"
                SortExpression="Author.UserName" />

            <asp:CommandField
                ShowEditButton="true"
                ShowDeleteButton="true" />
        </Columns>

    </asp:GridView>

</asp:Content>
