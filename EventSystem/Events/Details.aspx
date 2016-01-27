<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="EventSystem.Events.Details" %>

<%@ Register
    TagPrefix="uc"
    TagName="LikeControl"
    Src="~/Controls/LikeControl.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:FormView runat="server" ID="FormVideEventDetails" ItemType="EventSystem.Models.Event" SelectMethod="FormVideEventDetails_GetItem">
        <ItemTemplate>
            <div class="row">
                <div class="col-md-8">
                    <header>
                        <h1><%: Title %></h1>
                        <h2><%#: Item.Name %></h2>
                        <p><i>by <%#: Item.Author.UserName %></i></p>
                    </header>
                    <div class="row-fluid">
                        <div class="span12 book-description">
                            <p><%#: Item.Description %></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="col-md-10 col-md-offset-1">
                        <img src="<%# Item.ImageLocation %>" width="100%" />
                    </div>
                    <div class="col-md-10 col-md-offset-1">
                        <uc:likecontrol
                            runat="server"
                            id="LikeControl"
                            value="<%# GetLikes(Item) %>"
                            currentuservote="<%# GetCurrentUserVote(Item) %>"
                            dataid="<%# Item.Id %>"
                            onlike="LikeControl_Like" />
                    </div>
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
                            <h3 class="text-center">Comment section</h3>
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
                <div class="col-md-6">
                    <asp:ListView runat="server"
                        ID="EventParticipants"
                        DataSource="<%# Item.Users %>"
                        ItemType="EventSystem.Models.AppUser"
                        InsertItemPosition="FirstItem">
                        <LayoutTemplate>
                            <h3 class="text-center">Participants</h3>
                            <asp:Label runat="server" Visible="false" ID="ParticipantMessage"></asp:Label>
                            <div id="itemPlaceholder" runat="server"></div>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <div class="jumbotron comment">
                                <h4>Username - <%# Item.UserName %></h4>
                                <h4>Email - <%# Item.Email %></h4>
                            </div>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <h3>There are no participants for this event.
                            </h3>
                        </EmptyDataTemplate>
                        <EmptyItemTemplate>
                            <h3>There are no participants for this event.
                            </h3>
                        </EmptyItemTemplate>
                        <InsertItemTemplate>
                            <asp:Button runat="server" Text="Join event" CssClass="btn btn-success btn-block" OnClick="JoinEventBtn_Click" ID="JoinEventBtn" />
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
