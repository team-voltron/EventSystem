namespace EventSystem.Events
{
    using Controls;
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
            if (this.IsPostBack)
            {
                return;
            }
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

            var userId = this.User.Identity.GetUserId();
            var user = this.dbContext.Users.Where(u => u.Id == userId).FirstOrDefault();
            var currentEvent = this.dbContext.Events.Find(eventId);

            currentEvent.Comments.Add(new Comment
            {
                Content = commentText,
                DateCreated = DateTime.Now,
                Author = user
            });

            this.dbContext.SaveChanges();
            this.DataBind();
        }

        protected void JoinEventBtn_Click(object sender, EventArgs e)
        {
            var eventId = int.Parse(this.Request.QueryString["Id"]);
            var userId = this.User.Identity.GetUserId();
            var currentEvent = this.dbContext.Events.FirstOrDefault(ev => ev.Id == eventId);
            var user = this.dbContext.Users.Where(u => u.Id == userId).FirstOrDefault();

            var participantSection = this.FormVideEventDetails.FindControl("EventParticipants") as ListView;
            var messageLabel = participantSection.FindControl("ParticipantMessage") as Label;

            if (user == null || currentEvent == null)
            {
                throw new Exception("There was a fatal error!");
            }

            if (currentEvent.Users.Any(u => u.Id == userId))
            {
                messageLabel.Text = "You cannot join the same event twice!";
                messageLabel.Visible = true;
                messageLabel.CssClass = "text-danger";
                return;
            }

            currentEvent.Users.Add(user);
            this.dbContext.SaveChanges();
            this.DataBind();
        }

        protected int GetLikes(Event item)
        {
            if (item.Likes.Count > 0)
            {
                return item.Likes.Sum(l => l.Value);
            }

            return 0;
        }

        protected int GetCurrentUserVote(Event item)
        {
            string userID = this.User.Identity.GetUserId();
            Like like = item.Likes.FirstOrDefault(l => l.UserID == userID);
            if (like == null)
            {
                return 0;
            }

            return like.Value;
        }

        protected void LikeControl_Like(object sender, LikeEventArgs e)
        {
            string userID = this.User.Identity.GetUserId();
            Event currentEvent = this.dbContext.Events.Find(e.DataID);
            Like like = currentEvent.Likes.FirstOrDefault(l => l.UserID == userID);
            if (like == null)
            {
                like = new Like()
                {
                    UserID = userID,
                };

                this.dbContext.Events.Find(e.DataID).Likes.Add(like);
            }

            like.Value = e.LikeValue;
            this.dbContext.SaveChanges();

            var control = sender as LikeControl;
            control.Value = currentEvent.Likes.Sum(l => l.Value);
            control.CurrentUserVote = e.LikeValue;
        }
    }
}