using gesin_app.Models;
using Microsoft.EntityFrameworkCore;
using System.Collections;
using System.Threading.Tasks;

namespace gesin_app.Servicios
{
    public class RepositoryGeneric<T> : IrepositoryGeneric<T> where T : class
    {
        private readonly GesinV2Context _context;

        private DbSet<T> Entidades;

        public RepositoryGeneric(GesinV2Context _context)
        {
            this._context = _context; 
            this.Entidades = _context.Set<T>();
        }
        public async Task<int> CreateAsync(T entidad)
        {
            Entidades.Add(entidad);
            await _context.SaveChangesAsync();

            return 1;
        }

        public async Task<int> DeleteAsync(int id)
        {
            var buscarId = await GetByIdAsync(id);

            Entidades.Remove(buscarId);
           await _context.SaveChangesAsync();

            return 1;  
        }

        public async Task<IEnumerable> GetAllAsync()
        {
            var reportes =  await Entidades.ToListAsync();

            return reportes;
        }

        public async Task<T> GetByIdAsync(int Id)
        {
            var reporte = await Entidades.FindAsync(Id);
            return reporte;
        }

        public async Task<int> UpdateAsync(T entidad)
        {
            Entidades.Update(entidad);

            await _context.SaveChangesAsync();

            return 2;


        }
    }
}
