import cosas.*

object camion {
	const property cosas = #{}
		
	method cargar(unaCosa) {if (!cosas.contains(unaCosa)){cosas.add(unaCosa)}}
	method descargar(unaCosa){ if (cosas.contains(unaCosa)) {cosas.remove(unaCosa)}}
}