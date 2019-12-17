//
//  Maestro.swift
//  Tarea4
//
//  Created by CCDM18 on 11/4/19.
//  Copyright © 2019 CCDM18. All rights reserved.
//

import Foundation
class Maestro{
    var nombre:String;
    var sexo:String;
    var grado:String;
    var calificacion:Int;
    var facultad:String;
    var carreras:String;
    var materias:String;
    var id : Int;
    static var cont:Int = 0;
    
    
    init(n:String,s:String,g:String,c:Int,f:String,ca:String,ma:String)
    {
        self.nombre = n;
        self.sexo = s;
        self.grado = g;
        self.calificacion = c;
        self.facultad =  f;
        self.carreras =  ca;
        self.materias = ma;
        Maestro.cont+=1;
        self.id = Maestro.cont;
        
       
    }
}
