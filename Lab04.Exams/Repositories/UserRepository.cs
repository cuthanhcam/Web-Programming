using Lab04.Exams.Data;
using Lab04.Exams.Interfaces;
using Lab04.Exams.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;

namespace Lab04.Exams.Repositories
{
    public class UserRepository : IUserRepository
    {
        private readonly ApplicationDbContext _context;
        private readonly UserManager<User> _userManager;
        private readonly RoleManager<IdentityRole<int>> _roleManager;

        public UserRepository(
            ApplicationDbContext context,
            UserManager<User> userManager,
            RoleManager<IdentityRole<int>> roleManager)
        {
            _context = context;
            _userManager = userManager;
            _roleManager = roleManager;
        }

        public async Task<List<User>> GetAllAsync()
        {
            return await _context.Users.ToListAsync();
        }

        public async Task<User> GetByIdAsync(int id)
        {
            return await _userManager.FindByIdAsync(id.ToString());
        }

        public async Task AddAsync(User user, string password)
        {
            // Kiểm tra email trùng lặp
            if (await _userManager.FindByEmailAsync(user.Email) != null)
            {
                throw new Exception("Email is already taken.");
            }

            // Đảm bảo Role không null
            user.Role ??= "User"; // Gán mặc định nếu Role null

            // Kiểm tra và tạo vai trò nếu chưa tồn tại
            if (!string.IsNullOrEmpty(user.Role))
            {
                if (!await _roleManager.RoleExistsAsync(user.Role))
                {
                    var roleResult = await _roleManager.CreateAsync(new IdentityRole<int> { Name = user.Role });
                    if (!roleResult.Succeeded)
                    {
                        throw new Exception("Failed to create role: " + string.Join(", ", roleResult.Errors.Select(e => e.Description)));
                    }
                }
            }

            // Tạo người dùng mới
            var result = await _userManager.CreateAsync(user, password);
            if (result.Succeeded)
            {
                if (!string.IsNullOrEmpty(user.Role))
                {
                    await _userManager.AddToRoleAsync(user, user.Role);
                }
            }
            else
            {
                var errors = string.Join(", ", result.Errors.Select(e => e.Description));
                throw new Exception($"Failed to add user: {errors}");
            }
        }

        public async Task UpdateAsync(User user)
        {
            await _userManager.UpdateAsync(user);
        }

        public async Task DeleteAsync(int id)
        {
            var user = await _userManager.FindByIdAsync(id.ToString());
            if (user != null)
            {
                await _userManager.DeleteAsync(user);
            }
        }
    }
}