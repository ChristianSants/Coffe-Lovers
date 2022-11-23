package dev.ifrs.Web;

import java.util.List;

import javax.annotation.security.PermitAll;
import javax.transaction.Transactional;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.PATCH;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import dev.ifrs.Model.Cafe;

@Path("/cafe")
@Transactional
public class CafeWS {
    @POST
    @Path("/save")
    // @PermitAll
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.APPLICATION_JSON)
    public Cafe save(@FormParam("nome") String nome, @FormParam("nota") int nota,  @FormParam("tipo") String tipo, @FormParam("favorito") boolean favorito, @FormParam("cafeteria_id") int cafeteria_id) {
        Cafe c = new Cafe();
        c.setNome(nome);
        c.setNota(nota);
        c.setTipo(tipo);
        c.setFavorito(favorito);
        c.setCafeteria_id(cafeteria_id);
        // 2 - O método do Panache `persist` possibilita persistir um objeto.
        c.persist();
        return c;
    }

    @GET
    @Path("/list")
    // @RolesAllowed({"User"})
    @Produces(MediaType.APPLICATION_JSON)
    public List<Cafe> list() {
        // 3 - O método `listAll` recupera todos os objetos da classe User.
        return Cafe.listAll();
    }

    @GET
    @Path("/list/{id}")
    // @RolesAllowed({"User"})
    @Produces(MediaType.APPLICATION_JSON)
    public Cafe list(@PathParam("id") Long id) {
        // 4 - O método do Panache `findById` recupera um objeto da classe User.
        return Cafe.findById(id);
    }

    @DELETE
    @Path("/delete/{id}")
    // @RolesAllowed({"User"})
    @Produces(MediaType.APPLICATION_JSON)
    public Cafe delete(@PathParam("id") Long id) {
        Cafe c = Cafe.findById(id);
        c.delete();
        return c;
    }

    @PUT
    @Path("/edit")
    // @RolesAllowed({"User"})
    @Produces(MediaType.APPLICATION_JSON)
    public Cafe edit(@FormParam("id") Long id, @FormParam("nome") String nome, @FormParam("nota") int nota,  @FormParam("tipo") String tipo, @FormParam("favorito") boolean favorito, @FormParam("cafeteria_id") int cafeteria_id) {
        Cafe c = Cafe.findById(id);
        c.setNome(nome);
        c.setNota(nota);
        c.setTipo(tipo);
        c.setFavorito(favorito);
        c.setCafeteria_id(cafeteria_id);
        return c;
    }

    @PATCH
    @Path("/favoritar")
    // @RolesAllowed({"User"})
    @Produces(MediaType.APPLICATION_JSON)
    public Cafe favoritarDesfavoritar(@FormParam("id") Long id, @FormParam("favorito") boolean favorito) {
        Cafe c = Cafe.findById(id);
        c.setFavorito(favorito);
        return c;
    }

}