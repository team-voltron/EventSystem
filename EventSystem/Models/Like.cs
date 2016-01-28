namespace EventSystem.Models
{
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public class Like
    {
        [Key]
        [Column(Order = 0)]
        public string UserID
        {
            get; set;
        }

        [Key]
        [Column(Order = 1)]
        public int EventId
        {
            get; set;
        }

        public virtual Event Event
        {
            get; set;
        }

        public virtual AppUser User
        {
            get; set;
        }

        [Required]
        public int Value
        {
            get; set;
        }
    }
}