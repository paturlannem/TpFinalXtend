interface Compresion{
	
	def double reducir(double tamanioOriginal)
}

class SinCompresion implements Compresion{
	override reducir(double tamanioOriginal){
    	return tamanioOriginal
	}
}

class Reflate implements Compresion{ 
	override reducir(double tamanioOriginal){
    	return tamanioOriginal * 0.8
	}
}

class Bsip2 implements Compresion{ 
	override reducir(double tamanioOriginal){ 
    	if (tamanioOriginal > 100)
      		return tamanioOriginal * 0.6
      		
    	else 
      		return tamanioOriginal * 0.1 	
	}
}