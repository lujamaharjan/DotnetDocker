
using Microsoft.EntityFrameworkCore;
using testapp.Models;

namespace testapp.Data
{
    public class ApplicationDbContext : DbContext
    {
      public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options) { }
      public DbSet<Student> Students { get; set; }
    }
}