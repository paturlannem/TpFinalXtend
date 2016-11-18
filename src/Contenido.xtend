import java.util.Date
import java.util.ArrayList

abstract class Contenido{
	
	String nombre
	Date fechaModificacion
	
	def nombre(){
		return nombre
	}
	
	def fechaModificacion(){
		return fechaModificacion
	}
	
	def sePuedeSubir(Biblioteca biblioteca){
    	!biblioteca.contiene(this)  &&
    	this.nombreCorto()
	}

	def nombreCorto(){
    	nombre.length < 200
	}
	
	def modificar(){
    	fechaModificacion = new Date()
    }
    
    def renombrar(String nuevoNombre){
    	nombre = nuevoNombre
    	this.modificar()
    }
    
    def double tamanio()
    
    def sum(Integer[] lista){
		
		var int suma = 0

        for (int tamanio : lista) {

            suma += tamanio;
        }
        
        return suma
	}
	
	def boolean roto(Biblioteca biblioteca)
	
}
	
abstract class ContenidoSimple extends Contenido{
	override double tamanio()
	
	def esLiviano(){
    	return this.tamanio() > 150
    }
    
    def entraEnBiblioteca(Biblioteca biblioteca){
    	!biblioteca.rebalsa(this) &&
    	!biblioteca.superaTamañoIndividual(this)
	}

	override roto(Biblioteca biblioteca){
    	return !biblioteca.contiene(this)
    }	
}

class ContenidoBinario extends ContenidoSimple{

	double bytes
	Compresion compresion
	
	override tamanio(){
    	return compresion.reducir(bytes)
	}
}

class ContenidoTexto extends ContenidoSimple{

	String[] lineas
	
	override tamanio(){
    	var mapeo = lineas.map[length]
    	return this.sum(mapeo)	
    }
}

      
abstract class ContenidoEspecial extends Contenido{
	
	override tamanio(){
    	return 0
    }
    
    def entraEnbiblioteca(Biblioteca biblioteca){
    	return !this.roto(biblioteca)
	}
	
	override boolean roto(Biblioteca biblioteca)

}


class Link extends ContenidoEspecial{
	
	String nombreLink
	ContenidoEspecial contenidoReferenciado
	
	def liviano(){
    	return true	
    }
    
    override roto(Biblioteca biblioteca){
    	contenidoReferenciado.roto(biblioteca)
    }
}

class Carpeta extends ContenidoEspecial{
	
	ArrayList<Contenido> contenidos
	
	def liviano(){
    	contenidos.forall[ liviano() ]
    }
    
    override roto(Biblioteca biblioteca){
    	contenidos.forall [ roto(biblioteca) ]	
    }    
}