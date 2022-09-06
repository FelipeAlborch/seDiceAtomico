import centrales.*

object springfield {
	var fuerzaDeVientosQueSoplan = 10
	var riquezaDelSuelo = 0.9
	var centrales = #{centralAtomica, centralDeCarbon, centralEolica}
	var necesidadEnergetica
	
	method fuerzasDeVientoQueSoplan() {
		return fuerzaDeVientosQueSoplan
	}
	
	method necesidadEnergetica() {
		return necesidadEnergetica
	}
	
	method riquezaDelSuelo() {
		return riquezaDelSuelo
	}
	
	method centralesContaminantes() {
		return centrales.filter({central => central.contaminacion()})
	}
	
	method produccionEnergeticaTotalDeCentrales() {
		return centrales.sum({central => central.produccionEnergetica()})
	}
	
	method necesidadesCubiertas() {
		return self.produccionEnergeticaTotalDeCentrales() >= self.necesidadEnergetica()
	}
	
	method soloCentralesContaminantes() {
		return centrales.filter({central => central.contaminacion()})
	}
	
	method produccionDeCentralesEnExceso() {
		return self.soloCentralesContaminantes().produccionEnergeticaTotalDeCentrales() - self.necesidadEnergetica()
	}
	
	method sonTodasCentralesContaminantes() {
		return centrales.all({central => central.contaminacion()})
	}
	
	method excesoMayorAl50PorCientoDeLaNecesidadEnergetica() {
		return self.produccionDeCentralesEnExceso() > (self.necesidadEnergetica() * 0.5)
	}
	
	method estaAlHorno() {
		return self.excesoMayorAl50PorCientoDeLaNecesidadEnergetica() || self.sonTodasCentralesContaminantes()
	}
	
}
