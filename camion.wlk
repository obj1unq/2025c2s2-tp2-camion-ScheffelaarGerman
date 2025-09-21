import cosas.*

 object camion {
	const property cosas = #{}
		
	method cargar(unaCosa) {if (!cosas.contains(unaCosa)){cosas.add(unaCosa)} }
	
	method descargar(unaCosa){ if (cosas.contains(unaCosa)) {cosas.remove(unaCosa)} }

	method tienePesoPar(unaCosa){return unaCosa.peso() % 2 == 0}
 
    method todoPesoEsPar() {return cosas.all { cosa => self.tienePesoPar(cosa) } }

	method hayAlgoQuePesa(peso){ return cosas.any { cosa => cosa.peso() == peso} }

	method pesoTotalCamion(){const tara = 1000  return tara + self.pesoTotalCarga()}

    method pesoTotalCarga() {return cosas.sum { cosa => cosa.peso() } }

	method estaExcedidoEnPeso() {return self.pesoTotalCamion() > 2500}

	method cosasConNivelDePeligrosidadDe(nivel) {
    const resultado = cosas.find { cosa => cosa.nivelPeligrosidad() == nivel }
    if (resultado == null) {throw ("No existe carga con ese nivel de peligrosidad")}
    return resultado
	}

	method cosasConNivelDePeligrosidadMayorA(nivel) {return cosas.filter { cosa => cosa.nivelPeligrosidad() > nivel } }

	method cosasConMayorNivelDePeligrosidadQue(otraCosa) {return self.cosasConNivelDePeligrosidadMayorA(otraCosa.nivelPeligrosidad()) }

	method puedeCircularEnRuta(nivel) { return !self.estaExcedidoEnPeso() && self.cosasConNivelDePeligrosidadMayorA(nivel).isEmpty() }

	method tieneAlgoQuePesaEntre(pesoMin, pesoMax) { return cosas.any {cosa=> (cosa.peso()>= pesoMin) && (cosa.peso()<= pesoMax)} }
 
	method cosaMasPesada() {return cosas.max { cosa => cosa.peso()} }

	method pesos() { return cosas.map { cosa => cosa.peso()}}

	method cantidadTotalDeBultos(){ return cosas.sum{ cosa=>cosa.bultos()}}

	method sufrirAccidente(){cosas.forEach{cosa => cosa.efectosAccidente()}}

	method descargarCamionEn(unLugar){unLugar.recibir(cosas) cosas.clear()}

	method transportar(destino, camino) {
    self.validarTransporte(destino, camino)
    self.descargarCamionEn(destino)
	}
	method validarTransporte(destino, camino) {
   	 if (!camino.puedeSoportar(self)) {
       	 self.error(
            "El camión no puede transportar por " + camino.nombre() + ". " +
            "En el destino queda: " + destino.cosasAlmacenadas() + ". " +
            "En el vehículo queda: " + self.cosas() + "."
        )
     }
	}
}

 //-- Destinos --//
object almacen{
	var property cosasAlmacenadas = #{}

	method recibir(cargaDeCosas){ cosasAlmacenadas.addAll(cargaDeCosas)}
}

//-- Camionos --//
object ruta9{
	
	method puedeSoportar(unCamion){ return unCamion.puedeCircularEnRuta(20)}
	
	method nombre() { return "Ruta 9"}
}
object caminosvecinales{
	var pesoMaxSoportado =  0
	
	method configurarPesoMaxSoportado(peso) { pesoMaxSoportado = peso}
	
	method puedeSoportar(unCamion){  return unCamion.pesoTotalCamion() <= pesoMaxSoportado }

	method nombre() { return "Caminos Vecinales"}
}
	

