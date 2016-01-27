using EventSystem.Common;
using EventSystem.Models;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.IO;
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
                this.Page.Validators.Add(err);
            }

            var newEvent = new Event()
            {
                AuthorId = author,
                Description = this.tbDescription.Text,
                Name = this.tbName.Text,
                DateCreated = DateTime.Now,
                CategoryId = int.Parse(this.DropDownCategories.SelectedValue)
            };

            if (!string.IsNullOrEmpty(this.dtEventStart.Text))
            {
                DateTime startDate;

                if (DateTime.TryParse(this.dtEventStart.Text, out startDate))
                {
                    newEvent.DateTimeStarts = startDate;
                }
            }
 
            if (this.EventImage.HasFile)
            {
                string filename = Path.GetFileName(this.EventImage.FileName);
                var extension = filename.Substring(filename.LastIndexOf('.') + 1);
                if (!ValidationConstants.AllowedExtensions.Contains(extension))
                {
                    var err = new CustomValidator();
                    err.IsValid = false;
                    err.ErrorMessage = "Please upload image with allowed extension (png/jpg/gif/bmp)!";
                    this.Page.Validators.Add(err);
                    return;
                }

                var imagesPath = this.Server.MapPath("~/Public/EventImages/");

                if (!Directory.Exists(imagesPath))
                {
                    Directory.CreateDirectory(imagesPath);
                }

                this.EventImage.SaveAs(imagesPath + filename);
                newEvent.ImageLocation = "/Public/EventImages/" + filename;
            }

            this.db.Events.Add(newEvent);
            this.db.SaveChanges();

            this.Response.Redirect("~/Home");
        }
    }
}