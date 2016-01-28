<%@ Page Title="Edit Events" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditEvents.aspx.cs" Inherits="EventSystem.Admin.EditEvents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h3 class="text-center alert alert-info col-md-8 col-md-offset-2 modal-content"><%: this.Title %></h3>
    <asp:Panel ID="AAA" runat="server" CssClass="col-md-8 col-md-offset-2 modal-content">
        <asp:GridView runat="server"
            OnRowDataBound="GridViewBooks_RowDataBound"
            OnRowEditing="GridViewBooks_RowEditing"
            ID="GridViewBooks"
            ItemType="EventSystem.Models.Event"
            SelectMethod="GridViewBooks_GetData"
            UpdateMethod="GridViewBooks_UpdateItem"
            DeleteMethod="GridViewBooks_DeleteItem"
            AutoGenerateColumns="false"
            AllowSorting="true"
            AllowPaging="true"
            PageSize="5"
            DataKeyNames="ID"
            CssClass="table table-responsive table-condensed table-striped info content-table"
            GridLines="None">

            <Columns>
                <asp:BoundField
                    DataField="Name"
                    HeaderText="Name"
                    SortExpression="Name" />

                <asp:BoundField
                    ReadOnly="true"
                    DataField="DateCreated"
                    HeaderText="Date Created"
                    SortExpression="DateCreated" />

                <asp:TemplateField HeaderText="Category" SortExpression="Category" >
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"
                            AutoPostBack="true">
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Item.Category.Name %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <%--<asp:BoundField
                    DataField="Category.Name"
                    HeaderText="Category Name"
                    SortExpression="Category.Name" />--%>

                <asp:BoundField
                    ReadOnly="true"
                    DataField="Author.UserName"
                    HeaderText="Author Username"
                    SortExpression="Author.UserName" />

                <asp:CommandField
                    HeaderText="Action"
                    ControlStyle-CssClass="btn btn-sm btn-danger"
                    ShowEditButton="true"
                    ShowDeleteButton="true" />
            </Columns>
            <PagerStyle CssClass="pagination-ys" />
        </asp:GridView>
    </asp:Panel>

</asp:Content>
