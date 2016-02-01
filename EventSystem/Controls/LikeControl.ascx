<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LikeControl.ascx.cs" Inherits="EventSystem.Controls.LikeControl" %>

<asp:UpdatePanel runat="server" ID="ControlWrapper">
    <ContentTemplate>
        <div class="like-control col-md-1">
            <%--<div>Likes</div>--%>
            <div>
                <asp:LinkButton runat="server" ID="ButtonLike" CssClass="btn btn-sm btn-default glyphicon glyphicon-chevron-up" CommandArgument="<%# this.DataID %>" CommandName="Like" OnCommand="ButtonLike_Command" />
                
                <asp:LinkButton runat="server" ID="ButtonDislike" CssClass="btn btn-sm btn-default glyphicon glyphicon-chevron-down" CommandArgument="<%# this.DataID %>" CommandName="Dislike" OnCommand="ButtonLike_Command" />
                
            </div>
            <div class="text-center">
                    <asp:Label runat="server" ID="LabelValue" CssClass="btn btn-sm btn-primary disabled" />
                </div>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>
