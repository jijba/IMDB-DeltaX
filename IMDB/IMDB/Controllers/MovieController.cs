using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using IMDB.Models;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace IMDB.Controllers
{
    public class MovieController : Controller
    {
        MovieDataAccessLayer objMovie = new MovieDataAccessLayer();
      

        // GET: /<controller>/
        public IActionResult Index()
        {
            List<Movie> lstMovie = new List<Movie>();
            lstMovie = objMovie.GetAllMovies().ToList();
            ViewBag.ActorsList = lstMovie[0].ActorList.ToList(); ;
            ViewBag.ProducersList = lstMovie[0].ProducerList.ToList(); ;
            return View(lstMovie);
        }

        [HttpGet]    
        public IActionResult Create()
        {
            ViewBag.ActorsList = objMovie.GetAllActors().ToList();
            ViewBag.ProducersList = objMovie.GetAllProducers().ToList();
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind] Movie movie)
        {
            
            if (ModelState.IsValid)
            {
                movie.Poster = "/images/Shared/Movie/" + movie.PosterImg.FileName;
                string path = movie.Poster;
                string ext = Path.GetExtension(path).ToLower();
                if (ext == ".jpeg" || ext == ".png" || ext == ".jpg" || ext == ".pjpeg" || ext == ".gif" || ext == ".x-png")
                {
                    if (movie.PosterImg == null || movie.PosterImg.Length == 0)
                        return Content("file not selected");

                    var path2 = Path.Combine(
                                Directory.GetCurrentDirectory(), "wwwroot/images/Shared/Movie/",
                                movie.PosterImg.FileName);
              
                    using (var stream = new FileStream(path2, FileMode.Create))
                    {
                        await movie.PosterImg.CopyToAsync(stream);
                    }
                   
                    objMovie.AddMovie(movie);
                    return RedirectToAction("Index");
                }
                else
                {
                    ViewBag.Error_Msg = "Invalid File Type";
                    ViewBag.ActorsList = objMovie.GetAllActors().ToList();
                    ViewBag.ProducersList = objMovie.GetAllProducers().ToList();
                }
            }
            
            return View(movie);
        }

        [HttpGet]
        public IActionResult Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            Movie movie = objMovie.GetMovieData(id);
            ViewBag.ActorsList = objMovie.GetAllActors().ToList();
            ViewBag.ProducersList = objMovie.GetAllProducers().ToList();
            if (movie == null)
            {
                return NotFound();
            }
            return View(movie);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind]Movie movie)
        {
            if (id != movie.Movie_ID)
            {
                return NotFound();
            }
          

            if (ModelState.IsValid)
            {
                movie.Poster = "/images/Shared/Movie/" + movie.PosterImg.FileName;
                string path = movie.Poster;
                string ext = Path.GetExtension(path).ToLower();
                if (ext == ".jpeg" || ext == ".png" || ext == ".jpg" || ext == ".pjpeg" || ext == ".gif" || ext == ".x-png" )  
                {
                    if (movie.PosterImg == null || movie.PosterImg.Length == 0)
                        return Content("file not selected");

                    var path2 = Path.Combine(
                                Directory.GetCurrentDirectory(), "wwwroot/images/Shared/Movie/",
                                movie.PosterImg.FileName);
                    if (System.IO.File.Exists(path2) == false)
                    {
                        using (var stream = new FileStream(path2, FileMode.Create))
                        {
                            await movie.PosterImg.CopyToAsync(stream);
                        }
                    }
                    objMovie.UpdateMovie(movie);
                    return RedirectToAction("Index");
                }
                else
                {
                    ViewBag.Error_Msg = "Invalid File Type";
                    ViewBag.ActorsList = objMovie.GetAllActors().ToList();
                    ViewBag.ProducersList = objMovie.GetAllProducers().ToList();
                }
            }
            return View(movie);
        }

        [HttpPost]
        public void Upload(IFormFile file)
        {

            if (ModelState.IsValid)
            {
                string path = file.Name;
                string ext = Path.GetExtension(path).ToLower();
                if (ext != ".jpeg" || ext != ".png" || ext != ".jpg" || ext != ".pjpeg" || ext != ".gif" || ext != ".x-png")
                {
                    ViewBag.Error_Msg = "Invalid File Type";
                    ViewBag.ActorsList = objMovie.GetAllActors().ToList();
                    ViewBag.ProducersList = objMovie.GetAllProducers().ToList();
                }
                else
                {
                    
                }
            }

           
        }


    }
}
