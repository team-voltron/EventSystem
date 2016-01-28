<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MindYourLanguage.ascx.cs" Inherits="EventSystem.Controls.MindYourLanguage" %>

<script runat="server">
    protected void Sanitize_Click(Object sender, EventArgs e)
    {
        var wordsToSanitize = new[] { "fuck", "shit", "idiot", "dickhead", "bitch" };
        var text = this.textToSinitize.Text;
        foreach (var word in wordsToSanitize)
        {
            text = text.Replace(word, "***");
        }

        this.textToSinitize.Text = text;
        this.literalResult.Text = text;
    }
</script>

<div class="container">
    <div class="form-group col-md-9">
        <div class="col-md-3">
            <label for="textToSinitize">
                <h3>Your text here:</h3>
            </label>
        </div>
        <div class="col-md-9">
            <div class="row">
                <asp:Literal ID="literalResult" runat="server" />
            </div>
            <div class="row">
                <asp:TextBox
                    CssClass="form-control"
                    ID="textToSinitize"
                    TextMode="MultiLine"
                    runat="server" />
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <asp:Button
            CssClass="btn btn-lg btn-success"
            ID="textSend"
            runat="server"
            Text="Submit"
            OnClick="Sanitize_Click" />
    </div>
</div>
