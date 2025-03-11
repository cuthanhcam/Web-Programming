using Microsoft.AspNetCore.Mvc;
using THLTW_B2.Models;
using THLTW_B2.Repositories;
using THLTW_B2.Filters;

namespace THLTW_B2.Controllers
{
    [AdminAuthorize] // Chỉ Admin mới được quyền truy cập
    public class UserController : Controller
    {
        private readonly IUserRepository _userRepository;

        public UserController(IUserRepository userRepository)
        {
            _userRepository = userRepository;
        }

        // Hiển thị danh sách user
        public async Task<IActionResult> Index()
        {
            var users = await _userRepository.GetAllAsync();
            return View(users);
        }

        // Hiển thị form thêm User
        public IActionResult Add()
        {
            return View();
        }

        // Xử lý thêm User (POST)
        [HttpPost]
        public async Task<IActionResult> Add(User user)
        {
            if (ModelState.IsValid)
            {
                await _userRepository.AddAsync(user);
                return RedirectToAction("Index");
            }
            return View(user);
        }

        // Hiển thị form cập nhật User
        public async Task<IActionResult> Update(int id)
        {
            var user = await _userRepository.GetByIdAsync(id);
            if (user == null)
                return NotFound();

            return View(user);
        }

        // Xử lý cập nhật User
        [HttpPost]
        public async Task<IActionResult> Update(User user)
        {
            if (ModelState.IsValid)
            {
                await _userRepository.UpdateAsync(user);
                return RedirectToAction("Index");
            }
            return View(user);
        }

        // Xác nhận xóa User
        public async Task<IActionResult> Delete(int id)
        {
            var user = await _userRepository.GetByIdAsync(id);
            if (user == null)
                return NotFound();

            return View(user);
        }

        // Thực hiện xóa User
        [HttpPost, ActionName("DeleteConfirmed")]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            await _userRepository.DeleteAsync(id);
            return RedirectToAction(nameof(Index));
        }
    }
}
