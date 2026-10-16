using FeedbackPortal.Models;
using Microsoft.AspNetCore.Mvc;

namespace FeedbackPortal.Controllers
{
    public class FeedbackController : Controller
    {
        // In-memory storage (static so data survives between requests)
        private static readonly List<Feedback> _feedbacks = new();
        private static int _nextId = 1;

        // GET: /Feedback
        public IActionResult Index()
        {
            var list = _feedbacks.OrderByDescending(f => f.SubmittedOn).ToList();
            return View(list);
        }

        // GET: /Feedback/Create
        [HttpGet]
        public IActionResult Create()
        {
            return View();
        }

        // POST: /Feedback/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create(Feedback model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);   // redisplay form with error messages
            }

            model.Id = _nextId++;
            model.SubmittedOn = DateTime.Now;
            _feedbacks.Add(model);

            TempData["Success"] = "Thank you! Your feedback has been submitted.";
            return RedirectToAction(nameof(Index));
        }

        // POST: /Feedback/Delete/3
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Delete(int id)
        {
            var item = _feedbacks.FirstOrDefault(f => f.Id == id);
            if (item != null) _feedbacks.Remove(item);

            TempData["Success"] = "Feedback deleted.";
            return RedirectToAction(nameof(Index));
        }
    }
}