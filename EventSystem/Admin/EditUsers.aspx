<%@ Page Title="Edit Users" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditUsers.aspx.cs" Inherits="EventSystem.Admin.EditUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server" >
    
    <h3 class="text-center alert alert-info col-md-8 col-md-offset-2 modal-content"><%: this.Title %></h3>
    
    <asp:Panel runat="server" CssClass="col-md-8 col-md-offset-2 modal-content">
        <asp:GridView runat="server"
            ID="GridViewUsers"
            AllowPaging="true"
            PageSize="3"
            CssClass="table table-responsive table-condensed table-striped info content-table"
            OnRowDataBound="GridViewUsers_RowDataBound"
            OnPageIndexChanged="GridViewUsers_PageIndexChanged"
            OnPageIndexChanging="GridViewUsers_PageIndexChanging"
            GridLines="None">
            <PagerStyle CssClass="pagination-ys" />
        </asp:GridView>
    </asp:Panel>
    <br />
    <br />

    <br />

    <asp:Panel runat="server" CssClass="col-md-6 col-md-offset-5 edit-btn">
        <asp:Button ID="cmdUpdateRole" runat="server" OnClick="cmdUpdateRole_Click" Text="Update Roles" CssClass="btn btn-success" />
    </asp:Panel>
   

    

</asp:Content>
