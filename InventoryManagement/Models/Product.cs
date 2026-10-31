using System.ComponentModel.DataAnnotations;

namespace InventoryManagement.Models
{
    public class Product
    {
        public int ProductId { get; set; }

        [Required(ErrorMessage = "Product name is required")]
        [StringLength(100)]
        [Display(Name = "Product Name")]
        public string ProductName { get; set; } = string.Empty;

        [Required(ErrorMessage = "Category is required")]
        [StringLength(50)]
        public string Category { get; set; } = string.Empty;

        [Range(0, 100000, ErrorMessage = "Quantity must be 0 or more")]
        public int Quantity { get; set; }

        [Range(0.01, 10000000, ErrorMessage = "Enter a valid price")]
        [Display(Name = "Unit Price")]
        public decimal UnitPrice { get; set; }
    }
}