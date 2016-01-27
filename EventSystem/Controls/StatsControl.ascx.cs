namespace EventSystem.Controls
{
    using Models;
    using System;
    using System.Linq;
    using System.Web.UI;
    using EventSystem.Common;

    [PartialCaching(CommonConstants.TimeForChaching)]
    public partial class StatsControl : System.Web.UI.UserControl
    {
        private EventSystemDbContext dbContext;

        public StatsControl()
        {
            this.dbContext = new EventSystemDbContext();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            this.LabelCategoriesTotal.Text = this.dbContext.Categories.Count().ToString();
            this.LabelEventsTotal.Text = this.dbContext.Events.Count().ToString();
            this.LabelTime.Text = DateTime.Now.ToString();
        }
    }
}