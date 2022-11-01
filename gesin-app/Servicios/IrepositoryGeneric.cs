using System.Collections;
using System.Threading.Tasks;

namespace gesin_app.Servicios
{
    public interface IrepositoryGeneric<T> where T: class
    {

        Task<IEnumerable> GetAllAsync();
        Task<T> GetByIdAsync(int Id);
        Task<int> CreateAsync(T entidad );
        Task<int> UpdateAsync(T entidad);
        Task<int> DeleteAsync(T entidad);





    }
}
