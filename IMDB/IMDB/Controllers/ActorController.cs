using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using IMDB.Models;
using Microsoft.AspNetCore.Mvc;

namespace IMDB.Controllers
{
    public class ActorController : Controller
    {
        MovieDataAccessLayer objMovie = new MovieDataAccessLayer();
        public IActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public IActionResult Create()
        {
           return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create([Bind] Actor actor)
        {

            if (ModelState.IsValid)
            {
                objMovie.AddActor(actor);
                return Redirect("/Movie/");

            }

            return View(actor);
        }
    }
}