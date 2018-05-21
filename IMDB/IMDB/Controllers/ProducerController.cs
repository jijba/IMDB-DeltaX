using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using IMDB.Models;
using Microsoft.AspNetCore.Mvc;

namespace IMDB.Controllers
{
    public class ProducerController : Controller
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
        public IActionResult Create([Bind] Producer producer)
        {

            if (ModelState.IsValid)
            {
                   objMovie.AddProducer(producer);
                   return Redirect("/Movie/");

            }

            return View(producer);
        }

    }
}