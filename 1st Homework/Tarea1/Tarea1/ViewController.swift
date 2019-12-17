//
//  ViewController.swift
//  Tarea1
//
//  Created by CCDM18 on 10/1/19.
//  Copyright © 2019 CCDM18. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var color: UILabel!
    
    @IBOutlet weak var verde: UIButton!
    @IBOutlet weak var rojo: UIButton!
    @IBOutlet weak var azul: UIButton!
    @IBOutlet weak var amarillo: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func click(_ sender: Any)
    {
        var boton : UIButton = sender as! UIButton
        if(boton == verde)
        {
            color.text = "Verde"
            color.textColor = UIColor.green
        }else if(boton == rojo){
            color.text = "Rojo"
            color.textColor = UIColor.red
        }else if(boton == azul){
            color.text = "Azul"
            color.textColor = UIColor.blue
        }else{
            color.text = "Amarillo"
            color.textColor = UIColor.yellow
        }
        
    }
    
}

