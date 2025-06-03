import bicis.*

class Deposito{
    const bicis = []

    method agregarBicis(listaDeBicis) {
         if (bicis.any({nuevaBici=>bicis.contains(nuevaBici)})) {
            self.error("NO SE PUEDE AGREGAR DOS VECES UNA BICI AL DEPOSITO") // forma 1
            // throw new Exception(message = "NO SE PUEDE AGREGAR DOS VECES UNA BICI AL DEPOSITO") // forma 2
         }
        if (listaDeBicis.any({bici=>listaDeBicis.occurrencesOf(bici) > 1})){ /// ocurrencesOf retorna un numero 
            self.error("HAY BICIS DUPLICADAS DENTRO DE LA LISTA DE LAS NUEVAS BICIS") 
        }
        bicis.addAll(listaDeBicis)
    }
    
    method bicisRapidas() = bicis.filter({b=>b.velocidadCrucero() > 25})

    method marcaDeLasBicis() = bicis.filter({b=>b.marca()}).asSet()

    method esNocturno() = bicis.all({b=>b.tieneLuz()})

    method algunaPuedeLLevar(kilos) = bicis.any({b=>b.carga()>  kilos})

    method marcaBiciMasRapida() = bicis.map(bicis.max({b=>b.velocidadCrucero()}))

    method cargaTotalBicisLargas() {
        var bicisLargas = bicis.filter({b=>b.largo() > 170})
        return bicisLargas.sum({b=>b.carga()})   
    } 
    
    method cantBicisSinAccesorios() {
        bicis.count({b=>b.noTieneAccesorios()})
    }


}
