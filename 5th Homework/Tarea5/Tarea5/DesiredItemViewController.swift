//
//  DesiredItemViewController.swift
//  Tarea5
//
//  Created by CCDM18 on 11/25/19.
//  Copyright © 2019 CCDM18. All rights reserved.
//

import UIKit

class DesiredItemViewController: UIViewController
{
    var item: DesiredItem?;
    var delegado: ViewController?;
    
    @IBOutlet weak var nombre: UITextField!
    @IBOutlet weak var tienda: UITextField!
    @IBOutlet weak var costo: UITextField!
    @IBOutlet weak var explicacion: UITextField!
    
    @IBOutlet weak var grado: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stepper.wraps = true;
        stepper.autorepeat = true;
        stepper.maximumValue = 5;
        if let articulo = item{
            nombre.text = articulo.nombre;
            tienda.text = articulo.tienda;
            costo.text = "\(articulo.costo)"
            explicacion.text = articulo.explicacion;
            grado.text = "\(articulo.grado)";
        }
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func guardarItem(_ sender: Any)
    {
        
        let nombre = self.nombre.text;
        let tienda = self.tienda.text;
        let costo = Decimal(Double(self.costo.text!)!);
        let explicacion = self.explicacion.text;
        let grado = Int(self.grado.text!);
        if let articulo = item{
            let ite = DesiredItem(id:articulo.id,nombre:nombre!,tienda:tienda!,costo:costo,grado:grado!,explicacion:explicacion!);
            delegado?.agregarItem(item: ite);
        }else{
            let ite = DesiredItem(nombre:nombre!,tienda:tienda!,costo:costo,grado:grado!,explicacion:explicacion!);
            delegado?.agregarItem(item: ite);
        }
        /*let item = DesiredItem(nombre: nombre!,tienda:tienda!,costo:costo,grado:grado!,explicacion:explicacion!);
        delegado?.agregarItem(item: item);*/
        cerrarVentana()
    }
    
    func cerrarVentana(){
        if presentingViewController != nil{
            dismiss(animated: true, completion: nil)
        }else{
            navigationController!.popViewController(animated: true);
        }
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        grado.text = Int(sender.value).description;
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
