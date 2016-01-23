namespace EventSystem
{
    using System;
    using System.Collections.Generic;
    using System.Linq;

    using Models;

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

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<Category> ListViewCategories_GetData()
        {
            return this.dbContext.Categories;
        }
    }
}