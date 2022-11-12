//
//  ViewController.swift
//  Social
//
//  Created by Ángel González on 10/11/22.
//

import UIKit

//profile/671753206239581",
//"https://www.facebook.com/fundacion.unam.mx"
class ViewController: UIViewController {
    var redes = ["twitter://user?screen_name=Fundacion_UNAM",
                 "fb://profile?id=671753206239581",
                 "vnd.youtube://user/FUNDUNAM",
                 "instagram://user?username=fundacionUNAM"]
    // Código UNICODE para convertir a iconos usando FontAwesome "\u{f099}"
    override func viewDidLoad() {
        super.viewDidLoad()
        let bgcolor = UIColor.blue
        let D = 80
        var Y = D
        let X:Int = Int(self.view.center.x - 30)
        let titulo=UILabel(frame: CGRect(x:0 , y:Y, width:Int(self.view.frame.width), height: 40))
        titulo.textAlignment = .center
        titulo.font = UIFont(name: "TamilSangamMN-Bold", size: 28)
        titulo.text = "Visita nuestras redes sociales"
        self.view.addSubview(titulo)
        Y += D
        
        let btn1 = UIButton(frame: CGRect(x:X , y:Y, width:D, height:D))
        btn1.titleLabel?.font = UIFont(name: "FontAwesome6Brands-Regular", size: 32)
        btn1.setTitle("twitter", for: .normal)
        //btn1.setImage(UIImage(systemName: "camera.fill"), for:.normal)
        btn1.backgroundColor = bgcolor
        btn1.tag = 0
        self.view.addSubview(btn1)
        Y += D + 20
        let btn2 = UIButton(frame: CGRect(x:X, y:Y, width: D, height: D))
        btn2.titleLabel?.font = UIFont(name: "FontAwesome6Brands-Regular", size: 32)
        btn2.setTitle("facebook", for: .normal)
        btn2.backgroundColor = bgcolor
        btn2.tag = 1
        self.view.addSubview(btn2)
        Y += D + 20
        let btn3 = UIButton(frame: CGRect(x:X, y:Y, width: D, height: D))
        btn3.titleLabel?.font = UIFont(name: "FontAwesome6Brands-Regular", size: 32)
        btn3.setTitle("youtube", for: .normal)
        btn3.backgroundColor = bgcolor
        btn3.tag = 2
        self.view.addSubview(btn3)
        Y += D + 20
        let btn4 = UIButton(frame: CGRect(x:X, y:Y, width: D, height: D))
        btn4.titleLabel?.font = UIFont(name: "FontAwesome6Brands-Regular", size: 32)
        btn4.setTitle("instagram", for: .normal)
        btn4.backgroundColor = bgcolor
        btn4.tag = 3
        self.view.addSubview(btn4)
        Y += D + 20
        let btn5 = UIButton(frame: CGRect(x:X, y:Y, width: D, height: D))
        //btn5.titleLabel?.font = UIFont(name: "FontAwesome6Brands-Regular", size: 32)
        //btn5.setTitle("instagram", for: .normal)
        btn5.backgroundColor = bgcolor
        btn5.setBackgroundImage(UIImage(systemName: "phone.fill"), for: .normal)
        btn5.tag = 4
        self.view.addSubview(btn5)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        for unView in self.view.subviews {
            if unView is UIButton {
                print ("encontré un boton con el tag \(unView.tag)")
                let tempBtn = unView as! UIButton
                tempBtn.addTarget(self, action:#selector(btnTouch(_ :)), for: .touchUpInside)
                
            }
        }
    }

    @objc func btnTouch(_ elBoton:UIButton) {
        print ("tocó el boton \(elBoton.tag)")
        if elBoton.tag == 4 {
            /* //Para llamar por telefono:
            if UIApplication.shared.canOpenURL(URL(string:"tel:525553400900")!) {
                UIApplication.shared.open(URL(string:"tel:525553400900")!, options: [:])
            }
            // enviar un determinado mensaje, y te permite elegir a que contacto
            if UIApplication.shared.canOpenURL(URL(string:"whatsapp://send?text=Hello%2C%20World!")!) {
                UIApplication.shared.open(URL(string:"whatsapp://send?text=Hello%2C%20World!")!, options: [:])
            }*/
            // iniciar una conversación con un número que no tenga en mis contactos
            if UIApplication.shared.canOpenURL(URL(string:"https://wa.me/525553400902")!) {
                UIApplication.shared.open(URL(string:"https://wa.me/525553400902")!, options: [:])
            }
        }
        else {
            if let laURL = URL(string: redes[elBoton.tag]) {
                if UIApplication.shared.canOpenURL(laURL) {
                    UIApplication.shared.open(laURL, options: [:])
                }
            }
        }
    }
    
}

