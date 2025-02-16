using System.Linq;
using System.Web.Mvc;
using Lab01.WebDemo.Models;

namespace Lab01.WebDemo.Controllers
{
    public class TintucController : BaseController
    {
        public ActionResult Index()
        {
            // Lấy tất cả tin tức để hiển thị trên trang chủ
            var allNews = db.Tintucs.ToList();
            return View(allNews);
        }

        public ActionResult TheLoai(int id)
        {
            // Lọc tin tức theo thể loại được chọn
            var newsByCategory = db.Tintucs.Where(tt => tt.IDLoai == id).ToList();
            var category = db.Theloaitins.FirstOrDefault(c => c.IDLoai == id);

            if (category != null)
            {
                ViewBag.CategoryName = category.Tentheloai;
            }

            return View(newsByCategory);
        }
    }
}
