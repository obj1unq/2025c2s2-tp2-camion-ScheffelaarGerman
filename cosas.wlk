object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}
object arenaAGranel {
	var peso = 0
	method configurarPeso(_peso) {peso = _peso}
	method peso() { return peso }
	method nivelPeligrosidad() { return 1 }
}
object bumblebee {
	var esAuto = true
	method transformarEnAuto(){ esAuto = true}
	method transformarEnRobot() { esAuto = false}
	method peso() { return 800 }
	method nivelPeligrosidad() { if (esAuto) {return 15} else {return 30} }
}
object ladrillos {
	var cantidad = 0
	method configurarCantidad(_cantidad) { cantidad = _cantidad}
	method peso() { return 2*cantidad }
	method nivelPeligrosidad() { return 2 }
}
object bateriaAntiaerea{
	var estaConMisiles = false
	method ponerMisiles() { estaConMisiles = true}
	method sacarMisiles() { estaConMisiles = false}
	method peso() { if (estaConMisiles) {return 300} else {return 200}}
	method nivelPeligrosidad(){ if (estaConMisiles){return 100} else {return 0} }
}
object residuosRadioactivos{
	var peso = 0
	method configurarPeso(_peso){ peso= _peso}
	method peso() { return peso}
	method nivelPeligrosidad() { return 200}
}
object contenedorPortuario{
	var property cosas = []
	const pesoBase = 100
	method cargarCon(unaCosa){return cosas.add(unaCosa)}
	method peso() { if (cosas.isEmpty()){ return pesoBase} else {return pesoBase +self.pesoDelaCarga()} }
	method pesoDelaCarga() {return cosas.sum{cosa => cosa.peso()} }
	method nivelPeligrosidad() { if (cosas.isEmpty()){ return 0} else {return self.maxNivelPeligrosidadEnLaCarga()} }
	method maxNivelPeligrosidadEnLaCarga(){return cosas.max{cosa => cosa.nivelPeligrosidad()} }
} 
object embalajeDeSeguridad{
	var contenido = null
	method embalar(unaCosa){ contenido = unaCosa}
	method peso(){ return contenido.peso()}
	method nivelPeligrosidad(){ return contenido.nivelPeligrosidad() / 2}
}
