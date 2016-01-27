<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="EventSystem.Home" %>

<%--cache duration in seconds--%>
<%--<%@ OutputCache Duration="20" VaryByParam="None" %>--%>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <div class="row">
            <h1 class="text-center">Welcome to our </h1>
            <h3 class="text-center">super mega yaka Event system(a) manager</h3>
            <hr />
        </div>
        <div class="row">
            <div class="col-md-4 text-center">
                <h4>
                    <strong>Total categories: </strong>
                    <asp:Label runat="server" ID="LabelCategoriesTotal" CssClass="badge" />
                </h4>
            </div>
            <div class="col-md-4 text-center">
                <h4>
                    <strong>Last update at: </strong>
                    <br />
                    <asp:Label runat="server" ID="LabelTime" CssClass="badge" />
                </h4>
            </div>
            <div class="col-md-4 text-center">
                <h4>
                    <strong>Total events: </strong>
                    <asp:Label runat="server" ID="LabelEventsTotal" CssClass="badge" />
                </h4>
            </div>
        </div>
    </div>

    <div class="col-md-6">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="text-center">Users
                </h3>
            </div>
            <asp:ListView runat="server"
                ItemType="EventSystem.Models.Category"
                ID="UsersLiveView" SelectMethod="UsersLiveView_GetData">
                <LayoutTemplate>
                    <table class="table table-responsive">
                        <thead>
                            <tr>
                                <th>Categories
                                </th>
                                <th class="text-right">Events in category
                                </th>
                            </tr>
                        </thead>
                        <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
                    </table>
                </LayoutTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <asp:Label
                                runat="server" ID="EventCount"
                                Text="<%# Item.Name%>" />
                            <%--<asp:HyperLink NavigateUrl='<%# string.Format("~/{0}", Item.UserName) %>' runat="server" Text='<%# Item.UserName %>' />--%>
                        </td>
                        <td class="text-right">
                            <asp:Label
                                CssClass="badge"
                                runat="server" ID="LabelCategoryEventsCount"
                                Text="<%# Item.Events.Count%>" />
                        </td>
                    </tr>
                </ItemTemplate>
                <EmptyDataTemplate>
                    No categories found.
                </EmptyDataTemplate>

            </asp:ListView>
        </div>
    </div>

    <div class="col-md-6">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="text-center">Events
                </h3>
            </div>
            <asp:ListView runat="server"
                ItemType="EventSystem.Models.Event"
                ID="EventsListView"
                SelectMethod="EventsListView_GetData">
                <LayoutTemplate>
                    <table class="table table-responsive">
                        <thead>
                            <tr>
                                <th>
                                    Name
                                </th>
                                <th class="text-center">
                                    Starts
                                </th>
                                <th class="text-right">
                                    Comments
                                </th>
                            </tr>
                        </thead>
                        <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
                    </table>
                </LayoutTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <asp:HyperLink
                                NavigateUrl='<%# string.Format("~/Events/Details.aspx?id={0}", Item.Id) %>'
                                runat="server"
                                Text='<%# Item.Name  %>' />
                        </td>
                        <td class="text-right">
                            <asp:Label
                                CssClass="badge text-center"
                                runat="server" ID="Label1"
                                Text="<%# Item.DateTimeStarts %>" />
                        <td class="text-right">
                            <asp:Label
                                CssClass="badge"
                                runat="server" ID="EventCommentsCount"
                                Text="<%# Item.Comments.Count %>" />
                        </td>
                    </tr>
                </ItemTemplate>
                <EmptyDataTemplate>
                    No events found.
                </EmptyDataTemplate>
            </asp:ListView>
        </div>
    </div>
</asp:Content>
