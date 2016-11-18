import java.util.ArrayList

class Biblioteca{
	
	int maximoTamanioIndividual
	ArrayList<Contenido> contenidos

	def contiene(Contenido contenido){
    	contenidos.contains(contenido)
	}

	def superaTamañoIndividual(Contenido contenido){
    	return contenido.tamanio() > maximoTamanioIndividual
	}



	def rebalsa(Contenido contenido){
    	return this.tamanio() + contenido.tamanio() > 500 * maximoTamanioIndividual
	}

	def sum(Double[] lista){
		
		var double suma = 0

        for (double tamanio : lista) {

            suma += tamanio;
        }
        
        return suma
	}

	def double tamanio(){
    	var mapeo = contenidos.map[ tamanio() ]
    	return this.sum(mapeo)
	}
	
	def subir(Contenido contenido){
    	if (!contenido.sePuedeSubir(this)){
    		throw new AssertionError("No se puede subir")	
    	}
    	else{
    		contenido.modificar()
    		contenidos.add(contenido)
		}	
	}
	
	def buscarPorNombre(String nombre){
    	contenidos.findFirst[contenido | contenido.nombre.contains(nombre)]
	}
	
	def actividadReciente(){
    	contenidos.sortBy [ fechaModificacion ].take(5).map [ nombre ]
    }
    
    def eliminar(Contenido contenido){
    	contenidos.remove(contenido)
    }
    
    def removerRotos(){
    	contenidos.removeIf[roto(this)]
	}
}

class SuperBiblitoeca extends Biblioteca{

	override rebalsa(Contenido contenido){ 
    	return false    
	}
}