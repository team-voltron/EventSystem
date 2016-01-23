namespace EventSystem
{
    using System;
    using System.Linq;
    using System.Web.ModelBinding;

    using Models;

    public partial class EventDetails : System.Web.UI.Page
    {
        private EventSystemDbContext dbContext;

        public EventDetails()
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
    }
}