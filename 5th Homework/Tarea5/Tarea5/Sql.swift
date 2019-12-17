
import Foundation
import SQLite3
import os.log

class Sql{
    var fileUrl:URL;
    var data: FMDatabase;
    init(){
        let fileUrl =  try! FileManager.default.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("Items")
        let data = FMDatabase(url: fileUrl)
        self.data = data;
        self.fileUrl = fileUrl;
        if(crearTablaItems()){
            print("Tabla creada exitosamente");
        }
    }
    
    func abrirConexion()->Bool{
        return data.open();
    }
    
    func crearTablaItems()->Bool{
        var respuesta = true;
        if abrirConexion(){
            let cmd = "create table if not exists Productos(id integer primary key autoincrement, nombre text not null, tienda text not null, costo real not null, grado integer not null, explicacion text not null)";
            do{
                try data.executeUpdate(cmd, values: nil);
                print("Tabla Creada");
            }catch{
                print("Error al crear la Tabla");
            }
            data.close();
        }else{
            respuesta = false;
        }
        return respuesta;
    }
    
    func mostrarItems()->[DesiredItem]{
        var productos: [DesiredItem] = [DesiredItem]();
        var nombre,tienda,explicacion : String;
        var id,grado:Int;
        var costo: Decimal;
        do{
            if data.open(){
                let rs = try data.executeQuery("Select id,nombre,tienda,costo,grado,explicacion from Productos order by grado desc, costo desc", values: nil)
                while(rs.next()){
                    id = Int(rs.string(forColumn: "id")!)!;
                    nombre = rs.string(forColumn: "nombre")!;
                    tienda = rs.string(forColumn: "tienda")!;
                    costo = Decimal(Double(rs.string(forColumn: "costo")!)!);
                    grado = Int(rs.string(forColumn: "grado")!)!;
                    explicacion = rs.string(forColumn: "explicacion")!;
                    let item = DesiredItem(id:id,nombre:nombre,tienda:tienda,costo:costo,grado: grado,explicacion: explicacion);
                    productos.append(item);
                    
                }
                data.close()
            }
        }catch{
            print("Error al consultar");
        }
        return productos;
    }
    
    func insertarItem(item:DesiredItem)->Bool{
        var respuesta = false;
        if data.open(){
            let insert = "Insert into Productos(nombre,tienda,costo,grado,explicacion) VALUES(?,?,?,?,?)";
            do{
            
                try data.executeUpdate( insert, values: [item.nombre,item.tienda,item.costo,item.grado,item.explicacion]);
                respuesta = true;
                
            }catch{
                print("Error al Insertar");
            }
        }
        data.close();
        return respuesta;
    }
    
    func borrarItem(id:Int)->Bool{
        var respuesta = false;
        if data.open(){
            let comando = "Delete  from Productos where id = ?";
            
            do{
                try data.executeUpdate(comando, values: [id]);
                respuesta = true;
            }catch{
                print("No eliminado");
            }
            data.close();
        }
        return respuesta;
    }
    
    func actualizarItem(item:DesiredItem)->Bool{
        var respuesta = false;
        if data.open(){
            let comando = "update Productos set nombre = ?, tienda = ?,costo = ?,grado = ?,explicacion = ? where id = ?";
            
            do{
                try data.executeUpdate(comando, values:[item.nombre,item.tienda,item.costo,item.grado,item.explicacion,item.id]);
                respuesta = true;
            }catch{
                print("Error al Actualizar");
            }
            data.close();
        }
        return respuesta;
    }
    
    
}
