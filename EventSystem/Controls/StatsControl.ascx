<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StatsControl.ascx.cs" Inherits="EventSystem.Controls.StatsControl" CodeFile="StatsControl.ascx.cs" %>

<div class="row">
    <div class="col-md-4 text-center">
        <h4>
            <strong>Total categories: </strong>
            <asp:Label runat="server" ID="LabelCategoriesTotal" CssClass="badge" />
        </h4>
    </div>
    <div class="col-md-4 text-center">
        <h4>
            <strong>Last update at: </strong>
            <br />
            <asp:Label runat="server" ID="LabelTime" CssClass="badge" />
        </h4>
    </div>
    <div class="col-md-4 text-center">
        <h4>
            <strong>Total events: </strong>
            <asp:Label runat="server" ID="LabelEventsTotal" CssClass="badge" />
        </h4>
    </div>
</div>

