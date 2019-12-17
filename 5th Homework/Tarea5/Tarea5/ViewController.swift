//
//  ViewController.swift
//  Tarea5
//
//  Created by CCDM18 on 11/19/19.
//  Copyright © 2019 CCDM18. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var data: Sql = Sql();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self;
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.mostrarItems().count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda")!
        let item = data.mostrarItems()[indexPath.row];
        cell.textLabel?.text = item.nombre;
        cell.detailTextLabel?.text = "Grado: \(item.grado) con costo de $ \(item.costo) en la tienda \(item.tienda)"
        return cell;
    }
    
    func agregarItem(item: DesiredItem){
    
        if let selected = tableView.indexPathForSelectedRow{
            if data.actualizarItem(item: item){
                print("Actualizado Correctamente")
            }
        }else{
            if(data.insertarItem(item: item)){
                print("Insertado Correctamente")
            }
        }
        tableView.reloadData();
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let itemSeleccionado = tableView.indexPathForSelectedRow,
            let desiredItemVc = segue.destination as? DesiredItemViewController{
            desiredItemVc.item = data.mostrarItems()[itemSeleccionado.row]
            desiredItemVc.delegado = self
        }
        else if let navContro = segue.destination as? UINavigationController,
            let itemView = navContro.topViewController as? DesiredItemViewController{
            itemView.delegado = self;
        }
        
    
    }
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let id = data.mostrarItems()[indexPath.row].id;
            if data.borrarItem(id: id){
                print("Se actualizo Correctamente");
            }
            tableView.reloadData()
        }else if editingStyle == .insert{
            
        }
    }


}

