<%@ Page Title="All Events" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="All.aspx.cs" Inherits="EventSystem.Events.All" %>

<asp:Content ID="ContentBody" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-md-6 col-md-offset-6">
            <div class="input-append form-group">
                <asp:TextBox runat="server" ID="TextBoxSearchParam" CssClass="col-md-6 form-control" type="text" placeholder="Seach by event name" />
                <asp:LinkButton runat="server" ID="LinkButtonSeach" OnClick="LinkButtonSeach_Click" CssClass="btn btn-info" Text="Search" />
            </div>
        </div>
    <div class="row">
        <h1 class="text-center alert alert-info col-md-8 col-md-offset-2 modal-content container"><%: this.Title %></h1>
        
    </div>

    <asp:ListView runat="server" ID="ListViewCategories" ItemType="EventSystem.Models.Category" SelectMethod="ListViewCategories_GetData"
        GroupItemCount="1">
        <GroupTemplate>
            <div class="row">
                <asp:PlaceHolder runat="server" ID="itemPlaceHolder"></asp:PlaceHolder>
            </div>
        </GroupTemplate>
        <ItemTemplate>
            <div class="col-md-8 col-md-offset-2 draggable-element">
                <div class="modal-content">
                    <div class="">
                        <%--<h2><%#: Item.Name %></h2>--%>
                    </div>
                     <h3 class="text-center">
                                        <asp:HyperLink NavigateUrl='<%# string.Format("~/Events/ByCategory.aspx?id={0}", Item.Id) %>' runat="server" Text='<%# string.Format(@"{0}</br>", Item.Name) %>' />
                                    </h3>
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
                               No Events in this Category
                            </EmptyDataTemplate>
                        </asp:ListView>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:ListView>
    <script src="//code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/drag-arrange.js" type="text/javascript"></script>
    <script>
        $('.draggable-element').arrangeable();
    </script>
</asp:Content>
