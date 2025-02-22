using System.Collections;
using System.Collections.Generic;
using Lab02.WebsiteBanHang.Models;

namespace Lab02.WebsiteBanHang.Repositories
{
    public interface ICategoryRepository
    {
        IEnumerable<Category> GetALlCategories();
    }
}
    