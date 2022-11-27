package dev.ifrs.Model;

public class Cafe {
    private Long id;
    private String nome;
    private int nota;
    private String tipo;
    private boolean favorito;
    private Long cafeteria_id;
    private Long user_id;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    
    public String getNome() {
        return this.nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getNota() {
        return this.nota;
    }

    public void setNota(int nota) {
        this.nota = nota;
    }

    public String getTipo() {
        return this.tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public boolean getFavorito() {
        return favorito;
    }

    public void setFavorito(boolean favorito) {
        this.favorito = favorito;
    }

    public Long getCafeteria_id() {
        return cafeteria_id;
    }

    public void setCafeteria_id(Long cafeteria_id) {
        this.cafeteria_id = cafeteria_id;
    }

    public Long getUser_id() {
        return user_id;
    }

    public void setUser_id(Long user_id) {
        this.user_id = user_id;
    }

}
