using Lab04.Exams.Data;
using Lab04.Exams.Interfaces;
using Lab04.Exams.Models;
using Lab04.Exams.Repositories;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Identity;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container
builder.Services.AddControllersWithViews()
    .AddMvcOptions(options =>
    {
        options.Filters.Add(new Microsoft.AspNetCore.Mvc.Authorization.AuthorizeFilter()); // Yêu cầu đăng nhập toàn cục
    });

// Configure DbContext
builder.Services.AddDbContext<ApplicationDbContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

// Configure Identity
builder.Services.AddIdentity<User, IdentityRole<int>>(options =>
{
    options.Password.RequireDigit = true;
    options.Password.RequiredLength = 6;
    options.Password.RequireNonAlphanumeric = false;
    options.Password.RequireUppercase = false;
})
.AddEntityFrameworkStores<ApplicationDbContext>()
.AddDefaultTokenProviders()
.AddRoleManager<RoleManager<IdentityRole<int>>>(); // Thêm RoleManager

// Register repositories
builder.Services.AddScoped<IProductRepository, ProductRepository>();
builder.Services.AddScoped<ICategoryRepository, CategoryRepository>();
builder.Services.AddScoped<IProductImageRepository, ProductImageRepository>();
builder.Services.AddScoped<IUserRepository, UserRepository>();

// Authorization policies
builder.Services.AddAuthorization(options =>
{
    options.AddPolicy("AdminOnly", policy => policy.RequireRole("Admin"));
});

var app = builder.Build();

// Seed data
using (var scope = app.Services.CreateScope())
{
    var services = scope.ServiceProvider;
    try
    {
        var userManager = services.GetRequiredService<UserManager<User>>();
        var roleManager = services.GetRequiredService<RoleManager<IdentityRole<int>>>();
        var dbContext = services.GetRequiredService<ApplicationDbContext>();

        // Seed Roles
        string[] roles = { "Admin", "User" };
        foreach (var role in roles)
        {
            if (!await roleManager.RoleExistsAsync(role))
            {
                await roleManager.CreateAsync(new IdentityRole<int> { Name = role });
            }
        }

        // Seed Users
        if (await userManager.FindByEmailAsync("admin@example.com") == null)
        {
            var adminUser = new User
            {
                UserName = "admin@example.com",
                Email = "admin@example.com",
                Name = "Admin User",
                Role = "Admin"
            };
            await userManager.CreateAsync(adminUser, "Password123");
            await userManager.AddToRoleAsync(adminUser, "Admin");
        }

        if (await userManager.FindByEmailAsync("user@example.com") == null)
        {
            var normalUser = new User
            {
                UserName = "user@example.com",
                Email = "user@example.com",
                Name = "Normal User",
                Role = "User"
            };
            await userManager.CreateAsync(normalUser, "Password123");
            await userManager.AddToRoleAsync(normalUser, "User");
        }

        // Seed Categories
        if (!await dbContext.Categories.AnyAsync())
        {
            dbContext.Categories.AddRange(
                new Category { Name = "Electronics" },
                new Category { Name = "Clothing" },
                new Category { Name = "Books" }
            );
            await dbContext.SaveChangesAsync();
        }

        // Seed Products
        if (!await dbContext.Products.AnyAsync())
        {
            var electronics = await dbContext.Categories.FirstAsync(c => c.Name == "Electronics");
            var clothing = await dbContext.Categories.FirstAsync(c => c.Name == "Clothing");
            var books = await dbContext.Categories.FirstAsync(c => c.Name == "Books");

            dbContext.Products.AddRange(
                new Product
                {
                    Name = "Laptop",
                    Price = 999.99m,
                    Description = "High-performance laptop",
                    ImageUrl = "/images/laptop.jpg",
                    CategoryId = electronics.Id
                },
                new Product
                {
                    Name = "T-Shirt",
                    Price = 19.99m,
                    Description = "Cotton t-shirt",
                    ImageUrl = "/images/tshirt.jpg",
                    CategoryId = clothing.Id
                },
                new Product
                {
                    Name = "Programming Book",
                    Price = 49.99m,
                    Description = "Learn C# in depth",
                    ImageUrl = "/images/book.jpg",
                    CategoryId = books.Id
                }
            );
            await dbContext.SaveChangesAsync();
        }

        // Seed ProductImages
        if (!await dbContext.ProductImages.AnyAsync())
        {
            var laptop = await dbContext.Products.FirstAsync(p => p.Name == "Laptop");
            var tshirt = await dbContext.Products.FirstAsync(p => p.Name == "T-Shirt");
            var book = await dbContext.Products.FirstAsync(p => p.Name == "Programming Book");

            dbContext.ProductImages.AddRange(
                new ProductImage { Url = "/images/laptop1.jpg", ProductId = laptop.Id },
                new ProductImage { Url = "/images/laptop2.jpg", ProductId = laptop.Id },
                new ProductImage { Url = "/images/tshirt1.jpg", ProductId = tshirt.Id },
                new ProductImage { Url = "/images/book1.jpg", ProductId = book.Id }
            );
            await dbContext.SaveChangesAsync();
        }
    }
    catch (Exception ex)
    {
        Console.WriteLine($"Error seeding data: {ex.Message}");
        throw;
    }
}

// Configure the HTTP request pipeline
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthentication();
app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Account}/{action=Login}/{id?}");

app.Run();