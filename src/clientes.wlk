import centrodistribucion.*
import vendedores.*
class Cliente {
	
	method puedeSerAtendido(vendedor)
	
}
class ClienteInseguro inherits Cliente{
	override method puedeSerAtendido(vendedor){
		return  vendedor.esVersatil() and vendedor.esFirme()
	}
}
class ClienteDetallista inherits Cliente{
	override method puedeSerAtendido(vendedor){
		return vendedor.certProductos()>=3
	}
}
class ClienteHumanista inherits Cliente{
	override method puedeSerAtendido(vendedor){
		return vendedor.esPersonaFisica()
	}
}
