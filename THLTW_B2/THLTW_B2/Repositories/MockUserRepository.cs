using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using THLTW_B2.Models;

namespace THLTW_B2.Repositories
{
    public class MockUserRepository : IUserRepository
    {
        private readonly List<User> _users = new List<User>
        {
            new User { Id = 1, Name = "John Doe", Email = "vpt.luan@hutech.edu.vn", Password = "123456", Role = "Admin" },
            new User { Id = 2, Name = "Jane Smith", Email = "abc@example.com", Password = "123456", Role = "User" }
        };

        public Task<IEnumerable<User>> GetAllAsync()
        {
            return Task.FromResult(_users.AsEnumerable());
        }

        public Task<User> GetByIdAsync(int id)
        {
            var user = _users.FirstOrDefault(u => u.Id == id);
            return Task.FromResult(user);
        }

        public Task AddAsync(User user)
        {
            user.Id = _users.Max(u => u.Id) + 1;
            _users.Add(user);
            return Task.CompletedTask;
        }

        public Task UpdateAsync(User user)
        {
            var existingUser = _users.FirstOrDefault(u => u.Id == user.Id);
            if (existingUser != null)
            {
                existingUser.Name = user.Name;
                existingUser.Email = user.Email;
                existingUser.Password = user.Password;
                existingUser.Role = user.Role;
            }
            return Task.CompletedTask;
        }

        public Task DeleteAsync(int id)
        {
            var user = _users.FirstOrDefault(u => u.Id == id);
            if (user != null)
            {
                _users.Remove(user);
            }
            return Task.CompletedTask;
        }

        public Task<User> GetByEmailAndPasswordAsync(string email, string password)
        {
            var user = _users.FirstOrDefault(u => u.Email == email && u.Password == password);
            return Task.FromResult(user);
        }
    }
}
