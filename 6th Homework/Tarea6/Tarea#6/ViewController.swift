//
//  ViewController.swift
//  Tarea#6
//
//  Created by CCDM18 on 12/5/19.
//  Copyright © 2019 CCDM18. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON



class ViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource  {
    var pickerData: [String] = [String]()
    var dias = [DiaFestivo]();
    
    @IBOutlet weak var festivo: UILabel!
    @IBOutlet weak var fechaActual: UILabel!
    @IBOutlet weak var Pais: UILabel!
    @IBOutlet weak var fijo: UITextField!
    @IBOutlet weak var fecha: UITextField!
    @IBOutlet weak var proximoDia: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        self.festivo.text = "Dia No Festivo";
        pickerData = ["México", "USA", "Canada", "Japon", "Egipto", "Gran Bretaña"]
        
        
        cargarFechaActual()
        esDiaFestivo(pais: "mx")
        cargarDiasFestivos(pais: "mx")
        Pais.text = "Proximo dia Festivo en Mexico"
        cargarProximoDia(pais: "MX");
        
        // Do any additional setup after loading the view.
    }
    func numberOfComponents(in pickerView: UIPickerView)-> Int {
         return 1
     }
     func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int)->Int {
         return pickerData.count
     }
     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return pickerData[row]
        }
    func cargarFechaActual(){
        let fecha = Date();
        fechaActual.text = String(fecha.description.split(separator: " ")[0])
    }
    func esDiaFestivo(pais:String){
        Alamofire.request("https://date.nager.at/Api/v1/Get/\(pais)/2020", method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                for elemento in json.array!{
                    let f1 = String(Date().description.split(separator: " ")[0])
                    if(f1 == elemento["date"].stringValue){
                        self.festivo.text = "Dia Festivo"
                        break;
                    }
            
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    func cargarProximoDia(pais:String){
     Alamofire.request("https://date.nager.at/Api/v2/NextPublicHolidays/\(pais)", method: .get).validate().responseJSON { response in
             switch response.result {
             case .success(let value):
                 let json = JSON(value)
                 self.proximoDia.text = json[0]["localName"].stringValue
                 let date = json[0]["date"].stringValue.split(separator: "-")
                 let formato = "\(date[2])-\(date[1])-\(date[0])"
                 self.fecha.text = formato;
                  let fixed = json[0]["fixed"].boolValue
                 if fixed{
                     self.fijo.text = "Dia Feriado"
                 }else{
                     self.fijo.text = "Dia no Feriado"
                 }
                 
                 print("JSON: \(json)")
             case .failure(let error):
                 print(error)
             }
         }
     }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        Pais.text = "Proximo dia Festivo en \(pickerData[row])"
        cargarProximoDia(pais: getPrefijo(pais:pickerData[row] ))
        esDiaFestivo(pais: getPrefijo(pais:pickerData[row]))
        self.dias.removeAll()
        cargarDiasFestivos(pais: getPrefijo(pais:pickerData[row]));
        print(pickerData[row])
    }
    
      override func prepare(for segue: UIStoryboardSegue, sender: Any?)
      {
        if let diasFestivos = segue.destination as? ViewController2{
            //var prefijo = getPrefijo(pais:pickerData[pickerView.selectedRow(inComponent: 0)])
            diasFestivos.diasFestivos = self.dias;
            diasFestivos.pais = pickerData[pickerView.selectedRow(inComponent: 0)]
        }
      }
    func cargarDiasFestivos(pais:String){
        Alamofire.request("https://date.nager.at/Api/v2/PublicHolidays/2019/\(pais)", method: .get).validate().responseJSON { response in
                   switch response.result {
                   case .success(let value):
                       let json = JSON(value)
                       for elemento in json.array!{
                        let nombre = elemento["localName"].stringValue;
                        let fecha = elemento["date"].stringValue;
                        
                        let date = Date()
                        let formatter = DateFormatter()
                        formatter.dateFormat = "yyyy-MM-dd"
                        let fechaActual = formatter.string(from: date)

                        let diaFestivo = DiaFestivo(nombre:nombre,fecha:fecha)
                        if(diaFestivo.fecha < fechaActual){
                            diaFestivo.paso = true;
                        }
                        self.dias.append(diaFestivo)
                       }
                   case .failure(let error):
                       print(error)
                   }
               }
        
    }
   

    
    func getPrefijo(pais:String)->String{
        let nombre:String
        if(pais == "México"){
            nombre = "MX";
        }else if(pais == "USA"){
            nombre = "US"
        }else if(pais == "Canada"){
            nombre = "CA"
        }else if(pais == "Japon"){
            nombre = "JP"
        }else if(pais == "Egipto"){
            nombre = "EG"
        }else{
            nombre = "GB"
        }
        return nombre;
    }


}

