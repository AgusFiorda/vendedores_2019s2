import vendedores.*
class Centro {
	var property ciudad=[]
	var vendedores=[]
	
	method agregarVendedor(vendedor)
	{
		if(vendedores.contains(vendedor)){
			return "error"
		}
		vendedores.add(vendedor)
		return "vendedor agregado exitosamente"
	}
	method vendedorEstrella(){
		return vendedores.max({vend=>vend.totalPuntos()})
	}
	method puedeCubrir(city){
		return vendedores.any({vend=>vend.puedeTrabajar(city)})
	}
	method vendedoresGenericosRegistrados(){
		return vendedores.filter({vend=>vend.esGenerico()})
	}
	method esRobusto(){
		return vendedores.count({vend=>vend.esFirme()})>=3
	}
	
	method repartirCertificacion(){
		const certificacionDada = new Certificacion(puntos=20,esProducto=true)
		
		vendedores.forEach({vend=>vend.agregarCertificacion(certificacionDada)})
	}
	method esCandidato(vendedor){
		return vendedor.esVersatil() and vendedor.tieneAfinidad(self)
	}
	
}
