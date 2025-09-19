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
	method trnsformarEnRobot() { esAuto = false}
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
	var estaConMisiles = true
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
