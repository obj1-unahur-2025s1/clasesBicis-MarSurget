class Bici{
    const property rodado
    const largo 
    const marca
    const accesorios = #{}

    method altura() =  rodado * 2.5 + 15

    method velocidadCrucero() =  if (largo > 120) rodado + 6 else rodado + 2 

    method carga() = accesorios.sum({a=>a.carga()}) ///

    method peso() = (rodado / 2) + self.pesoAccesorios()

    method pesoAccesorios() = accesorios.sum({a=>a.peso()}) //

    method tieneLuz() = accesorios.any({a=>a.esLuminoso()}) ///

    method agregarAccesorio(unAccesorio){
        accesorios.add(unAccesorio)
    }
    method quitarAccesorio(unAccesorio){
        accesorios.remove(unAccesorio)
    }

    method noTieneAccesorios() = accesorios.isEmpty()

    method cantAccesoriosLivianos() = accesorios.count({a=>a.peso() < 1})

}

class Farolito {
    method peso() = 0.5
    method carga() = 0
    method esLuminoso() = true
}

class Canasto {
    const volumen 
    method peso() = volumen / 10
    method carga() = volumen * 2
    method esLuminoso() = false
    method initialize() {
      if(!volumen.between(1, 20)){
        self.error(volumen.toString() + " no es un valor entre 1 y 20")
      }
    }
}

class MorralDeBici {
    const largo 
    var tieneOjoDeGato 
    method peso() = 1.2
    method carga() = largo / 3
    method esLuminoso() = tieneOjoDeGato

}

