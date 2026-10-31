using InventoryManagement.Models;
using Microsoft.Data.SqlClient;

namespace InventoryManagement.Data
{
    public class InventoryRepository
    {
        private readonly string _connectionString;

        public InventoryRepository(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("DefaultConnection")!;
        }

        // READ: all rows
        public List<Product> GetAll()
        {
            var list = new List<Product>();
            using var con = new SqlConnection(_connectionString);
            using var cmd = new SqlCommand(
                "SELECT ProductId, ProductName, Category, Quantity, UnitPrice FROM Products ORDER BY ProductId DESC", con);
            con.Open();
            using var reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                list.Add(new Product
                {
                    ProductId = reader.GetInt32(0),
                    ProductName = reader.GetString(1),
                    Category = reader.GetString(2),
                    Quantity = reader.GetInt32(3),
                    UnitPrice = reader.GetDecimal(4)
                });
            }
            return list;
        }

        // READ: one row
        public Product? GetById(int id)
        {
            using var con = new SqlConnection(_connectionString);
            using var cmd = new SqlCommand(
                "SELECT ProductId, ProductName, Category, Quantity, UnitPrice FROM Products WHERE ProductId = @Id", con);
            cmd.Parameters.AddWithValue("@Id", id);
            con.Open();
            using var reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                return new Product
                {
                    ProductId = reader.GetInt32(0),
                    ProductName = reader.GetString(1),
                    Category = reader.GetString(2),
                    Quantity = reader.GetInt32(3),
                    UnitPrice = reader.GetDecimal(4)
                };
            }
            return null;
        }

        // CREATE
        public void Add(Product p)
        {
            using var con = new SqlConnection(_connectionString);
            using var cmd = new SqlCommand(
                "INSERT INTO Products (ProductName, Category, Quantity, UnitPrice) VALUES (@Name, @Category, @Qty, @Price)", con);
            cmd.Parameters.AddWithValue("@Name", p.ProductName);
            cmd.Parameters.AddWithValue("@Category", p.Category);
            cmd.Parameters.AddWithValue("@Qty", p.Quantity);
            cmd.Parameters.AddWithValue("@Price", p.UnitPrice);
            con.Open();
            cmd.ExecuteNonQuery();
        }

        // UPDATE
        public void Update(Product p)
        {
            using var con = new SqlConnection(_connectionString);
            using var cmd = new SqlCommand(
                "UPDATE Products SET ProductName=@Name, Category=@Category, Quantity=@Qty, UnitPrice=@Price WHERE ProductId=@Id", con);
            cmd.Parameters.AddWithValue("@Id", p.ProductId);
            cmd.Parameters.AddWithValue("@Name", p.ProductName);
            cmd.Parameters.AddWithValue("@Category", p.Category);
            cmd.Parameters.AddWithValue("@Qty", p.Quantity);
            cmd.Parameters.AddWithValue("@Price", p.UnitPrice);
            con.Open();
            cmd.ExecuteNonQuery();
        }

        // DELETE
        public void Delete(int id)
        {
            using var con = new SqlConnection(_connectionString);
            using var cmd = new SqlCommand("DELETE FROM Products WHERE ProductId = @Id", con);
            cmd.Parameters.AddWithValue("@Id", id);
            con.Open();
            cmd.ExecuteNonQuery();
        }
    }
}