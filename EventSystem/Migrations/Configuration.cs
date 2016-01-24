namespace EventSystem.Migrations
{
    using System.Data.Entity.Migrations;
    using System.Linq;
    using Models;
    using Microsoft.AspNet.Identity.EntityFramework;
    using Microsoft.AspNet.Identity;
    using Microsoft.AspNet.Identity.Owin;

    public sealed class Configuration : DbMigrationsConfiguration<EventSystemDbContext>
    {
        public Configuration()
        {
            this.AutomaticMigrationsEnabled = true;
            this.AutomaticMigrationDataLossAllowed = true;
        }

        protected override void Seed(EventSystemDbContext context)
        {
            if (!context.Users.Any())
            {
                var roleStore = new RoleStore<IdentityRole>(context);
                var roleManager = new RoleManager<IdentityRole>(roleStore);
                var userStore = new UserStore<AppUser>(context);
                var userManager = new UserManager<AppUser>(userStore);

                // Add missing roles
                var roleAdmin = roleManager.FindByName("admin");
                if (roleAdmin == null)
                {
                    roleAdmin = new IdentityRole("admin");
                    roleManager.Create(roleAdmin);
                }

                var roleUser = roleManager.FindByName("user");
                if (roleUser == null)
                {
                    roleUser = new IdentityRole("user");
                    roleManager.Create(roleUser);
                }

                // Create test users
                var userAdmin = userManager.FindByName("admin");
                if (userAdmin == null)
                {
                    var newUser = new AppUser()
                    {
                        UserName = "admin",
                        Email = "admin@admin.com"
                    };

                    userManager.Create(newUser, "123456");
                    userManager.SetLockoutEnabled(newUser.Id, true);
                    userManager.AddToRole(newUser.Id, "admin");
                }

                var user = userManager.FindByName("test");
                if (user == null)
                {
                    var newUser = new AppUser()
                    {
                        UserName = "test",
                        Email = "test@test.com"
                    };

                    userManager.Create(newUser, "123456");
                    userManager.SetLockoutEnabled(newUser.Id, true);
                    userManager.AddToRole(newUser.Id, "user");
                }
            }

            if (!context.Categories.Any())
            {
                var user = context.Users.FirstOrDefault(u => u.UserName == "test");
                var seedData = new SeedData(user);
                context.Events.AddOrUpdate(seedData.Events.ToArray());
                context.Categories.AddOrUpdate(seedData.Categories.ToArray());
                context.SaveChanges();
            }
        }
    }
}