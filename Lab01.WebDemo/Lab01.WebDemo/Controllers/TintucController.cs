using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Lab01.WebDemo.Controllers
{
    public class TintucController : Controller
    {
        // GET: Tintuc
        DataClasses1DataContext data = new DataClasses1DataContext();
        public ActionResult Index()
        {
            var All_tin = from tt in data.Tintucs select tt;
            return View(All_tin);
        }
    }
}