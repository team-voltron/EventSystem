<%@ Page Title="Admin Panel" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminPanel.aspx.cs" Inherits="EventSystem.AdminPanel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3 class="text-center alert alert-info col-md-8 col-md-offset-2 modal-content container"><%: this.Title %></h3>

    <div class="col-md-8 col-md-offset-2 modal-content content-admin-panel">
        <div class="btn-group btn-group-justified">
            <a runat="server" href="~/Admin/EditCategories" class="btn btn-lg btn-primary col-md-2">Edit Cats :)</a>
            <a runat="server" href="~/Admin/EditEvents" class="btn btn-lg btn-success col-md-2">Edit Events</a>
            <a runat="server" href="~/Admin/EditUsers" class="btn btn-lg btn-danger col-md-2">Edit Users</a>
        </div>
    </div>


</asp:Content>
