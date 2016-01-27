<%@ Page Title="Contols testing" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ControlsTestingPage.aspx.cs" Inherits="EventSystem.ControlsTestingPage" %>

<%@ Register TagPrefix="uc"
    TagName="Spinner"
    Src="~/Controls/Spinner.ascx" %>

<%@ Register TagPrefix="uc"
    TagName="Sanitizer"
    Src="~/Controls/MindYourLanguage.ascx" %>

<%@ Register
    TagPrefix="uc"
    TagName="LikeButton"
    Src="~/Controls/LikeButton.ascx" %>




<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <uc:Spinner
        ID="Spinner"
        runat="server"
        MinValue="1"
        MaxValue="10" />

    <uc:Sanitizer
        ID="Sanitizer"
        runat="server"
        CssClass="F" />
    <div class="row">
        <uc:LikeButton
            ID="LikeButton"
            runat="server" />
    </div>

    <div class="clearfix">
    </div>

   
</asp:Content>
