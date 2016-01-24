using EventSystem.Models;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventSystem.Events
{
    public partial class Create : System.Web.UI.Page
    {
        private EventSystemDbContext db;

        public Create()
        {
            this.db = new EventSystemDbContext();
        }

        protected void Page_PreLoad(object sender, EventArgs e)
        {
            this.DropDownCategories.DataSource = this.db.Categories.OrderBy(c => c.Name).ToList();
            this.DropDownCategories.DataBind();
        }

        protected void BtnCreateEvent_Click(object sender, EventArgs e)
        {
            var author = this.User.Identity.GetUserId();

            if (author == null)
            {
                var err = new CustomValidator();
                err.IsValid = false;
                err.ErrorMessage = "You are not logged in!";
                Page.Validators.Add(err);
            }

            var newEvent = new Event()
            {
                AuthorId = author,
                Description = this.tbDescription.Text,
                Name = this.tbName.Text,
                DateCreated = DateTime.Now,
                CategoryId = int.Parse(this.DropDownCategories.SelectedValue)
            };

            this.db.Events.Add(newEvent);
            this.db.SaveChanges();
        }
    }
}