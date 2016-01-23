<%@ Page Title="Events" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="EventSystem.Events" %>

<asp:Content ID="ContentBody" ContentPlaceHolderID="MainContent" runat="server">
    <h1><%: this.Title %></h1>

     <asp:ListView runat="server" ID="ListViewCategories" ItemType="EventSystem.Models.Category" SelectMethod="ListViewCategories_GetData"
        GroupItemCount="3">
        <GroupTemplate>
            <div class="row">
                <asp:PlaceHolder runat="server" ID="itemPlaceHolder"></asp:PlaceHolder>
            </div>
        </GroupTemplate>
       <ItemTemplate>
            <div class="col-md-4">
                <h2><%#: Item.Name %></h2>
<%--                <asp:ListView runat="server" ID="RepeatEvents" ItemType="EventSystem.Models.Event" DataSource="<%# Item.Events %>">
                    <LayoutTemplate>
                        <ul>
                            <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
                        </ul>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <li>
                            <h4>text</h4>--%>
                                                        <%--<asp:HyperLink NavigateUrl='<%# string.Format("~/EventDetails.aspx?id={0}", Item.Id) %>' runat="server" Text='<%# string.Format(@"""{0}"" by <i>{1}</i>", Item.Name, Item.Author) %>' />--%>
                      <%--  </li>
                    </ItemTemplate>
                    <EmptyDataTemplate>
                        No events in this category.
                    </EmptyDataTemplate>
                </asp:ListView>--%>
            </div>
        </ItemTemplate>
    </asp:ListView>

</asp:Content>
