using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Lab01.WebDemo.Models;

namespace Lab01.WebDemo.Controllers
{
    public class TheloaitinController : Controller
    {
        // GET: Theloaitin
        NewsDataContext data = new NewsDataContext();
        public ActionResult Index()
        {
            var All_Loaitin = from tt in data.Theloaitins select tt;
            return View(All_Loaitin.ToList());
        }
    }
}