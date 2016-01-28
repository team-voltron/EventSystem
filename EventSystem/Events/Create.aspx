<%@ Page Language="C#" Title="Create Event" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Create.aspx.cs" Inherits="EventSystem.Events.Create" %>

<asp:Content ID="ContentBody" ContentPlaceHolderID="MainContent" runat="server">
    <h3 class="text-center alert alert-info col-md-8 col-md-offset-2 modal-content container">Create new event.</h3>
    <div class="container">
        <div class="col-md-6 col-md-offset-3 modal-content content-create-panel">
            <div class="form-horizontal col-md-8 col-md-offset-2">
                <asp:ValidationSummary ID="ValidationSummary" runat="server" DisplayMode="BulletList" CssClass="text-danger" />

                <div class="form-group col-md-12">
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
                </div>

                <div class="form-group col-md-12">

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
                </div>

                <div class="form-group col-md-12">

                    <label for="DropDownCategories">Category</label>
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
                </div>


                <div class="form-group col-md-12">
                    <label for="dtEventStart">Choose start date</label>
                    <asp:TextBox TextMode="DateTimeLocal" runat="server" ID="dtEventStart"></asp:TextBox>
                </div>




                <div class="form-group col-md-12">
                    <label for="EventImage">Choose image</label>

                    <span class="input-group-btn">
                        <span class="btn btn-primary btn-file">Browse
                        <asp:FileUpload ID="EventImage" runat="server" />
                        </span>
                    </span>
                </div>

                <asp:Button runat="server"
                    ID="btnCreateEvent"
                    Text="Create event"
                    CssClass="btn btn-success col-md-11"
                    OnClick="BtnCreateEvent_Click" />



            </div>
        </div>
    </div>
</asp:Content>
