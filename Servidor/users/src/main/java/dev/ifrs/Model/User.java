package dev.ifrs.Model;

import java.util.LinkedList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

import io.quarkus.hibernate.orm.panache.PanacheEntity;

@Entity
public class User extends PanacheEntity {
    private String nome;
    
    @Column(unique = true)
    private String login;
    private String senha;

    // @ElementCollection
    // private List<Long> cafes;
        
    // @OneToMany(mappedBy="user", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	// @JoinColumn(name="cafe_id")
	// private List<Long> consultas = new LinkesdList<>();

    public User() {
        // this.cafes = new LinkedList<>();
    }

    public void setNome(String nome){
        this.nome = nome;
    }

    public String getNome(){
        return this.nome;
    }

    public void setLogin(String login){
        this.login = login;
    }

    public String getLogin(){
        return this.login;
    }

    public void setSenha(String senha){
        this.senha = senha;
    }

    public String getSenha(){
        return this.senha;
    }

    // public List<Long> getCafes() {
    //     return cafes;
    // }

    // public void setCafes(List<Long> cafes) {
    //     this.cafes = cafes;
    // }

    // public void addCafe(Long cafe) {
    //     this.cafes.add(cafe);
    // }
}
