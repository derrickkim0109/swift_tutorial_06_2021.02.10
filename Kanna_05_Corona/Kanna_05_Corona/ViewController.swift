//
//  ViewController.swift
//  Kanna_05_Corona
//
//  Created by Derrick on 2021/02/10.
//

import UIKit
import Kanna

class ViewController: UIViewController {


    

    //-------------
    // Fields
    //-------------
    
    // Seoul
    @IBOutlet weak var lblSeoul: UILabel!
    
    @IBOutlet weak var lblBusan: UILabel!
    @IBOutlet weak var lblDagu: UILabel!
    
    @IBOutlet weak var lblIncheon: UILabel!
    
    
    @IBOutlet weak var lblGyungju: UILabel!
    
    @IBOutlet weak var lblDajeon: UILabel!
    
    @IBOutlet weak var lblYulsan: UILabel!
    
    @IBOutlet weak var lblseajong: UILabel!
    
    @IBOutlet weak var lblGyunggi: UILabel!
    
    @IBOutlet weak var lblGangwon: UILabel!
    
    @IBOutlet weak var lblChongbook: UILabel!
    
    @IBOutlet weak var lblChongnam: UILabel!
    
    @IBOutlet weak var lblJeonbook: UILabel!
    
    @IBOutlet weak var lblJeonnam: UILabel!
    
    @IBOutlet weak var lblGyungbook: UILabel!
    
    @IBOutlet weak var lblGyungnam: UILabel!
    
    @IBOutlet weak var lblGyeg: UILabel!
    
    
    
    
    var allnumber: NSMutableArray = NSMutableArray()
    var caseNumber = NSMutableArray()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Class 연결
       
        dataCrawling()
        lblSeoul.text = "서울 \n \(allnumber[17])\n \(caseNumber[0]) "
        lblBusan.text = "부산 \n \(allnumber[18])\n \(caseNumber[1]) "
        lblDagu.text = "대구 \n \(allnumber[19])\n \(caseNumber[2]) "
        lblIncheon.text = "인천 \n \(allnumber[20])\n \(caseNumber[3]) "
        lblGyungju.text = "광주 \n \(allnumber[21])\n \(caseNumber[4]) "
        lblDajeon.text = "대전 \n \(allnumber[22])\n \(caseNumber[5]) "
        lblYulsan.text = "울산 \n \(allnumber[23])\n \(caseNumber[6]) "
        lblseajong.text = "세종 \n \(allnumber[24])\n \(caseNumber[7]) "
        lblGyunggi.text = "경기 \n \(allnumber[25])\n \(caseNumber[8]) "
        lblGangwon.text = "강원 \n \(allnumber[26])\n \(caseNumber[9]) "
        lblChongbook.text = "충북 \n \(allnumber[27])\n \(caseNumber[10]) "
        lblChongnam.text = "충남 \n \(allnumber[28])\n \(caseNumber[11]) "
        lblJeonbook.text = "전북 \n \(allnumber[29])\n \(caseNumber[12]) "
        lblJeonnam.text = "전남 \n \(allnumber[30])\n \(caseNumber[13]) "
        lblGyungbook.text = "경북 \n \(allnumber[31])\n \(caseNumber[14]) "
        lblGyungnam.text = "경남 \n \(allnumber[32])\n \(caseNumber[15]) "
        lblGyeg.text = "검역 \n \(allnumber[33])\n \(caseNumber[16]) "
    }
    
//    func allNumberDownLoaded(totalNumber: NSArray) {
//        allnumber = totalNumber
//    }
//
    func dataCrawling(){
        let mainURL = "http://ncov.mohw.go.kr/"
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
            for caseAll in doc.xpath("//*[@id='main_maplayout']/button/span[2]") {
                print("\(String(caseAll.text!.trimmingCharacters(in: .whitespacesAndNewlines)))")
                count += 1
                let tempStr = "\(String(caseAll.text!.trimmingCharacters(in: .whitespacesAndNewlines)))"
                
                // Locations
                allnumber.add(tempStr)
                
            }
            
            for caseAdd in doc.xpath("//*[@id='main_maplayout']/button/span[3]") {
                
                print(count, ":", caseAdd.text!.trimmingCharacters(in: .whitespacesAndNewlines))
                count += 1
                let tempStr = "\(String(caseAdd.text!.trimmingCharacters(in: .whitespacesAndNewlines)))"
                
                // Locations
                caseNumber.add(tempStr)
                
            }
            
        } catch let error {
            print("Error \(error)")
        }
    }

}

