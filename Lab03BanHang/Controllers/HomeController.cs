using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Lab03BanHang.Data;
using System.Threading.Tasks;
using System.Linq;

namespace Lab03BanHang.Controllers
{
    public class HomeController : Controller
    {
        private readonly ApplicationDBContext _context;

        public HomeController(ApplicationDBContext context)
        {
            _context = context;
        }
    
        public IActionResult Index()
        {
            var products = _context.Products.ToList();
            return View(products);
        }
    }
}
