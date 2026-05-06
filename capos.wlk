import artefactos.*
import erethia.*
import fortalezas.*

object rolando {
    var poderBase = 5
    var property fortaleza = castilloDePiedra
    var capacidadDeMochila = 2
    const artefactosEnMochila = #{}
    var historial = []

    method esPoderoso() {
        return erethia.enemigos().all({ e => self.poderDePelea() > e.poderDePelea() })
    }

    method hayArtefactoFatal(enemigo) {

        return artefactosEnMochila.any({ a => a.poder(self) + poderBase > enemigo.poderDePelea() })
    }

    method enemigosQuePuedeVnece() {

        return erethia.enemigos().filter({ e => self.poderDePelea() > e.poderDePelea() })
    }

    method moradasConquistables() {

        return self.enemigosQuePuedeVnece().map({ e => e.morada() }).asSet()
    }

    method poderDePelea() {
        return poderBase + artefactosEnMochila.sum({ art => art.poder(self) })
    }

    method pelearBatalla() {
        poderBase += 1
        artefactosEnMochila.forEach({ art => art.usarEnBatalla() })
    }

    
    method poderBase() = poderBase
    method poderBase(_poderBase) { poderBase = _poderBase }
    method capacidadDeMochila() = capacidadDeMochila
    method capacidadDeMochila(_capacidad) { capacidadDeMochila = 0.max(_capacidad) }
    method artefactosEnMochila() = artefactosEnMochila

    method llegar(_fortaleza) {
        _fortaleza.artefactosAGuardar(self.artefactosEnMochila())
        artefactosEnMochila.clear()
    }

    method encontrarAtefacto(artefactoEncontrado) {
        
    self.registrarEcuentroDeArtefacto(artefactoEncontrado)
    
    if (self.hayEspacio() && not self.poseArtefacto(artefactoEncontrado)) {
        artefactosEnMochila.add(artefactoEncontrado)
    } else if (not self.hayEspacio()) {

        self.error("No hay más espacio en la mochila")
    }
}

    method registrarEcuentroDeArtefacto(artefacto) { historial.add(artefacto) }
    method hayEspacio() = artefactosEnMochila.size() < capacidadDeMochila
    method poseArtefacto(art) = artefactosEnMochila.contains(art) || fortaleza.hayArtefactoEnCaja(art)
}