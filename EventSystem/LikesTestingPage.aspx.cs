namespace EventSystem
{
    using System.Linq;
    using System.Web.ModelBinding;
    using Microsoft.AspNet.Identity;

    using Controls;
    using Models;

    public partial class LikesTestingPage : System.Web.UI.Page
    {
        private EventSystemDbContext dbContext;

        public LikesTestingPage()
        {
            this.dbContext = new EventSystemDbContext();
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

        public EventSystem.Models.Event FormViewArticle_GetItem([QueryString("id")]int? id)
        {
            //return this.dbContext.Articles.FirstOrDefault(a => a.ID == id);
            return this.dbContext.Events.FirstOrDefault(e => e.Id == 1);
        }

        protected void LikeControl_Like(object sender, LikeEventArgs e)
        {
            string userID = this.User.Identity.GetUserId();
            Event article = this.dbContext.Events.Find(e.DataID);
            Like like = article.Likes.FirstOrDefault(l => l.UserID == userID);
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
            control.Value = article.Likes.Sum(l => l.Value);
            control.CurrentUserVote = e.LikeValue;
        }
    }
}