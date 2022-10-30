package dev.ifrs.web;

import java.util.Arrays;
import java.util.HashSet;

import javax.annotation.security.PermitAll;
import javax.transaction.Transactional;
import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.SecurityContext;

import org.eclipse.microprofile.jwt.Claims;

import dev.ifrs.Model.User;
import io.smallrye.jwt.build.Jwt;

@Path("/login")
@Transactional
public class LoginWS {

    @POST
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @PermitAll
    // @Produces(MediaType.APPLICATION_JSON)
    public String login(@FormParam("login") String login, @FormParam("senha") String senha, @Context SecurityContext ctx) {
        User u = User.find("login", login).firstResult();
        if(u != null){
            if(u.getSenha().equals(senha)){
                //chama jwt
                return Jwt.issuer("http://localhost:8081")
                        .upn("chris@teste.dev")
                        .groups(new HashSet<>(Arrays.asList("User", "Admin")))
                        .claim(Claims.full_name, "Christian Figueiro")
                        .sign();
            }
        }        
        return "false";
    }

    // @GET
    // @PermitAll
    // @Produces(MediaType.TEXT_PLAIN)
    // public String getJwt(@Context SecurityContext ctx) {
    //     return Jwt.issuer("http://localhost:8080")
    //             .upn("chris@teste.dev")
    //             .groups(new HashSet<>(Arrays.asList("User", "Admin")))
    //             .claim(Claims.full_name, "Christian Figueiro")
    //             .sign();
    // }
  
}