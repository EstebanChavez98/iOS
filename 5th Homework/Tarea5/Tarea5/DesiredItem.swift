//
//  DesiredItem.swift
//  Tarea5
//
//  Created by CCDM18 on 11/21/19.
//  Copyright © 2019 CCDM18. All rights reserved.
//

import Foundation

class DesiredItem{
    
    var id: Int;
    var nombre: String;
    var tienda: String;
    var costo: Decimal;
    var grado: Int;
    var explicacion: String;
    
    init(id:Int,nombre:String,tienda: String, costo:Decimal, grado: Int,explicacion:String){
        
        self.id = id; self.nombre = nombre; self.tienda = tienda;
        self.costo = costo; self.grado = grado; self.explicacion = explicacion;
    }
    init(nombre:String,tienda: String, costo:Decimal, grado: Int,explicacion:String){
        id = 0;
        self.nombre = nombre; self.tienda = tienda; self.costo = costo;
        self.grado = grado; self.explicacion = explicacion;
    }
}
