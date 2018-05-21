using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace IMDB.Models
{
    public class Movie
    {
        public int Movie_ID { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        public string Plot { get; set; }
        public string Poster { get; set; }
        public string Producer { get; set; }
        [Required]
        public int Year_Of_Release { get; set; }
        public string[] Actors { get; set; }
        public string Producer_ID { get; set; }
        [Required]
        public IFormFile PosterImg { get; set; }

        public IEnumerable<Actor> ActorList { get; set; }

        public IEnumerable<Producer> ProducerList { get; set; }
    }

    public class MoviePoster
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public byte[] Poster { get; set; }
    }
}
