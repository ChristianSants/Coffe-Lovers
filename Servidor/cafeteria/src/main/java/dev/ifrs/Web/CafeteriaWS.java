package dev.ifrs.Web;

import java.util.List;

import javax.annotation.security.PermitAll;
import javax.transaction.Transactional;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import dev.ifrs.Model.Cafeteria;

@Path("/cafeteria")
@Transactional
public class CafeteriaWS {

    @POST
    @Path("/save")
    // @PermitAll
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.APPLICATION_JSON)
    public Cafeteria save(@FormParam("name") String name, @FormParam("endereco") String endereco) {
        Cafeteria c = new Cafeteria();
        c.setNome(name);
        c.setEndereco(endereco);
        // 2 - O método do Panache `persist` possibilita persistir um objeto.
        c.persist();
        return c;
    }

    @GET
    @Path("/list")
    // @RolesAllowed({"User"})
    @Produces(MediaType.APPLICATION_JSON)
    public List<Cafeteria> list() {
        // 3 - O método `listAll` recupera todos os objetos da classe User.
        return Cafeteria.listAll();
    }

    @GET
    @Path("/list/{id}")
    // @RolesAllowed({"User"})
    @Produces(MediaType.APPLICATION_JSON)
    public Cafeteria list(@PathParam("id") Long id) {
        // 4 - O método do Panache `findById` recupera um objeto da classe User.
        return Cafeteria.findById(id);
    }

    @DELETE
    @Path("/delete/{id}")
    // @RolesAllowed({"User"})
    @Produces(MediaType.APPLICATION_JSON)
    public Cafeteria delete(@PathParam("id") Long id) {
        Cafeteria c = Cafeteria.findById(id);
        c.delete();
        return c;
    }

    @PUT
    @Path("/edit/{id}/{name}/{endereco}")
    // @RolesAllowed({"User"})
    @Produces(MediaType.APPLICATION_JSON)
    public Cafeteria edit(@PathParam("id") Long id, @PathParam("name") String name, @PathParam("endereco") String endereco) {
        Cafeteria c = Cafeteria.findById(id);
        c.setNome(name);
        c.setEndereco(endereco);
        return c;
    }

}