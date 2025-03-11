using Lab04.Exams.Models;

namespace Lab04.Exams.Interfaces
{
    public interface IUserRepository
    {
        Task<List<User>> GetAllAsync();
        Task<User> GetByIdAsync(int id);
        Task AddAsync(User user, string password);
        Task UpdateAsync(User user);
        Task DeleteAsync(int id);
    }
}