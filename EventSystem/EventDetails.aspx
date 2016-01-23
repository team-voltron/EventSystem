<%@ Page Title="Event details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EventDetails.aspx.cs" Inherits="EventSystem.EventDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:FormView runat="server" ID="FormVideEventDetails" ItemType="EventSystem.Models.Event" SelectMethod="FormVideEventDetails_GetItem">
        <ItemTemplate>
            <header>
                <h1><%: Title %></h1>
                <p><%#: Item.Name %></p>
                <p><i>by <%#: Item.Author %></i></p>
                <p><%#: Item.Description %>
                </p>
            </header>
            <div class="row-fluid">
                <div class="span12 book-description">
                    <p><%#: Item.Description %></p>
                </div>
            </div>
        </ItemTemplate>
    </asp:FormView>
        
    <div class="back-link">
        <a href="/">Back to events</a>
    </div>

</asp:Content>
