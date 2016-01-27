<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="EventSystem.Home" %>

<%--cache duration in seconds--%>
<%@ OutputCache Duration="20" VaryByParam="None" %>


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
                    <strong>Total users: </strong>
                    <asp:Label runat="server" ID="LabelUsersTotal" CssClass="badge" />
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
                ItemType="EventSystem.Models.AppUser"
                ID="UsersLiveView" SelectMethod="UsersLiveView_GetData">
                <LayoutTemplate>
                    <table class="table table-responsive">
                        <thead>
                            <tr>
                                <th>Username
                                </th>
                                <th class="text-right">E-mail
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
                                Text="<%# Item.UserName%>" />
                            <%--<asp:HyperLink NavigateUrl='<%# string.Format("~/{0}", Item.UserName) %>' runat="server" Text='<%# Item.UserName %>' />--%>
                        </td>
                        <td class="text-right">
                            <asp:HyperLink NavigateUrl='<%# string.Format("mailto:{0}", Item.Email) %>' runat="server" Text='<%# Item.Email %>' />
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
                                <th>Event name
                                </th>
                                <th class="text-right">Comments
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
                                CssClass="badge"
                                runat="server" ID="EventCount"
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
