//
//  ViewController.swift
//  Kanna_01
//
//  Created by Derrick on 2021/02/10.
//

import UIKit
import Kanna

class ViewController: UIViewController {

    // 실행할 HTML
    let html = """
                    <html>
                        <body>
                            <h1>My First Heading</h1>
                            <p>과일 상점 과일 종류</p>
                            <a class='mylink' id='applelink' href='http://www.apple.com'>Apple</a>
                            <ul>
                                <li>사과</li>
                                <li>바나나</li>
                                <li>복숭아</li>
                                <li>포도</li>
                            </ul>
                        </body>
                    </html>
                   """
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataCrawling()
    }
    
    func dataCrawling(){
        
        // try catch 문
        do {
            let doc = try HTML(html: html, encoding: .utf8)
            print(doc.text!)
            print("----------------------------------")
            // xpath 위치 가져오기 (<p></p>)
            for p in doc.xpath("//p") {
                print(p.text!)
            }
            // xpath 위치 가져오기 (<li></li>)
            for li in doc.xpath("//li") {
                print(li.text!)
            }
            
        } catch let error {
            print("Error: \(error)")
        }
    }
}

