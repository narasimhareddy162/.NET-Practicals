namespace ProductCatalog.Models
{
    public static class ProductRepository
    {
        private static List<Product> _products = new List<Product>
        {
            new Product { Id = 1, Name = "Laptop",     Category = "Electronics", Price = 55000, Quantity = 10, Description = "14 inch, 8GB RAM" },
            new Product { Id = 2, Name = "Smartphone", Category = "Electronics", Price = 20000, Quantity = 25, Description = "128GB storage" },
            new Product { Id = 3, Name = "Notebook",   Category = "Stationery",  Price = 60,    Quantity = 200, Description = "200 pages" }
        };

        public static List<Product> GetAll()
        {
            return _products;
        }

        public static Product? GetById(int id)
        {
            return _products.FirstOrDefault(p => p.Id == id);
        }

        public static void Add(Product product)
        {
            product.Id = _products.Count == 0 ? 1 : _products.Max(p => p.Id) + 1;
            _products.Add(product);
        }

        public static void Update(Product product)
        {
            var existing = GetById(product.Id);
            if (existing != null)
            {
                existing.Name = product.Name;
                existing.Category = product.Category;
                existing.Price = product.Price;
                existing.Quantity = product.Quantity;
                existing.Description = product.Description;
            }
        }

        public static void Delete(int id)
        {
            var product = GetById(id);
            if (product != null)
            {
                _products.Remove(product);
            }
        }
    }
}