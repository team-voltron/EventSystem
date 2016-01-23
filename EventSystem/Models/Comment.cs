namespace EventSystem.Models
{
    using System;
    using System.ComponentModel.DataAnnotations;

    using Common;

    public class Comment
    {
        [Key]
        public int Id
        {
            get; set;
        }

        [Required]
        [MinLength(ValidationConstants.MinCommentContentLenght)]
        [MaxLength(ValidationConstants.MaxCommentContentLenght)]
        public string Content { get; set; }

        [Required]
        public DateTime DateCreated { get; set; }

        public int EventId { get; set; }

        public virtual Event Event { get; set; }

        public string AuthorId { get; set; }

        public virtual AppUser Author { get; set; }
    }
}