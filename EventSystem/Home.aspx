<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="EventSystem.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <h1>Welcome</h1>
    <h3>Event system manager</h3>
    <div class="col-md-6">
        <h3>Users</h3>
        <asp:ListView runat="server" 
                         ItemType="EventSystem.Models.AppUser"

            ID="UsersLiveView" SelectMethod="UsersLiveView_GetData">
              <LayoutTemplate>
                <ul class="list-group">
                    <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
                </ul>
            </LayoutTemplate>
            <ItemTemplate>
                <li>
                    <asp:HyperLink NavigateUrl='<%# string.Format("~/{0}", Item.UserName) %>' runat="server" Text='<%# Item.UserName %>' />
                </li>
            </ItemTemplate>
            <EmptyDataTemplate>
                No categories found.
            </EmptyDataTemplate>
        </asp:ListView>
    </div>

    <div class="col-md-6">
        <h3>Events</h3>
        <asp:ListView runat="server"
             ItemType="EventSystem.Models.Event"
             ID="EventsListView" 
            SelectMethod="EventsListView_GetData">
            <LayoutTemplate>
                <ul class="list-group">
                    <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
                </ul>
            </LayoutTemplate>
            <ItemTemplate>
                <li>
                    <asp:HyperLink NavigateUrl='<%# string.Format("~/Events/Details.aspx?id={0}", Item.Id) %>' runat="server" Text='<%# Item.Name %>' />
                </li>
            </ItemTemplate>
            <EmptyDataTemplate>
                No events found.
            </EmptyDataTemplate>
        </asp:ListView>
    </div>

</asp:Content>
