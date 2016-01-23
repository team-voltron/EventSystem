namespace EventSystem.Migrations
{
    using System.Data.Entity.Migrations;
    using System.Linq;

    using Models;
    using System.Collections.Generic;
    using System;

    public sealed class Configuration : DbMigrationsConfiguration<EventSystemDbContext>
    {
        public Configuration()
        {
            this.AutomaticMigrationsEnabled = true;
            this.AutomaticMigrationDataLossAllowed = true;
        }

        protected override void Seed(EventSystemDbContext context)
        {
            if (context.Events.Any())
            {
                return;
            }

            IList<AppUser> users = new List<AppUser>()
            {
                new AppUser()
                {
                    Email = "pesho@abv.bg",
                    /// 123456Aa!
                    PasswordHash = "AHaoBiaoISp32aChotoxeeRDTsBrTEJbPhd5bBq1ifPwt5hDnS9063DZc2CRaR/QzQ=="
                }
            };

            IList<Category> categories = new List<Category>()
            {
                new Category() { Name = "Music" },
                new Category() { Name = "Party" },
                new Category() { Name = "Telerik academy" },
                new Category() { Name = "Sport" },
                new Category() { Name = "Martial arts" },
            };

            List<Event> events = new List<Event>()
            {
                new Event()
                {
                    Name = "C#",
                    Author = users[0],
                    Description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    Category = categories[2],
                    Date = DateTime.Now,
                    Comments = new List<Comment>()
                    {
                        new Comment()
                        {
                            Content = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                            Author = users[0],
                            DateCreated = DateTime.Now,
                        }
                    }
                }, new Event()
                {
                    Name = "JS",
                    Author = users[0],
                    Description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    Category = categories[2],
                    Date = DateTime.Now,
                    Comments = new List<Comment>()
                    {
                        new Comment()
                        {
                            Content = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                            Author = users[0],
                            DateCreated = DateTime.Now,
                        }
                    }
                }
            };

            context.Events.AddOrUpdate(events.ToArray());
        }
    }
}
