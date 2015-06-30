package cl.juank.ws.dao;

import cl.juank.ws.modelo.Nacionalidad;
import java.util.List;

/**
 *
 * @author Sebastián Salazar Molina <sebasalazar@gmail.com>
 */
public interface NacionalidadDAO {

    public Nacionalidad findById(Long id);

    public List<Nacionalidad> findAll();

    public Nacionalidad persist(Nacionalidad nacionalidad);

    public boolean delete(Nacionalidad nacionalidad);
}
