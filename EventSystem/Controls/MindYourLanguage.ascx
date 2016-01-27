<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MindYourLanguage.ascx.cs" Inherits="EventSystem.Controls.MindYourLanguage" %>

<script runat="server">
    protected void Sanitize_Click(Object sender, EventArgs e)
    {
        var wordsToSanitize = new[] { "fuck", "shit", "idiot", "dickhead" };
        var text = this.textToSinitize.Text;
        foreach (var word in wordsToSanitize)
        {
            text = text.Replace(word, "***");
        }

        this.textToSinitize.Text = text;
    }
</script>

<div class="row">
    <asp:TextBox 
        ID="textToSinitize" 
        TextMode="MultiLine"
        runat="server"/>
    <asp:Button 
        ID="textSend" 
        runat="server"
        Text="Submit" 
        OnClick="Sanitize_Click" />
</div>
