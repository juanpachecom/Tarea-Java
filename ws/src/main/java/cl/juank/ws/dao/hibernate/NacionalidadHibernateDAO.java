package cl.juank.ws.dao.hibernate;

import cl.juank.ws.dao.NacionalidadDAO;
import cl.juank.ws.modelo.Nacionalidad;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

/**
 *
 * @author Sebastián Salazar Molina <sebasalazar@gmail.com>
 */
@Service("nacionalidadDAO")
public class NacionalidadHibernateDAO implements NacionalidadDAO, Serializable {

    @PersistenceContext
    private EntityManager entityManager;
    private final static Logger logger = LoggerFactory.getLogger(NacionalidadHibernateDAO.class);

    @Override
    public Nacionalidad findById(Long id) {
        Nacionalidad nacionalidad = null;
        try {
            if (id != null) {
                nacionalidad = entityManager.find(Nacionalidad.class, id);
            }
        } catch (Exception e) {
            nacionalidad = null;
            logger.error("Error al encontrar por id: {}", e.toString());
            logger.debug("Error al encontrar por id: {}", e.toString(), e);
        }
        return nacionalidad;
    }

    @Override
    public List<Nacionalidad> findAll() {
        List<Nacionalidad> nacionalidades = new ArrayList<Nacionalidad>();
        try {
            Query query = entityManager.createQuery("SELECT n FROM Nacionalidad n");
            if (query != null) {
                nacionalidades = query.getResultList();
            }
        } catch (Exception e) {
            nacionalidades = new ArrayList<Nacionalidad>();
            logger.error("Error al obtenerlos todas las nacionalidades: {}", e.toString());
            logger.debug("Error al obtenerlos todas las nacionalidades: {}", e.toString(), e);
        }
        return nacionalidades;
    }

    @Override
    @Transactional
    public Nacionalidad persist(Nacionalidad nacionalidad) {
        Nacionalidad resultado = null;
        try {
            if (nacionalidad != null) {
                resultado = (Nacionalidad) entityManager.merge(nacionalidad);
            }
        } catch (Exception e) {
            resultado = null;
            logger.error("Error al persistir: {}", e.toString());
            logger.debug("Error al persistir: {}", e.toString(), e);
        }
        return resultado;
    }

    @Override
    @Transactional
    public boolean delete(Nacionalidad nacionalidad) {
        boolean ok = false;
        try {
            if (nacionalidad != null) {
                entityManager.remove(nacionalidad);
                ok = true;
            }
        } catch (Exception e) {
            ok = false;
            logger.error("Error al eliminar: {}", e.toString());
            logger.debug("Error al eliminar: {}", e.toString(), e);
        }
        return ok;
    }

}
