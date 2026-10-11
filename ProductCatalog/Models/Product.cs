using System.ComponentModel.DataAnnotations;

namespace ProductCatalog.Models
{
    public class Product
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "Product name is required")]
        [StringLength(50, ErrorMessage = "Name cannot exceed 50 characters")]
        public string Name { get; set; } = string.Empty;

        [Required(ErrorMessage = "Category is required")]
        public string Category { get; set; } = string.Empty;

        [Range(1, 1000000, ErrorMessage = "Price must be between 1 and 1000000")]
        public decimal Price { get; set; }

        [Range(0, 10000, ErrorMessage = "Quantity must be between 0 and 10000")]
        public int Quantity { get; set; }

        [StringLength(200)]
        public string? Description { get; set; }
    }
}