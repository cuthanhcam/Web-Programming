using Lab04.Exams.Models;

namespace Lab04.Exams.Interfaces
{
    public interface IProductImageRepository
    {
        Task<List<ProductImage>> GetByProductIdAsync(int productId);
        Task AddAsync(ProductImage image);
        Task DeleteAsync(int id);
    }
}