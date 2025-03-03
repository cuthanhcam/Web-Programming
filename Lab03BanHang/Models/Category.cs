using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Lab03BanHang.Models
{
    public class Category
    {
        public int Id { get; set; }

        [Required, StringLength(50)]
        public string Name { get; set; } = string.Empty;

        public required ICollection<Product> Products { get; set; }
    }
}
