namespace EventSystem.Models
{
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    using Common;

    public class Category
    {
        public Category()
        {
            this.Events = new HashSet<Event>();
        }

        [Key]
        public int Id { get; set; }

        [Required]
        [Index(IsUnique = true)]
        [MinLength(ValidationConstants.MinCategoryNameLenght)]
        [MaxLength(ValidationConstants.MaxCategoryNameLenght)]
        public string Name { get; set; }

        public virtual ICollection<Event> Events { get; set; }
    }
}