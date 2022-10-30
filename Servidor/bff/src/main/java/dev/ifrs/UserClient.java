package dev.ifrs;

import org.eclipse.microprofile.rest.client.inject.RegisterRestClient;

import io.quarkus.oidc.token.propagation.AccessToken;
import io.quarkus.vertx.http.runtime.devmode.Json;

import javax.annotation.security.RolesAllowed;
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
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

import java.util.List;
import java.util.Set;

/**
 * To use it via injection.
 *
 * {@code
 *     @Inject
 *     @RestClient
 *     MyRemoteService myRemoteService;
 *
 *     public void doSomething() {
 *         Set<MyRemoteService.Extension> restClientExtensions = myRemoteService.getExtensionsById("io.quarkus:quarkus-rest-client");
 *     }
 * }
 */
@AccessToken
@RegisterRestClient(baseUri = "http://localhost:8081/user")
public interface UserClient {
    @POST
    @Path("/save")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.APPLICATION_JSON)
    @Transactional
    public String save(@FormParam("name") String name, @FormParam("login") String login, @FormParam("senha") String senha);
    
    @GET
    @Path("/list")
    @Consumes(MediaType.TEXT_PLAIN)
    @Produces(MediaType.APPLICATION_JSON)
    @RolesAllowed({"User"})
    @Transactional
    public String list();

    @GET
    @Path("/list/{id}")
    @Consumes(MediaType.TEXT_PLAIN)
    @Produces(MediaType.APPLICATION_JSON)
    @RolesAllowed({"User"})
    @Transactional
    public String find(@PathParam("id") Long id);

    @DELETE
    @Path("/delete/{id}")
    @Consumes(MediaType.TEXT_PLAIN)
    @Produces(MediaType.APPLICATION_JSON)
    @RolesAllowed({"User"})
    @Transactional
    public String delete(@PathParam("id") Long id);

    @PUT
    @Path("/edit/{id}/{nome}/{senha}")
    @Consumes(MediaType.TEXT_PLAIN)
    @Produces(MediaType.APPLICATION_JSON)
    @RolesAllowed({"User"})
    @Transactional
    public String edit(@PathParam("id") Long id, @PathParam("nome") String nome, @PathParam("senha") String senha);
}
