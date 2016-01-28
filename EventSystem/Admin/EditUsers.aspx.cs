using EventSystem.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventSystem.Admin
{
    public partial class EditUsers : System.Web.UI.Page
    {
        private EventSystemDbContext dbContext;

        public EditUsers()
        {
            this.dbContext = new EventSystemDbContext();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridviewData();
            }
        }

        protected void BindGridviewData()
        {
            DataTable dTable = new DataTable();
            dTable.Columns.Add("Username", typeof(string));
            dTable.Columns.Add("Is Admin", typeof(bool));
            var roles = this.dbContext.Roles;
            var users = this.dbContext.Users.Where(u => u.UserName != User.Identity.Name && u.UserName != "admin");

            foreach (AppUser u in users)
            {

                DataRow dRow = dTable.NewRow();
                var roleAdmin = roles.FirstOrDefault(r => r.Name == "admin");
                dRow[0] = u.UserName;
                dRow[1] = u.Roles.FirstOrDefault(r => r.RoleId == roleAdmin.Id) != null ? true : false;
                dTable.Rows.Add(dRow);
            }

            this.GridViewUsers.DataSource = dTable;
            this.GridViewUsers.DataBind();

            //this.GridViewUsers.UseAccessibleHeader = true;
            //this.GridViewUsers.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        protected void GridViewUsers_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                CheckBox c1 = (CheckBox)e.Row.Cells[1].Controls[0];
                c1.Enabled = true;
            }

        }

              protected void cmdUpdateRole_Click(object sender, EventArgs e)
        {
            var roleManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(new EventSystemDbContext()));
            var userManager = new UserManager<AppUser>(new UserStore<AppUser>(new EventSystemDbContext()));
            foreach (GridViewRow row in this.GridViewUsers.Rows)
            {
                string username = row.Cells[0].Text;
                CheckBox chkAdmin = (CheckBox)row.Cells[1].Controls[0];
                List<string> roles = new List<string>();

                var userId = this.dbContext.Users.Where(u => u.UserName == username).Select(u => u.Id).FirstOrDefault();

                if (chkAdmin.Checked)
                {
                    userManager.AddToRole(userId, "admin");
                }
                else
                {
                    userManager.RemoveFromRole(userId, "admin");
                }
            }

            BindGridviewData();
        }

        protected void GridViewUsers_PageIndexChanged(object sender, EventArgs e)
        {
            BindGridviewData();
        }

        protected void GridViewUsers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewUsers.PageIndex = e.NewPageIndex;
        }
    }
}