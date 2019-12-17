

import Foundation
class Facultad{
    
    var nombre : String;
    var maestros: [Maestro];
    
    init (nombre:String,maestros:[Maestro])
    {
        self.nombre = nombre;
        self.maestros = maestros;
    }
    
    func getNombre()->String{
        return self.nombre;
    }
}
