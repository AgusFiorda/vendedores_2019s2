class Vendedor {
	var certificaciones=[]
	method agregarCertificacion(certif){
		certificaciones.add(certif)
	}
	method puedeTrabajar(city)
		
	method esVersatil(){
		return certificaciones.size()>=3 and certificaciones.any({c=>c.esProducto()}) and certificaciones.any({c=>not c.esProducto()})
	}
	method esFirme(){
		return certificaciones.sum({c=>c.puntos()})>=30
	}
	method esInfluyente()
	
	method tieneAfinidad(centro){
		return self.puedeTrabajar(centro.ciudad())
	}
	
	method totalPuntos(){
		return certificaciones.sum({cert=>cert.puntos()})
	}
	method esGenerico(){
		return  certificaciones.any({cer=>not cer.esProducto()})
	}
	method certProductos(){
		return certificaciones.count({cert=>cert.esProducto()})
	}
	method esPersonaFisica()
	
}
class VendedorFijo inherits Vendedor{
	var property ciudad
	
	override method puedeTrabajar(city){
		return self.ciudad()==city
	}
	override method esInfluyente(){
		return false
	}
	override method esPersonaFisica(){
		return true
	}
}
class Viajante inherits Vendedor{
	var habilitadoProv=[]
	method estaHabilitado(prov){
		habilitadoProv.add(prov)
	}
	override method puedeTrabajar(city){
		return habilitadoProv.contains(city.provincia())
	}
	override method esInfluyente(){
		return habilitadoProv.sum({prov=>prov.poblacion()})>=10000000
	}
	override method esPersonaFisica(){
		return true
	}
}
class ComercioCorresponsal inherits Vendedor{
	var sucursalesEn=[]
	
	method agregarSucursal(city){
		sucursalesEn.add(city)
	}
	override method puedeTrabajar(city){
		return sucursalesEn.contains(city)
	}
	override method esInfluyente(){
		
		var provs= sucursalesEn.map({ciu=>ciu.provincia()})
		return provs.asSet().size() >=3 or  sucursalesEn.size()>=5

	}
 	override method tieneAfinidad(centro){
		super(centro)
		
		return sucursalesEn.any({ciudad=>ciudad == centro.ciudad()}) and not centro.puedeCubrir(centro.ciudad()) 
		}
	override method esPersonaFisica(){
		return false
	}
}

class Ciudad{
	var property provincia
}
class Provincia{
	var property poblacion=0
}
class Certificacion{
	var property puntos=0
	var property esProducto
	
}