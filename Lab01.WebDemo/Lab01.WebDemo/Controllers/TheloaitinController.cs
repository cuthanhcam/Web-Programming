using System.Linq;
using System.Web.Mvc;
using Lab01.WebDemo.Models;

namespace Lab01.WebDemo.Controllers
{
    public class TheloaitinController : BaseController
    {
        public ActionResult Index()
        {
            // Lấy danh sách thể loại tin tức
            var allCategories = db.Theloaitins.ToList();
            return View(allCategories);
        }
    }
}
