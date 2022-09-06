import springfield.*

object centralAtomica {
	var varillasDeUranio
	
	method varillasDeUranio(cantidad) {
		varillasDeUranio = cantidad
	}
	
	method produccionEnergetica(unaCiudad) {
		return 0.1 * varillasDeUranio
	}
	
	method contaminacion() {
		return varillasDeUranio > 20
	}
}

object centralDeCarbon {
	var capacidad
	
	method produccionEnergetica(unaCiudad) {
		return 0.5 + capacidad * unaCiudad.riquezaDelSuelo() 
	}
	
	method contaminacion() {
		return true
	}
}

object centralEolica {
	var turbinas = [turbina1]
	
	method produccionEnergetica(unaCiudad) {
		return turbinas.sum({turbina => turbina.produccionTurbina(unaCiudad)})
	} 
	
	
	method contaminacion() {
		return false
	}
}

object turbina1 {
	method produccionTurbina(unaCiudad) {
		return 0.2 * unaCiudad.fuerzaDeVientosQueSoplan() 
	}
}