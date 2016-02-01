<%@ Page Title="Event Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="EventSystem.Events.Details" %>

<%@ Register
    TagPrefix="uc"
    TagName="LikeControl"
    Src="~/Controls/LikeControl.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h3 class="text-center alert alert-info col-md-8 col-md-offset-2 modal-content container"><%: Title %></h3>
    <asp:FormView CssClass="col-md-12" runat="server" ID="FormVideEventDetails" ItemType="EventSystem.Models.Event" SelectMethod="FormVideEventDetails_GetItem">
        <ItemTemplate>
            <div class="container col-md-8 col-md-offset-2 modal-content content-details">
                <div class="col-md-1">
                    <uc:LikeControl
                        runat="server"
                        ID="LikeControl"
                        Value="<%# GetLikes(Item) %>"
                        CurrentUserVote="<%# GetCurrentUserVote(Item) %>"
                        DataID="<%# Item.Id %>"
                        OnLike="LikeControl_Like" />
                </div>
                <div class="col-md-6 col-md-offset-1">
                        <h2 ><%#: Item.Name %></h2>
                        <p><i>by <%#: Item.Author.UserName %></i></p>
                    
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

                </div>

            </div>
            <div class="container col-md-8 col-md-offset-2 modal-content content-details">
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
                            <asp:LinkButton runat="server" Text="Join event" CssClass="btn btn-success btn-block" OnClick="JoinEventBtn_Click" ID="JoinEventBtn" />
                        </InsertItemTemplate>
                    </asp:ListView>
                </div>
            </div>
        </ItemTemplate>
    </asp:FormView>

    <a class=" btn btn-primary col-md-8 col-md-offset-2" href="/Events/All">Back to events</a>
</asp:Content>
