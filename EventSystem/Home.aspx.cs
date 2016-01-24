namespace EventSystem
{
    using System.Linq;

    using Models;

    public partial class Home : System.Web.UI.Page
    {
        protected EventSystemDbContext dbContext;

        public Home()
        {
            this.dbContext = new EventSystemDbContext();
        }

        public IQueryable<AppUser> UsersLiveView_GetData()
        {
            return this.dbContext.Users.OrderBy(u => u.UserName).Skip(0).Take(10);
        }

        public IQueryable<Event> EventsListView_GetData()
        {
            return this.dbContext.Events.OrderBy(e => e.Comments.Count).Skip(0).Take(10);
        }
    }
}