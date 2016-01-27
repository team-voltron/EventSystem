<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="EventSystem.Events.Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:FormView runat="server" ID="FormVideEventDetails" ItemType="EventSystem.Models.Event" SelectMethod="FormVideEventDetails_GetItem">
        <ItemTemplate>
            <header>
                <h1><%: Title %></h1>
                <p><%#: Item.Name %></p>
                <p><i>by <%#: Item.Author.UserName %></i></p>
                <p>
                    <%#: Item.Description %>
                </p>
            </header>
            <div class="row-fluid">
                <div class="span12 book-description">
                    <p><%#: Item.Description %></p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <asp:ListView runat="server"
                        ID="EventComments"
                        DataSource="<%# Item.Comments.OrderByDescending(c => c.DateCreated) %>"
                        ItemType="EventSystem.Models.Comment"
                        InsertItemPosition="FirstItem">
                        <LayoutTemplate>
                            <h3>Comment section</h3>
                            <asp:Label runat="server" Visible="false" ID="CommentMessage"></asp:Label>
                            <div id="itemPlaceholder" runat="server"></div>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <div class="jumbotron comment">
                                <h6>- <strong><%# Item.Author.UserName %></strong> - <%# Item.DateCreated %></h6>
                                <h4><%#: Item.Content %></h4>
                            </div>
                        </ItemTemplate>
                        <EmptyItemTemplate>
                            There are no comments for this event.
                        </EmptyItemTemplate>
                        <InsertItemTemplate>
                            <div class="text-center">
                                <asp:TextBox TextMode="MultiLine" CssClass="form-control" runat="server" ID="CommentContent"></asp:TextBox>
                                <br />
                                <asp:LinkButton CssClass="btn btn-success" ID="InsertButton" runat="server" OnClick="InsertButton_Click" Text="Post comment"></asp:LinkButton>
                            </div>
                        </InsertItemTemplate>
                    </asp:ListView>
                </div>
            </div>
        </ItemTemplate>
    </asp:FormView>

    <div class="back-link">
        <a href="/">Back to events</a>
    </div>
</asp:Content>
