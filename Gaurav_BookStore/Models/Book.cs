using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Gaurav_BookStore.Models
{
    public class Book
    {
        public int BookID { get; set; }
        public string Title { get; set; }
        public string Author { get; set; }
        public decimal Price { get; set; }
        public int GenreID { get; set; }
        public string GenreName { get; set; }

        public string PictureUrl { get; set; }

        public int Quantity { get; set; }
    }
}