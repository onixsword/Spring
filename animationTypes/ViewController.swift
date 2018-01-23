//
//  ViewController.swift
//  animationTypes
//
//  Created by Maestro on 22/01/18.
//  Copyright © 2018 alumno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //outlets
    @IBOutlet weak var vw_CuadroVerde: UIView!
    @IBOutlet weak var vw_CuaroAmarilloRojo: UIView!
    @IBOutlet weak var vw_Space: UIView!
    
    //Transformaciones
    var verdeSpace: CGPoint?
    var amarilloRojoSpace: CGPoint?
    var spaceSpace: CGPoint?
    var verdeTransf: CGSize?
    var amarilloRojoTransf: CGSize?
    var spaceTransf: CGSize?
    
    //booleans
    var esVerde: Int32 = 0
    var puedeAnimarVerde: Bool = true
    var puedeAnimarAmarilloRojo: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //espacios
        verdeSpace = CGPoint(x: self.vw_CuadroVerde.center.x, y: self.vw_CuaroAmarilloRojo.center.y)
        amarilloRojoSpace = CGPoint(x: self.vw_CuaroAmarilloRojo.center.x, y: self.vw_CuaroAmarilloRojo.center.y)
        spaceSpace = CGPoint(x: self.vw_Space.center.x, y: self.vw_Space.center.y)
        
        //rectangulos - tamanos
        verdeTransf = CGSize(width: self.vw_CuadroVerde.bounds.width, height: self.vw_CuadroVerde.bounds.height)
        amarilloRojoTransf = CGSize(width: self.vw_CuaroAmarilloRojo.bounds.width, height: self.vw_CuaroAmarilloRojo.bounds.height)
        spaceTransf = CGSize(width: self.vw_Space.bounds.width, height: self.vw_Space.bounds.height)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }

    @IBAction func btn_verde(_ sender: Any) {
        if(puedeAnimarVerde && puedeAnimarAmarilloRojo){
            puedeAnimarVerde = false
            UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.5,    initialSpringVelocity: 0.5, options: [], animations: {
                self.vw_CuadroVerde.center = self.spaceSpace!
            }, completion: {_ in
                UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.5,    initialSpringVelocity: 0.5, options: [], animations: {
                    self.vw_CuadroVerde.bounds.size = self.spaceTransf!
                }, completion: {_ in
                    self.puedeAnimarVerde = true
                })
            })
            if(esVerde == 2){
                UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.5,    initialSpringVelocity: 0.5, options: [], animations: {
                    self.vw_CuaroAmarilloRojo.center = self.amarilloRojoSpace!
                    self.vw_CuaroAmarilloRojo.bounds.size = self.amarilloRojoTransf!
                }, completion: nil)
            }
            esVerde = 1
        }
    }
    
    
    @IBAction func btn_amarilloRojo(_ sender: Any) {
        if(puedeAnimarVerde && puedeAnimarAmarilloRojo){
            puedeAnimarAmarilloRojo = false
            UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.5,    initialSpringVelocity: 0.5, options: [], animations: {
                self.vw_CuaroAmarilloRojo.center = self.spaceSpace!
            }, completion: {_ in
                UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.5,    initialSpringVelocity: 0.5, options: [], animations: {
                    self.vw_CuaroAmarilloRojo.bounds.size = self.spaceTransf!
                }, completion: {_ in
                    self.puedeAnimarAmarilloRojo = true
                })
            })
            if(esVerde == 1){
                UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.5,    initialSpringVelocity: 0.5, options: [], animations: {
                    self.vw_CuadroVerde.center = self.verdeSpace!
                    self.vw_CuadroVerde.bounds.size = self.verdeTransf!
                }, completion: nil)
            }
            esVerde = 2
        }
    }
}

