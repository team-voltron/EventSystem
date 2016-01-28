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

        private List<Comment> comments;

        private List<Like> likes;

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
                DateCreated = DateTime.Now.AddDays(Rand.Next(-5, 5)),
                DateTimeStarts = DateTime.Now.AddDays(Rand.Next(2, 15))
            });
            this.Events.Add(new Event()
            {
                Category = this.Categories[0],
                Name = "What is not Lorem Ipsum?",
                Description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                Author = admin,
                DateCreated = DateTime.Now.AddDays(Rand.Next(-5, 5)),
                DateTimeStarts = DateTime.Now.AddDays(Rand.Next(2, 15))
            });
            this.Events.Add(new Event()
            {
                Category = this.Categories[2],
                Name = "What is Lorem Ipsum? A?",
                Description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                Author = admin,
                DateCreated = DateTime.Now.AddDays(Rand.Next(-5, 5)),
                DateTimeStarts = DateTime.Now.AddDays(Rand.Next(2, 15))
            });

            this.Events.Add(new Event()
            {
                Category = this.Categories[3],
                Name = "What is ...?",
                Description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                Author = admin,
                DateCreated = DateTime.Now.AddDays(Rand.Next(-5, 5)),
                DateTimeStarts = DateTime.Now.AddDays(Rand.Next(2, 15))
            });

            this.Events.Add(new Event()
            {
                Category = this.Categories[4],
                Name = "What is ...?",
                Description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                Author = admin,
                DateCreated = DateTime.Now.AddDays(Rand.Next(-5, 5)),
                DateTimeStarts = DateTime.Now.AddDays(Rand.Next(2, 15))
            });

            this.Events.Add(new Event()
            {
                Category = this.Categories[3],
                Name = "What...?",
                Description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                Author = admin,
                DateCreated = DateTime.Now.AddDays(Rand.Next(-5, 5)),
                DateTimeStarts = DateTime.Now.AddDays(Rand.Next(2, 15))
            });

            this.Events.Add(new Event()
            {
                Category = this.Categories[2],
                Name = "Who is... ?",
                Description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                Author = admin,
                DateCreated = DateTime.Now.AddDays(Rand.Next(-5, 5)),
                DateTimeStarts = DateTime.Now.AddDays(Rand.Next(2, 15))
            });

            this.Events.Add(new Event()
            {
                Category = this.Categories[0],
                Name = "Who is prof.X ?",
                Description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                Author = admin,
                DateCreated = DateTime.Now.AddDays(Rand.Next(-5, 5)),
                DateTimeStarts = DateTime.Now.AddDays(Rand.Next(2, 15))
            });

            this.Events.Add(new Event()
            {
                Category = this.Categories[2],
                Name = "Web Forms",
                Description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                Author = admin,
                DateCreated = DateTime.Now.AddDays(Rand.Next(-5, 5)),
                DateTimeStarts = DateTime.Now.AddDays(Rand.Next(2, 15))
            });

            this.Events.Add(new Event()
            {
                Category = this.Categories[2],
                Name = "ASP.NET",
                Description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                Author = admin,
                DateCreated = DateTime.Now.AddDays(Rand.Next(-5, 5)),
                DateTimeStarts = DateTime.Now.AddDays(Rand.Next(2, 15))
            });

            this.Events.Add(new Event()
            {
                Category = this.Categories[2],
                Name = "ASP.NET WebForms",
                Description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                Author = admin,
                DateCreated = DateTime.Now.AddDays(Rand.Next(-5, 5)),
                DateTimeStarts = DateTime.Now.AddDays(Rand.Next(2, 15))
            });

            this.Comments = new List<Comment>();
            this.Comments.Add(new Comment()
            {
                DateCreated = DateTime.Now.AddDays(Rand.Next(-5, 0)),
                Event = this.Events[0],
                Content = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                Author = admin
            });
            this.Comments.Add(new Comment()
            {
                DateCreated = DateTime.Now.AddDays(Rand.Next(-5, 0)),
                Event = this.Events[0],
                Content = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                Author = admin
            });
            this.Comments.Add(new Comment()
            {
                DateCreated = DateTime.Now.AddDays(Rand.Next(-5, 0)),
                Event = this.Events[0],
                Content = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                Author = admin
            });
            this.Comments.Add(new Comment()
            {
                DateCreated = DateTime.Now.AddDays(Rand.Next(-5, 0)),
                Event = this.Events[1],
                Content = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                Author = admin
            });
            this.Comments.Add(new Comment()
            {
                DateCreated = DateTime.Now.AddDays(Rand.Next(-5, 0)),
                Event = this.Events[1],
                Content = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                Author = admin
            });
            this.Comments.Add(new Comment()
            {
                DateCreated = DateTime.Now.AddDays(Rand.Next(-5, 0)),
                Event = this.Events[1],
                Content = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                Author = admin
            });
            this.Comments.Add(new Comment()
            {
                DateCreated = DateTime.Now.AddDays(Rand.Next(-5, 0)),
                Event = this.Events[2],
                Content = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                Author = admin
            });

            this.Likes = new List<Like>();
            this.Likes.Add(new Like()
            {
                Event = this.Events[3],
                Value = 100,
                User = admin
            });
            this.Likes.Add(new Like()
            {
                Event = this.Events[2],
                Value = 420,
                User = admin
            });
            this.Likes.Add(new Like()
            {
                Event = this.Events[1],
                Value = 63,
                User = admin
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

        public List<Comment> Comments
        {
            get
            {
                return this.comments;
            }

            set
            {
                this.comments = value;
            }
        }

        public List<Like> Likes
        {
            get
            {
                return this.likes;
            }

            set
            {
                this.likes = value;
            }
        }
    }
}