using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Lab03BanHang.Models
{
    public class Product
    {
        public int Id { get; set; }

        [Required, StringLength(100)]
        public string Name { get; set; } = string.Empty;

        [Range(0.01, 10000.00)]
        public decimal Price { get; set; }

        public string Description { get; set; } = string.Empty;

        public int CategoryId { get; set; }

        [StringLength(255)]
        public string ImagePath { get; set; } = string.Empty;

        [ForeignKey("CategoryId")]
        public required Category Category { get; set; }

        public string GetImageUrl()
        {
            return $"/images/{ImagePath}.jpg";
        }
    }
}