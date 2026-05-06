object espadaDelDestino {
    var esPrimeraVez = true

    method poder(pj) = if (esPrimeraVez) pj.poderBase() else pj.poderBase() / 2

    method usarEnBatalla() { esPrimeraVez = false }
}

object libroDeHechizos {
    var hechizos = [bendicion, invisibilidad, invocacion]

    method poder(pj) = if (hechizos.isEmpty()) 0 else hechizos.first().poderAportado(pj)

    method usarEnBatalla() {
        if (not hechizos.isEmpty()) {
            hechizos.remove(hechizos.first())
        }
    }
}

object bendicion {
    method poderAportado(pj) = 4
}

object invisibilidad {
    method poderAportado(pj) = pj.poderBase()
}

object invocacion {
    method poderAportado(pj) {
        // busca el objeto y le pedimos su poder
        const mejor = pj.fortaleza().artefactoMasPoderoso(pj)
        return mejor.poder(pj)
    }
}

object collarDivino {
    var vecesUsado = 0
    method poder(pj) = if (pj.poderBase() > 6) 3 + vecesUsado else 3
    method usarEnBatalla() { vecesUsado += 1 }
}

object armaduraDeAceroValyrio {
    method poder(pj) = 6
    method usarEnBatalla() { } //null
}