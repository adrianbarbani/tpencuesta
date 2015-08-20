package ar.edu.encuesta

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable 
@Accessors
class Zona {
    String descripcion
    List<Candidato> candidatos
    
    new(String descripcion) {
        this.candidatos = newArrayList
        this.descripcion = descripcion
    }
    
    def void agregarCandidato(String nombre, String partido) {
        this.candidatos.add(new Candidato(nombre, partido))
    }
    
	override toString(){
		descripcion
	}
	
	def getDescripcionLoca(){
		descripcion + "(" + candidatos.size + ")"
	}
}