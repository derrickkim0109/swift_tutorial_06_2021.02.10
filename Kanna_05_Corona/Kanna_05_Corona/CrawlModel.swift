//
//  CrawlModel.swift
//  Kanna_05_Corona
//
//  Created by Derrick on 2021/02/10.
//

import Foundation
import Kanna

protocol CrawlModelProtocol: class {
    func allNumberDownLoaded(totalNumber: NSArray)
}

// NSObject가 가장 큰 클래스 - 1
class CrawlModel: NSObject {
    // Protocol 연결
    var delegate: CrawlModelProtocol!
    
    // Method
    func dataCrawling(year: String){
        let mainURL = "http://ncov.mohw.go.kr/"
        // NSArray는 한번 셋팅하면 못바꾸는 Array
        // NSMutableArray 바꿀수 있는 Array
        let totalNum = NSMutableArray()

        
        guard let main = URL(string: mainURL) else{
            print("Error \(mainURL) doesn't seem to be a valid URL")
            return
        }
        
        do {
            let htmlData = try String(contentsOf: main, encoding: .utf8)
            let doc = try HTML(html: htmlData, encoding: .utf8)
             
            // XPath <- 개발자 도구에서 가져온것.
            // //*[@id="main_maplayout"]/button[9]/span[2]
            // count 는 그냥 콘솔을 위해서
            var count = 0
            
            /// for 문//*[@id="main_maplayout"]/button[1]/span[2]
            /// //*[@id="main_maplayout"]/button[9]/span[2]
            /// //*[@id="main_maplayout"]/button[10]/span[2]
            ////*[@id="main_maplayout"]/button[8]/span[2]
            // XPath 경로 찾는것은 Python에서 찾아서 쓰는게 쉽다. (확인후 사용)
            for allNumber in doc.xpath("//*[@id='main_maplayout']/button/span[2]") {
                count += 1
                
                print(count, ":", allNumber.text!.trimmingCharacters(in: .whitespacesAndNewlines))

                // Working - Kanna_04
                
                let tempStr = "\(String(allNumber.text!.trimmingCharacters(in: .whitespacesAndNewlines)))"
                
                // Locations
                totalNum.add(tempStr)
                
            } ///for 문
            
            
        } catch let error {
            print("Error \(error)")
        }
        
        // Asynk Task
        // 년도 바뀌었을때 새로 구성 되야 하니까.
        // closer 함수 만든것.
        DispatchQueue.main.async(execute: {() -> Void in
            // protocol에 연결되있는 함수
            self.delegate.allNumberDownLoaded(totalNumber: totalNum)
        })
        
    }
    
}
