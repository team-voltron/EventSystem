<%@ Page Title="Events" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="All.aspx.cs" Inherits="EventSystem.Events.All" %>

<asp:Content ID="ContentBody" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <h1 class="col-md-6"><%: this.Title %></h1>
        <div class="col-md-6">
            <div class="input-append">
                <asp:TextBox runat="server" ID="TextBoxSearchParam" CssClass="col-md-6" type="text" placeholder="Seach by event name" />
                <asp:LinkButton runat="server" ID="LinkButtonSeach" OnClick="LinkButtonSeach_Click" CssClass="btn btn-info" Text="Search" />
            </div>
        </div>
    </div>

    <hr />
    
    <asp:ListView runat="server" ID="ListViewCategories" ItemType="EventSystem.Models.Category" SelectMethod="ListViewCategories_GetData"
        GroupItemCount="3">
        <GroupTemplate>
            <div class="row">
                <asp:PlaceHolder runat="server" ID="itemPlaceHolder"></asp:PlaceHolder>
            </div>
        </GroupTemplate>
        <ItemTemplate>
            <div class="col-md-4">
                <div class="panel-heading">
                    <div class="panel panel-primary">
                        <h2><%#: Item.Name %></h2>
                    </div>

                    <div class="panel-body">
                        <asp:ListView runat="server" ID="RepeaterBooks" ItemType="EventSystem.Models.Event" DataSource="<%# Item.Events %>">

                            <LayoutTemplate>
                                <ul class="list-group">
                                    <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
                                </ul>
                            </LayoutTemplate>

                            <ItemTemplate>
                                <li class="list-group-item">
                                    <asp:HyperLink NavigateUrl='<%# string.Format("~/Events/Details.aspx?id={0}", Item.Id) %>' runat="server" Text='<%# string.Format(@"{0}</br>", Item.Name) %>' />
                                    <p>
                                        <span>Created by: <%#: Item.Author.UserName %></span>
                                        <span class="badge">Date: <%#: Item.DateCreated %></span>
                                    </p> 
                                </li>
                            </ItemTemplate>
                            <EmptyDataTemplate>
                                No events in this category.
                            </EmptyDataTemplate>
                        </asp:ListView>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:ListView>

</asp:Content>
