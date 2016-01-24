<%@ Page Title="Seach results for query" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="EventSystem.Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="col-md-12">
        <h1>
            <%: Title %>
            <asp:Literal runat="server" ID="LiteralSearchQuery" Mode="Encode"></asp:Literal>
        </h1>
    </div>

    <asp:Repeater runat="server" ID="Repeater" ItemType="EventSystem.Models.Event" SelectMethod="Repeater_GetData">
        <HeaderTemplate>
            <ul>
        </HeaderTemplate>
        <ItemTemplate>
            <li>
                <asp:HyperLink NavigateUrl='<%# string.Format("~/EventDetails.aspx?id={0}", Item.Id) %>' runat="server" ID="HyperLinkEvent" Text="<%# GetName(Item) %>"/>

                (Category: <%#: Item.Category.Name %>)                 
            </li>
        </ItemTemplate>
        <FooterTemplate>
            </ul>
        </FooterTemplate>
    </asp:Repeater>

    <div class="back-link">
        <a href="/">Back to events</a>
    </div>

</asp:Content>
