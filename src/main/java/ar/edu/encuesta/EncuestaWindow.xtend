package ar.edu.encuesta

import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
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
			bindItemsToProperty("zonas")
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
	}
}
