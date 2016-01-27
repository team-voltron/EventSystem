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

        public IQueryable<Category> UsersLiveView_GetData()
        {
            return this.dbContext
                .Categories
                .OrderByDescending(u => u.Events.Count)
                .Skip(0)
                .Take(5);
        }

        public IQueryable<Event> EventsListView_GetData()
        {
            return this.dbContext
                .Events
                .OrderBy(e => e.DateTimeStarts)
                .ThenByDescending(e => e.Comments.Count)
                .Skip(0)
                .Take(5);
        }

        
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
    }
}