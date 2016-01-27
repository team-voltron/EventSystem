<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Create.aspx.cs" Inherits="EventSystem.Events.Create" %>

<asp:Content ID="ContentBody" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Create new event.</h2>
    <div class="row">
        <div class="col-md-8">
            <div class="form-horizontal">
                <asp:ValidationSummary ID="ValidationSummary" runat="server" DisplayMode="BulletList" CssClass="text-danger" />
                <label for="tbName">Name</label>
                <asp:TextBox runat="server" ID="tbName" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator
                    CssClass="text-danger"
                    ID="RequiredNameValidator"
                    runat="server"
                    ControlToValidate="tbName"
                    ErrorMessage="Name field for event is required!"
                    Display="None">
                </asp:RequiredFieldValidator>
                <br />
                <label for="tbDescription">Description</label>
                <asp:TextBox runat="server" ID="tbDescription" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator
                    CssClass="text-danger"
                    ID="RequiredDescriptionValidator"
                    runat="server"
                    ControlToValidate="tbDescription"
                    ErrorMessage="Description field is required!"
                    Display="None">
                </asp:RequiredFieldValidator>
                <br />
                <asp:DropDownList ID="DropDownCategories"
                    runat="server"
                    AppendDataBoundItems="true"
                    DataTextField="Name"
                    DataValueField="Id"
                    CssClass="form-control">
                    <asp:ListItem Text="Select category"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator
                    ID="RequiredCategory"
                    runat="server"
                    ControlToValidate="DropDownCategories"
                    ErrorMessage="Category is not selected!">
                </asp:RequiredFieldValidator>
                <br />
                <asp:TextBox TextMode="DateTimeLocal" runat="server" ID="dtEventStart"></asp:TextBox>
                <br />
                <asp:FileUpload ID="EventImage" runat="server"  />
                <br />
                <asp:Button runat="server"
                    ID="btnCreateEvent"
                    Text="Create event"
                    CssClass="btn btn-primary"
                    OnClick="BtnCreateEvent_Click" />
            </div>
        </div>
    </div>
</asp:Content>
