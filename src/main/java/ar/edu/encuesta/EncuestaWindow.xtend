package ar.edu.encuesta

import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.MainWindow

class EncuestaWindow extends MainWindow<Encuesta> {

	new() {
		super(new Encuesta)
	}

	def static void main(String[] args) {
		new EncuestaWindow().startApplication
	}

	override createContents(Panel mainPanel) {

		new Label(mainPanel).text = "Zona de votacion"
		new Selector(mainPanel) => [
			bindItemsToProperty("zonas").adapter = new PropertyAdapter(typeof(Zona), "descripcionLoca")
			bindValueToProperty("zonaVotacion")
		]

		new Label(mainPanel).text = "Candidato a Elegir"
		new Selector(mainPanel) => [
			bindItemsToProperty("zonaVotacion.candidatos")
			bindValueToProperty("candidatoElegido")
		]

		new Button(mainPanel) => [
			onClick = [|modelObject.sumarVoto]
			caption = "Sumar voto"
		]

		//creo una grilla
		grillaDeCandidato(mainPanel)//alt shift m
	}
	
	def grillaDeCandidato(Panel mainPanel) {
		val gridCandidatos = new Table(mainPanel, typeof(Candidato)) => [
			width = 200
			height = 100
			bindItemsToProperty("zonaVotacion.candidatos")
		]
		
		new Column<Candidato>(gridCandidatos) => [
			title = "Candidato"
			bindContentsToProperty("nombre")
		]
		
		new Column<Candidato>(gridCandidatos) => [
			title = "Partido"
			bindContentsToProperty("partido")
		]
		
		new Column <Candidato> (gridCandidatos) =>[
			title = "Votos"
			bindContentsToProperty("votos")
		]
	}
}
