using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations;

namespace Lab04.Exams.Models
{
    public class User : IdentityUser<int>
    {
        [Required, StringLength(100)]
        public string Name { get; set; }
        [EmailAddress] // Tùy chọn để validate định dạng email
        public override string Email { get; set; } // Kế thừa và thêm annotation nếu cần
        public string Role { get; set; } // Admin / User
    }
}