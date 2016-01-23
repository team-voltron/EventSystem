namespace EventSystem.Models
{
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    using Common;

    public class Category
    {
        private ICollection<Event> events;

        public Category()
        {
            this.events = new HashSet<Event>();
        }

        [Key]
        public int Id { get; set; }

        [Required]
        [MinLength(ValidationConstants.MinCategoryNameLenght)]
        [MaxLength(ValidationConstants.MaxCategoryNameLenght)]
        public string Name { get; set; }

        public virtual ICollection<Event> Events
        {
            get { return this.events; }
            set { this.events = value; }
        }
    }
}