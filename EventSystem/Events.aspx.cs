namespace EventSystem
{
    using Models;
    using System;
    using System.Collections.Generic;

    public partial class Events : System.Web.UI.Page
    {
        public EventSystemDbContext dbContext;

        public Events()
        {
            this.dbContext = new EventSystemDbContext();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public IEnumerable<Category> RepeatCategories_GetData()
        {
            return this.dbContext.Categories;
        }
    }
}