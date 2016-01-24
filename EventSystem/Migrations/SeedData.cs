namespace EventSystem.Migrations
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;

    using Models;

    public class SeedData
    {
        private static Random rand = new Random();

        private List<Category> categories;

        private List<Event> events;

        public SeedData(AppUser admin)
        {
            this.Categories = new List<Category>();
            this.Categories.Add(new Category() { Name = "Music" });
            this.Categories.Add(new Category() { Name = "Party" });
            this.Categories.Add(new Category() { Name = "Telerik academy" });
            this.Categories.Add(new Category() { Name = "Education" });
            this.Categories.Add(new Category() { Name = "Sport" });
            this.Categories.Add(new Category() { Name = "Martial arts" });
            this.Categories.Add(new Category() { Name = "Weather" });

            this.Events = new List<Event>();
            this.Events.Add(new Event()
            {
                Category = this.Categories[1],
                Name = "What is Lorem Ipsum?",
                Description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                Author = admin,
                DateCreated = DateTime.Now.AddDays(Rand.Next(-5, 5))
            });
        }

        public static Random Rand
        {
            get
            {
                return rand;
            }

            set
            {
                rand = value;
            }
        }

        public List<Category> Categories
        {
            get
            {
                return this.categories;
            }

            set
            {
                this.categories = value;
            }
        }

        public List<Event> Events
        {
            get
            {
                return this.events;
            }

            set
            {
                this.events = value;
            }
        }
    }
}