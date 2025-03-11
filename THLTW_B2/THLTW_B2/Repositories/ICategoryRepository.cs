using THLTW_B2.Models;

namespace THLTW_B2.Repositories
{
    public interface ICategoryRepository
    {
        IEnumerable<Category> GetAllCategories();
    }
}
