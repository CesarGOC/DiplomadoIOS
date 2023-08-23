import UIKit

var greeting = "Hello, playground"


 //arreglos
var array = [1,2,3,4]
var arrayDos: [String] = ["pedro", "cesar", "juan"]

array[0]

array.append(3)
array+=[1,2,3,4]

// set, no valores repetidos y colecciones no ordenadas
var miSet: Set<String> = ["pedro", "cesar", "juan"]
miSet.insert("paolo")

miSet.contains("paco")



//diccionariors

var miDiccionario: [String:String] = ["Nombre":"Grecia", "Edad":"18"]

miDiccionario["Color favorito"] = "Rojo"

miDiccionario


//tuplas

var colorUno = "Rojo"
var codigo = "0#fff"

var color = ("Rojo","0#fff")

color.0
color.1

var alumno = ("dante sanchez",8)

alumno.0
alumno.1

var alumno2 = (nombre: "dante sanchez",edad:8)

alumno2.nombre
alumno2.edad
