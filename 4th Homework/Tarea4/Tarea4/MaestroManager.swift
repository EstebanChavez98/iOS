//
//  MaestroManager.swift
//  Tarea4
//
//  Created by CCDM18 on 11/4/19.
//  Copyright © 2019 CCDM18. All rights reserved.
//

import Foundation
class MaestroManager{
    
    private lazy var maestros: [Maestro] = self.cargarMaestros();
    
    
    func cargarMaestros()->[Maestro]
    {
        let maestros:[Maestro] = [
            Maestro(n:"Esteban",s:"Masculino",g:"Ingenieria",c:10,f:"Sistemas",ca:"Sistemas Tics",ma:"Programacion II Estructura de Datos"),
                Maestro(n:"Jane",s:"Femenino",g:"Licenciatura",c:10,f:"Sistemas",ca:"Electronica Electrica",ma:"Circuitos Electricos Circuitos Electricos y Electronicos")
               
               ]
        return maestros;
    }
    func facultades()->[String]
    {
        var facultades = [String]();
        for maestro in self.maestros{
            if !facultades.contains(maestro.facultad){
                facultades.append(maestro.facultad)
            }
            
            
        }
        return facultades;
        
    }
    func numeroDeMaestros(indiceFacultad indice:Int)->Int{
        var contador = 0;
        for maestro in self.maestros{
            if maestro.facultad == facultades()[indice]{
                contador+=1;
            }
        }
        return contador;
    }
    func maestros(maestrosEnFacultadIndice indice:Int)->[Maestro]
    {
        var teachers = [Maestro]();
        for maestro in self.maestros{
            if maestro.facultad == facultades()[indice]{
                teachers.append(maestro);
            }
        }
        return teachers;
    }
    func leerMaestro(at:Int,seccion:Int)->Maestro
    {
        let maestro = maestros(maestrosEnFacultadIndice: seccion)[at];
        return maestro;
        
    }
    func editarMaestro(seccion:Int,indice:Int,maestro:Maestro){
        let id = maestros(maestrosEnFacultadIndice: seccion)[indice].id;
        for i in 0...(self.maestros.count-1){
            if maestros[i].id == id{
                maestros[i].nombre = maestro.nombre;
                maestros[i].sexo = maestro.sexo;
                maestros[i].calificacion = maestro.calificacion;
                maestros[i].grado = maestro.grado;
                maestros[i].facultad = maestro.facultad;
                maestros[i].carreras = maestro.carreras;
                maestros[i].materias = maestro.materias;
                break;
            }
        }
    
    }
    func guardarMaestro(maestro:Maestro){
        self.maestros.append(maestro);
    }

    
}
