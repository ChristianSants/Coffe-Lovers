package dev.ifrs;

import javax.annotation.security.PermitAll;
import javax.annotation.security.RolesAllowed;
import javax.inject.Inject;
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

import org.eclipse.microprofile.rest.client.inject.RestClient;

@Path("/bff")
public class Bff {

    /** ----------- USER ----------- */
    @Inject
    @RestClient
    UserClient user;

    @POST
    @Path("/user/save")
    @PermitAll
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.APPLICATION_JSON)
    public String saveUser(@FormParam("nome") String nome, @FormParam("login") String login, @FormParam("senha") String senha) {
        return user.save(nome, login, senha);
    }
    
    @GET
    @Path("/user/list")
    @Consumes(MediaType.TEXT_PLAIN)
    @Produces(MediaType.APPLICATION_JSON)
    @RolesAllowed({"User"})
    public String listUser() {
        return user.list();
    }

    @GET
    @Path("/user/list/{id}")
    @Consumes(MediaType.TEXT_PLAIN)
    @Produces(MediaType.APPLICATION_JSON)
    @RolesAllowed({"User"})
    public String listUser(@PathParam("id") Long id) {
        return user.find(id);
    }

    @DELETE
    @Path("/user/delete/{id}")
    @Consumes(MediaType.TEXT_PLAIN)
    @Produces(MediaType.APPLICATION_JSON)
    @RolesAllowed({"User"})
    public String deleteUser(@PathParam("id") Long id) {
        return user.delete(id);
    }

    @PUT
    @Path("/user/edit")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.APPLICATION_JSON)
    @RolesAllowed({"User"})
    public String editUser(@FormParam("id") Long id, @FormParam("nome") String nome, @FormParam("senha") String senha) {
        return user.edit(id, nome, senha);
    }

    /** ----------- LOGIN ----------- */
    @Inject
    @RestClient
    LoginClient lg;

    @POST
    @Path("/login")
    @PermitAll
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.APPLICATION_JSON)
    public String login(@FormParam("login") String login, @FormParam("senha") String senha){
        return lg.login(login, senha);
    }

}