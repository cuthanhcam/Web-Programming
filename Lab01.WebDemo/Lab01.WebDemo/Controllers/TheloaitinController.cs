using System.Linq;
using System.Web.Mvc;
using Lab01.WebDemo.Models;

namespace Lab01.WebDemo.Controllers
{
    public class TheloaitinController : Controller
    {
        DataClasses1DataContext data = new DataClasses1DataContext();

        public ActionResult Index()
        {
            var All_Loaitin = from tt in data.Theloaitins select tt;
            return View(All_Loaitin);
        }
    }
}
