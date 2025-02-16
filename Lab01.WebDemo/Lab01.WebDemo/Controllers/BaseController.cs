using System.Linq;
using System.Web.Mvc;
using Lab01.WebDemo.Models;

namespace Lab01.WebDemo.Controllers
{
    public class BaseController : Controller
    {
        protected NewsDataContext db = new NewsDataContext();

        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            ViewBag.Categories = db.Theloaitins.ToList();
            base.OnActionExecuting(filterContext);
        }
    }
}
