using EventSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventSystem.Events
{
    public partial class ByCategory : System.Web.UI.Page
    {
        private EventSystemDbContext dbContext;
       

        public ByCategory()
        {
            this.dbContext = new EventSystemDbContext();
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IEnumerable<Event> Repeater_GetData([QueryString("id")] string query)
        {
            var id = int.Parse(query);

            this.LiteralSearchQuery.Text = string.Format("“{0}”", this.dbContext.Categories.FirstOrDefault(c=>c.Id==id).Name);
            var events = this.dbContext.Events.Where(e => e.Category.Id == id);

            return events;
        }
    }
}