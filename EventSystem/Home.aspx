<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="EventSystem.Home" %>

<%@ Register
    TagPrefix="uc"
    TagName="StatsControl"
    Src="~/Controls/StatsControl.ascx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="modal-content main-stats">
            <div class="row">
                <h1 class="text-center">Welcome to our </h1>
                <h3 class="text-center">super mega yaka Event system(a) manager</h3>
                <h6 class="text-center"><em>Note: The statistics are chached for <%= EventSystem.Common.CommonConstants.TimeForChaching/60 %> minutes</em></h6>
                <uc:StatsControl runat="server" />
            </div>
        </div>
    </div>
    <div class="col-md-6 draggable-element">
        <div class="panel panel-default  modal-content">
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
                            <%--<asp:Label
                                runat="server" ID="EventCount"
                                Text="<%# Item.Name%>" />--%>
                            <asp:HyperLink
                                NavigateUrl='<%# string.Format("~/Events/ByCategory.aspx?id={0}", Item.Id) %>'
                                runat="server"
                                Text='<%# Item.Name  %>' />
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

    <div class="col-md-6 draggable-element">
        <div class="panel panel-default modal-content">
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
                                <th>Name
                                </th>
                                <th class="text-center">Starts
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
