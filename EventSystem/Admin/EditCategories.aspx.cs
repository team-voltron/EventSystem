namespace EventSystem.Admin
{
    using System;
    using System.Linq;
    using System.Web.UI.HtmlControls;

    using Models;

    public partial class EditCategories : System.Web.UI.Page
    {
        private EventSystemDbContext dbContext;
        private HtmlGenericControl insertRow;

        public EditCategories()
        {
            this.dbContext = new EventSystemDbContext();
        }

        public IQueryable<Category> ListViewCategories_GetData()
        {
            return this.dbContext.Categories.OrderBy(cat => cat.Name);
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void ListViewCategories_UpdateItem(int ID)
        {
            var category = this.dbContext.Categories.Find(ID);
            if (category == null)
            {
                this.ModelState.AddModelError(string.Empty, string.Format("Item with id {0} was not found", ID));

                return;
            }

            this.TryUpdateModel(category);
            if (this.ModelState.IsValid)
            {
                this.dbContext.SaveChanges();
            }
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void ListViewCategories_DeleteItem(int ID)
        {
            var category = this.dbContext.Categories.Find(ID);
            this.dbContext.Categories.Remove(category);
            this.dbContext.SaveChanges();
        }

        public void ListViewCategories_InsertItem()
        {
            var newCategory = new Category();
            this.TryUpdateModel(newCategory);
            if (this.ModelState.IsValid)
            {
                this.dbContext.Categories.Add(newCategory);
                this.dbContext.SaveChanges();
            }
        }
    }
}