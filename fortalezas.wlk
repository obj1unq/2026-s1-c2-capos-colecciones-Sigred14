object castilloDePiedra{

    const cajaDeArtefactos = #{}

    method cajaDeArtefactos()= cajaDeArtefactos

    method hayArtefactoEnCaja(artefacto){
        return self.cajaDeArtefactos().contains(artefacto)
    }


    method artefactosAGuardar(artefactos){

            cajaDeArtefactos.addAll(artefactos)
    }

    method artefactoMasPoderoso(personaje) {

    return cajaDeArtefactos.max({ art => art.poder(personaje) })
}   }


object fortalezaDeAcero{}
object palacioDeMarmol{}
object torreDeMarfil{}