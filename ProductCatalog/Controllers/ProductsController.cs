using Microsoft.AspNetCore.Mvc;
using ProductCatalog.Models;

namespace ProductCatalog.Controllers
{
    public class ProductsController : Controller
    {
        // GET: /Products
        public IActionResult Index()
        {
            var products = ProductRepository.GetAll();
            return View(products);
        }

        // GET: /Products/Details/1
        public IActionResult Details(int id)
        {
            var product = ProductRepository.GetById(id);
            if (product == null) return NotFound();
            return View(product);
        }

        // GET: /Products/Create  (shows empty form)
        public IActionResult Create()
        {
            return View();
        }

        // POST: /Products/Create  (form submitted)
        [HttpPost]
        public IActionResult Create(Product product)
        {
            if (ModelState.IsValid)
            {
                ProductRepository.Add(product);
                return RedirectToAction("Index");
            }
            return View(product);
        }

        // GET: /Products/Edit/1
        public IActionResult Edit(int id)
        {
            var product = ProductRepository.GetById(id);
            if (product == null) return NotFound();
            return View(product);
        }

        // POST: /Products/Edit/1
        [HttpPost]
        public IActionResult Edit(Product product)
        {
            if (ModelState.IsValid)
            {
                ProductRepository.Update(product);
                return RedirectToAction("Index");
            }
            return View(product);
        }

        // GET: /Products/Delete/1  (confirmation page)
        public IActionResult Delete(int id)
        {
            var product = ProductRepository.GetById(id);
            if (product == null) return NotFound();
            return View(product);
        }

        // POST: /Products/Delete/1
        [HttpPost, ActionName("Delete")]
        public IActionResult DeleteConfirmed(int id)
        {
            ProductRepository.Delete(id);
            return RedirectToAction("Index");
        }
    }
}