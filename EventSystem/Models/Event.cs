namespace EventSystem.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.IO;

    using Common;

    public class Event
    {
        private ICollection<AppUser> users;
        private ICollection<Comment> comments;

        public Event()
        {
            this.users = new HashSet<AppUser>();
            this.comments = new HashSet<Comment>();
            this.ImageLocation = Path.Combine("~/", "Public", "Default", "Event", "1453918504_free-20.png");
        }

        public int Id { get; set; }

        [Required]
        [MaxLength(ValidationConstants.MaxEventName)]
        public string Name { get; set; }

        [Required]
        [MaxLength(ValidationConstants.MaxEventDescription)]
        public string Description { get; set; }

        [Required]
        public DateTime DateCreated { get; set; }

        public DateTime? DateTimeStarts { get; set; }

        public string ImageLocation { get; set; }

        public string AuthorId { get; set; }

        public virtual AppUser Author { get; set; }

        public int CategoryId { get; set; }

        public virtual Category Category { get; set; }

        public virtual ICollection<AppUser> Users
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