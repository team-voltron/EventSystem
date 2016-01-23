<%@ Page Title="Events" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="EventSystem.Events" %>

<asp:Content ID="ContentBody" ContentPlaceHolderID="MainContent" runat="server">
    <h1><%: this.Title %></h1>

    <asp:Repeater runat="server" ID="RepeaterCategories"
        ItemType="EventSystem.Models.Category"
        SelectMethod="RepeatCategories_GetData">
        <ItemTemplate>
            <%#: Item.Name %>
        </ItemTemplate>
    </asp:Repeater>

</asp:Content>