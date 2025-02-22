using System;
using System.Collections.Generic;
using System.Linq;
using Lab02.WebsiteBanHang.Models;

namespace Lab02.WebsiteBanHang.Repositories
{
    public class MockCategoryRepository : ICategoryRepository
    {
        private List<Category> _categoryList;

        public MockCategoryRepository()
        {
            _categoryList = new List<Category>
            {
                new Category { Id = 1, Name = "Electronics" },
                new Category { Id = 2, Name = "Clothes" },
                new Category { Id = 3, Name = "Books" }
            };
        }
        public IEnumerable<Category> GetALlCategories()
        {
            return _categoryList;
        }
    }
}
