<%@ Page Title="Contols testing" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ControlsTestingPage.aspx.cs" Inherits="EventSystem.ControlsTestingPage" %>

<%@ Register TagPrefix="uc"
    TagName="Sanitizer"
    Src="~/Controls/MindYourLanguage.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <uc:Sanitizer
                ID="Sanitizer"
                runat="server"
                CssClass="F" />
        </div>
    </div>
</asp:Content>
