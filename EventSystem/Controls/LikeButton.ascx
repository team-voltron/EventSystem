<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LikeButton.ascx.cs" Inherits="EventSystem.Controls.LikeButton" %>
<script type="text/javascript">
    function makeLike() {
        var start = "<iframe src=\"http://www.facebook.com/plugins/like.php?href=";
        var end = "&layout=standard&show_faces=true&width=210&action=like&font&colorscheme=light&height=210\" scrolling=\"no\" frameborder=\"0\" style=\"border:none;\"" + "overflow:hidden; width:210px; height:80px;\"" + "allowTransparency=\"true\"></iframe>";
        var ifr = start + document.location.href + end;
        document.getElementById("like").innerHTML = ifr;
    }
    window.onload = makeLike;
</script>
<div id="like">[Like button control]</div>