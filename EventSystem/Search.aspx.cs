namespace EventSystem
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web.ModelBinding;

    using EventSystem.Models;

    public partial class Search : System.Web.UI.Page
    {
        private EventSystemDbContext dbContext;

        public Search()
        {

            this.dbContext = new EventSystemDbContext();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public IEnumerable<Event> Repeater_GetData([QueryString("q")] string query)
        {
            this.LiteralSearchQuery.Text = string.Format("“{0}”:", query);

            var events = this.dbContext.Events.Where(e => e.Name.Contains(query));

            return events;
        }

        protected string GetName(Event currentEvent)
        {
            return string.Format("{0}", this.Server.HtmlEncode(currentEvent.Name));
        }
    }
}