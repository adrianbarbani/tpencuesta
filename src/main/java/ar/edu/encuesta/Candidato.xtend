package ar.edu.encuesta

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Candidato {
    String nombre
    String partido
    int votos
    
    new(String nombre, String partido) {
        this.nombre = nombre
        this.partido = partido
    }
    
    override toString() {
        nombre + " (" + partido + ") - " + votos + " votos"
    }
    
    def sumarVoto() {
        votos++
    }
    
}