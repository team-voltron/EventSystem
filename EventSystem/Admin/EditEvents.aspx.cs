namespace EventSystem.Admin
{
    using System;
    using System.Linq;
    using System.Web.UI;

    using Models;

    public partial class EditEvents : Page
    {
        private EventSystemDbContext dbContext;

        public EditEvents()
        {
            this.dbContext = new EventSystemDbContext();
        }

        public IQueryable<EventSystem.Models.Event> GridViewBooks_GetData()
        {
            return this.dbContext.Events.OrderBy(e => e.DateCreated);
        }

        public void GridViewBooks_UpdateItem(int id)
        {
            Event eventToUpdate = this.dbContext.Events.FirstOrDefault(e => e.Id == id);
            if (eventToUpdate == null)
            {
                this.ModelState.AddModelError(string.Empty, string.Format("Event item with id {0} was not found", id));

                return;
            }

            this.TryUpdateModel(eventToUpdate);
            if (this.ModelState.IsValid)
            {
                this.dbContext.SaveChanges();
            }
        }

        public void GridViewBooks_DeleteItem(int id)
        {
            var eventToDelete = this.dbContext.Events.FirstOrDefault(e => e.Id == id);

            if (eventToDelete == null)
            {
                this.ModelState.AddModelError(string.Empty, string.Format("Event item with id {0} was not found", id));

                return;
            }

            this.dbContext.Events.Remove(eventToDelete);
            this.dbContext.SaveChanges();
        }
    }
}