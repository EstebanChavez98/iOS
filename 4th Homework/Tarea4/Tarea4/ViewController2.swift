//
//  ViewController2.swift
//  Tarea4
//
//  Created by CCDM18 on 11/7/19.
//  Copyright © 2019 CCDM18. All rights reserved.
//

import UIKit

class ViewController2: UIViewController
{

    var maestro: Maestro?;
    var delegado: ViewController?;
    
    @IBOutlet weak var nombre: UITextField!
    @IBOutlet weak var sexo: UISegmentedControl!
    @IBOutlet weak var grado: UITextField!
    @IBOutlet weak var facultad: UITextField!
    @IBOutlet weak var calificacion: UITextField!
    @IBOutlet weak var carreras: UITextField!
    @IBOutlet weak var materias: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let m =  maestro
        {
            nombre.text = m.nombre;
            sexo.selectedSegmentIndex = m.sexo == "Masculino" ? 0 : 1;
            grado.text = m.grado;
            facultad.text = m.facultad;
            calificacion.text =  String(m.calificacion);
            carreras.text = m.carreras;
            materias.text = m.materias;
            
            
        }
          
       
    }

    @IBAction func GuardarMaestro(_ sender: Any)
    {
        let nombre = self.nombre.text;
        let sexo = self.sexo.titleForSegment(at: self.sexo.selectedSegmentIndex);
        let grado = self.grado.text;
        let facultad = self.facultad.text;
        let calificacion = Int(self.calificacion.text!);
        let carreras = self.carreras.text;
        let materias = self.materias.text;
        
        
       
        let maestro = Maestro(n:nombre!,s:sexo!,g:grado!,c:calificacion!,f:facultad!,ca:carreras!,ma:materias!)
        delegado?.agregarMaestro(maestro: maestro);
        cerrarVentana()
    }
    func cerrarVentana(){
        if presentingViewController != nil{
            dismiss(animated: true, completion: nil)
        }else{
            navigationController!.popViewController(animated: true);
        }
    }
    
    @IBAction func goBack(_ sender: Any) {
        cerrarVentana();
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
