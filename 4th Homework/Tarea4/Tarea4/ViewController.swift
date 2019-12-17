//
//  ViewController.swift
//  Tarea4
//
//  Created by CCDM18 on 10/29/19.
//  Copyright © 2019 CCDM18. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {

    
    
    @IBOutlet weak var tableView: UITableView!
    var data: MaestroManager = MaestroManager();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.facultades().count;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.maestros(maestrosEnFacultadIndice: section).count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier")!
        let maestro = data.maestros(maestrosEnFacultadIndice :indexPath.section)[indexPath.row];
        cell.textLabel?.text = maestro.nombre;
        cell.detailTextLabel?.text = maestro.facultad;
        if maestro.sexo == "Femenino"{
            cell.imageView?.image = UIImage(named: "woman")
        }else{
            cell.imageView?.image = UIImage(named:"man")
        }
        return cell
    }

   func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let text = data.facultades()[section];
        return text;
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let maestroSeleccionado = tableView.indexPathForSelectedRow,
            let maestrosVc = segue.destination as? ViewController2{
            maestrosVc.maestro = data.leerMaestro(at: maestroSeleccionado.row, seccion: maestroSeleccionado.section);
            maestrosVc.delegado = self;
        }
        else if let navContro = segue.destination as? UINavigationController,
            let maestrosControl = navContro.topViewController as? ViewController2{
            maestrosControl.delegado = self;
        }
    }
    
    func agregarMaestro(maestro:Maestro){
        
        if let selected = tableView.indexPathForSelectedRow{
            data.editarMaestro(seccion: selected.section, indice:selected.row , maestro: maestro);
        }else{
            data.guardarMaestro(maestro: maestro);
        }
        tableView.reloadData();
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


}

