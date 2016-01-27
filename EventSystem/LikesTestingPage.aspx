<%@ Page Title="Like button tests" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LikesTestingPage.aspx.cs" Inherits="EventSystem.LikesTestingPage" %>

<%@ Register
    TagPrefix="uc"
    TagName="LikeControl"
    Src="~/Controls/LikeControl.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     
    <%--NOTE--%>
    <%--YOU SHOUD BE LOGED-IN IN ORDER TO VIEW THE BUTTONS!--%>

    <asp:FormView runat="server" ID="FormViewArticle" ItemType="EventSystem.Models.Event"
        SelectMethod="FormViewArticle_GetItem">
        <ItemTemplate>

            <uc:LikeControl
                runat="server"
                ID="LikeControl"
                Value="<%# GetLikes(Item) %>"
                CurrentUserVote="<%# GetCurrentUserVote(Item) %>"
                DataID="<%# Item.Id %>"
                OnLike="LikeControl_Like" />

            <h2><%#: Item.Name %> <small>Category: <%#: Item.Category.Name %></small></h2>
            <p><%#: Item.Description %></p>
            <p>
                <span>Author: <%#: Item.Author.UserName %></span>
                <span class="pull-right"><%#: Item.DateCreated %></span>
            </p>
        </ItemTemplate>
    </asp:FormView>

</asp:Content>
