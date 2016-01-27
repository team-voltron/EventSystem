namespace EventSystem
{
    using System;
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
            return this.dbContext.Users.OrderBy(u => u.UserName).Skip(0).Take(5);
        }

        public IQueryable<Event> EventsListView_GetData()
        {
            return this.dbContext.Events.OrderBy(e => e.Comments.Count).Skip(0).Take(5);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Cache["time"] == null)
            {
                this.Cache["time"] = DateTime.Now.ToString();
            }

            if (this.Cache["eventsTotal"] == null)
            {
                this.Cache["eventsTotal"] = this.dbContext.Events.Count();
            }

            if (this.Cache["usersTotal"] == null)
            {
                this.Cache["usersTotal"] = this.dbContext.Users.Count();
            }

            this.LabelUsersTotal.Text = this.Cache["usersTotal"].ToString();
            this.LabelEventsTotal.Text = this.Cache["eventsTotal"].ToString();
            this.LabelTime.Text = this.Cache["time"].ToString();
        }
    }
}