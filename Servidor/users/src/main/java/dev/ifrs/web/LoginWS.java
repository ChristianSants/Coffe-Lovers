package dev.ifrs.web;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaBuilder;
import javax.transaction.Transactional;
import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.hibernate.criterion.CriteriaQuery;

import dev.ifrs.Model.User;

@Path("/login")
@Transactional
public class LoginWS {

    @POST
    @Transactional
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    // @Produces(MediaType.APPLICATION_JSON)
    public boolean login(@FormParam("login") String login, @FormParam("senha") String senha) {
        User u = User.find("login", login).firstResult();
        if(u != null){
            if(u.getSenha().equals(senha)){
                //chama jwt
                
                return true;
            }
        }
        
        return false;
    }
  
}