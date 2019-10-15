class Estudiante {
	
	//var property aprobaciones = [] 
	//var property carreras =[]
	//var property materiasInscripto = []
	
	var carreras = []
	var aprobaciones = []
	var materiasInscripto = []
	
	method registrarAprobacion(materia,nota) {
		//registra una aprobacion y tira error si esta duplicada.
		if( not aprobaciones.any({aprob => aprob.materia() == materia}) ){
			aprobaciones.add(new Aprobacion(nota = nota,materia = materia))
		}
		else {self.error("Ya esta aprobada")}
	}
	method inscribirseCarrera(carrera) {
		carreras.add(carrera)
	}
	method materiasDeLasCarrerasInscripto(){
		return carreras.flatMap({car=>car.materias()})
	}
	
	method estaAprobada(materia) {
		return aprobaciones.any({mat=>mat.materia() == materia})
	}
	
	method cantMateriasAprobadas() {
		return aprobaciones.size()
	}
	method promedio() {//ARREGLAR
		var notas = aprobaciones.sum({m=>m.nota()})
		return notas/ self.cantMateriasAprobadas()
	}
	
	method correspondeMat(materia) {
		return carreras.any({m => m.materias() == materia})
	}
	method noEstabaAprobada(materia) {
		return not self.estaAprobada(materia)
	}
	method incribirseAMateria(materia) {
		materiasInscripto.add(materia)
	}
	method salirDeMateria(materia) {
		materiasInscripto.remove(materia)
	}
	method noEstabaInscripto(materia) {
		return not materiasInscripto.contains(materia)
	}
	method apruebaRequisitos(materia) {
	//SI LA MATERIA NO TIENE REQUISITOS DA FALSE
		var requisitos = materia.requisitos()
		return aprobaciones.any({m => m.materia() == requisitos})
	}
	method puedeInscribirse(materia) {
		return self.correspondeMat(materia) and
		self.noEstabaAprobada(materia) and
		self.noEstabaInscripto(materia) and
		self.apruebaRequisitos(materia)
	}
}

class Aprobacion {
	//atributos: materia y nota
	var property materia 
	var property nota
	
}

class Materia {
	var property requisitos = []
}

object programacion {
	var property materias
}
object medicina {
	var property materias
}
object derecho {
	var property materias
}