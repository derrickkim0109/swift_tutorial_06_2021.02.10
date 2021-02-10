//
//  ViewController.swift
//  Kanna_02
//
//  Created by Derrick on 2021/02/10.
//

import UIKit
import Kanna

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        dataCrawling()
    }
    func dataCrawling(){
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath: filePath!)
        
        // do 안에는 try 여러개 쓸수 있다.
        do {
            let htmlData = try String(contentsOf: myUrl, encoding: .utf8)
            let doc = try HTML(html: htmlData, encoding: .utf8)
            
            print(doc.text!)
            print("-----------------------")
            for h1 in doc.xpath("//h1") {
                print(h1.text!)
            }
            print("-----------------------")
            for p in doc.xpath("//p") {
                print(p.text!)
            }
            print("-----------------------")
            for a in doc.xpath("//a") {
                print(a.text!)
            }
            
        } catch let error {
            print("Error : \(error)")
        }
        
    }

}

