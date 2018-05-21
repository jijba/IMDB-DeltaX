using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace IMDB.Models
{
    public class Producer
    {
        public int Producer_ID { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        public string Sex { get; set; }
        [Required]
        public DateTime DOB { get; set; }
        [Required]
        public string Bio { get; set; }
    }
}
