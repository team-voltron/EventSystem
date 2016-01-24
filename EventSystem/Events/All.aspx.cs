namespace EventSystem.Events
{
    using System;
    using System.Collections.Generic;
    using System.Linq;

    using Models;

    public partial class All : System.Web.UI.Page
    {
        public EventSystemDbContext dbContext;

        public All()
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

        protected void LinkButtonSeach_Click(object sender, EventArgs e)
        {
            string queryParam = string.Format("?q={0}", this.TextBoxSearchParam.Text);
            Response.Redirect("~/Search" + queryParam);
        }
    }
}