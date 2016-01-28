<%@ Page Title="Seach results for query" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="EventSystem.Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="col-md-12">
        <h3 class="text-center alert alert-info col-md-8 col-md-offset-2 modal-content">
            <%: Title %>
            <asp:Literal runat="server" ID="LiteralSearchQuery" Mode="Encode"></asp:Literal>
        </h3>
    </div>

    <div class="col-md-8 col-md-offset-2">
        <asp:Repeater runat="server" ID="Repeater" ItemType="EventSystem.Models.Event" SelectMethod="Repeater_GetData">
            <HeaderTemplate>
                <ul class="list-group container">
            </HeaderTemplate>
            <ItemTemplate>
                <li class="list-group-item">
                    <asp:HyperLink NavigateUrl='<%# string.Format("~/Events/Details.aspx?id={0}", Item.Id) %>' runat="server" ID="HyperLinkEvent" Text="<%# GetName(Item) %>" />

                    (Category: <%#: Item.Category.Name %>)                 
            </li>
            </ItemTemplate>
            <FooterTemplate>
                </ul>
       
            </FooterTemplate>
        </asp:Repeater>
    </div>
    <a class=" btn btn-primary col-md-8 col-md-offset-2" href="/Events/All">Back to events</a>


</asp:Content>
