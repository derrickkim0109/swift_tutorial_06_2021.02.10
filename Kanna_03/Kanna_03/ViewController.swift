//
//  ViewController.swift
//  Kanna_03
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
        let mainURL = "https://www.rottentomatoes.com/top/bestofrt/?year=2019"
        guard let main = URL(string: mainURL) else{
            print("Error \(mainURL) doesn't seem to be a valid URL")
            return
        }
        
        do {
            let htmlData = try String(contentsOf: main, encoding: .utf8)
            let doc = try HTML(html: htmlData, encoding: .utf8)
             
            // XPath <- 개발자 도구에서 가져온것.
            ////*[@id="top_movies_main"]/div/table/tbody/tr[1]/td[3]/a
            var count = 1
            
            // XPath 경로 찾는것은 Python에서 찾아서 쓰는게 쉽다. (확인후 사용)
            for title in doc.xpath("//*[@id='top_movies_main']/div/table/tr/td/a") {
                print(count, ":", title.text!.trimmingCharacters(in: .whitespacesAndNewlines))
                count += 1
            }
            
            
        } catch let error {
            print("Error \(error)")
        }
    }

}

