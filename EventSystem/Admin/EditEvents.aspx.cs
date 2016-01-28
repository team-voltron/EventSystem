namespace EventSystem.Admin
{
    using System;
    using System.Linq;
    using System.Web.UI;

    using Models;
    using System.Web.UI.WebControls;
    using System.Data;

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

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }
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

        

        protected void GridViewBooks_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    DropDownList ddList = (DropDownList)e.Row.FindControl("DropDownList1");
                    var cats = this.dbContext.Categories.ToArray();
                    ddList.DataSource = cats;
                    ddList.DataTextField = "Name";
                    ddList.DataValueField = "Name";
                    ddList.DataBind();
                }
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridViewBooks_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewBooks.EditIndex = e.NewEditIndex;
            this.DataBind();
        }
    }
}