//
//  ViewController2.swift
//  Tarea#6
//
//  Created by CCDM18 on 12/9/19.
//  Copyright © 2019 CCDM18. All rights reserved.
//

import UIKit

class ViewController2: UIViewController,UITableViewDataSource {
    
    var diasFestivos:[DiaFestivo]?;
    var dias = [DiaFestivo]();
    var pais:String?;
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self;
        if let dia = diasFestivos, let country = pais{
             for day in dia.reversed() {
                dias.append(day);
            }
            navigationItem.title = country;
        }
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "celda")!
        cell.textLabel?.text = dias[indexPath.row].nombre;
        cell.detailTextLabel?.text = "Fecha: "+dias[indexPath.row].fecha;
        if(dias[indexPath.row].paso){
            cell.imageView?.image = UIImage(named: "yes")
        }else{
            cell.imageView?.image = UIImage(named: "no")
        }
        return cell;
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dias.count;
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
