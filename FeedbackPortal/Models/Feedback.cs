using System.ComponentModel.DataAnnotations;

namespace FeedbackPortal.Models
{
    public class Feedback
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "Name is required.")]
        [StringLength(50, MinimumLength = 2, ErrorMessage = "Name must be 2 to 50 characters.")]
        [Display(Name = "Full Name")]
        public string Name { get; set; } = string.Empty;

        [Required(ErrorMessage = "Email is required.")]
        [EmailAddress(ErrorMessage = "Enter a valid email address.")]
        public string Email { get; set; } = string.Empty;

        [Required(ErrorMessage = "Please select a category.")]
        public string Category { get; set; } = string.Empty;

        [Range(1, 5, ErrorMessage = "Please select a rating from 1 to 5.")]
        public int Rating { get; set; }

        [Required(ErrorMessage = "Comments are required.")]
        [StringLength(500, MinimumLength = 10, ErrorMessage = "Comments must be 10 to 500 characters.")]
        public string Comments { get; set; } = string.Empty;

        public DateTime SubmittedOn { get; set; }
    }
}