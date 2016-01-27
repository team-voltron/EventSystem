namespace EventSystem.Events
{
    using EventSystem.Models;
    using Microsoft.AspNet.Identity;
    using System;
    using System.Linq;
    using System.Web.ModelBinding;
    using System.Web.UI.WebControls;

    public partial class Details : System.Web.UI.Page
    {
        private EventSystemDbContext dbContext;

        public Details()
        {
            this.dbContext = new EventSystemDbContext();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public Event FormVideEventDetails_GetItem([QueryString("id")]int? eventId)
        {
            if (eventId == null)
            {
                this.Response.Redirect("~/");
            }

            var currentEvent = this.dbContext.Events.FirstOrDefault(e => e.Id == eventId);

            return currentEvent;
        }

        protected void InsertButton_Click(object sender, EventArgs e)
        {
            var eventId = int.Parse(this.Request.QueryString["Id"]);
            var commentSection = this.FormVideEventDetails.FindControl("EventComments") as ListView;
            var commentTb = commentSection.InsertItem.FindControl("CommentContent") as TextBox;
            var messageLabel = commentSection.FindControl("CommentMessage") as Label;
            var commentText = commentTb.Text;

            if (string.IsNullOrWhiteSpace(commentText))
            {
                messageLabel.Text = "The comment cannot be empty or whitespace!";
                messageLabel.Visible = true;
                messageLabel.CssClass = "text-danger";
                return;
            }

            var comment = new Comment()
            {
                Content = commentText,
                AuthorId = this.User.Identity.GetUserId(),
                DateCreated = DateTime.Now,
                EventId = eventId,
            };

            this.dbContext.Comments.Add(comment);
            this.dbContext.SaveChanges();
            this.DataBind();
        }
    }
}