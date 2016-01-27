<%@ Page Title="Users" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditUsers.aspx.cs" Inherits="EventSystem.Admin.EditUsers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <h1><%: this.Title %></h1>
    <hr />

    <asp:GridView runat="server"
        ID="GridViewUsers"
        onrowdatabound="GridViewUsers_RowDataBound">
    </asp:GridView>

    <asp:Button ID="cmdUpdateRole" runat="server" onclick="cmdUpdateRole_Click" Text="Update Roles" />

</asp:Content>
