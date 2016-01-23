namespace EventSystem.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.Web.Providers.Entities;

    using Common;

    public class Event
    {
        private ICollection<User> users;
        private ICollection<Comment> comments;

        public Event()
        {
            this.users = new HashSet<User>();
            this.comments = new HashSet<Comment>();
        }

        [Key]
        public int Id { get; set; }

        [Required]
        [MaxLength(ValidationConstants.MaxEventName)]
        public string Name { get; set; }

        [Required]
        [MaxLength(ValidationConstants.MaxEventDescription)]
        public string Description { get; set; }

        public DateTime Date { get; set; }

        public string AuthorId { get; set; }

        public virtual AppUser Author { get; set; }

        public int? CategoryId { get; set; }

        public virtual Category Category { get; set; }

        public virtual ICollection<User> Users
        {
            get { return this.users; }
            set { this.users = value; }
        }

        public virtual ICollection<Comment> Comments
        {
            get { return this.comments; }
            set { this.comments = value; }
        }
    }
}