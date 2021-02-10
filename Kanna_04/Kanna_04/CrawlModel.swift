//
//  CrawlModel.swift
//  Kanna_04
//
//  Created by Derrick on 2021/02/10.
//  주는 클래스 *****

import Foundation
import Kanna

protocol CrawlModelProtocol: class {
    func itemDownLoaded(items: NSArray, itemsAddress: NSArray)
}

// NSObject가 가장 큰 클래스 - 1
class CrawlModel: NSObject {
    // Protocol 연결
    var delegate: CrawlModelProtocol!
    
    // Method
    func dataCrawling(year: String){
        let mainURL = "https://www.rottentomatoes.com/top/bestofrt/?year=\(year)"
        // NSArray는 한번 셋팅하면 못바꾸는 Array
        // NSMutableArray 바꿀수 있는 Array
        let locations = NSMutableArray()
        
        // 주소값 날리는 변수
        let locationsAddress = NSMutableArray()
        
        
        guard let main = URL(string: mainURL) else{
            print("Error \(mainURL) doesn't seem to be a valid URL")
            return
        }
        
        do {
            let htmlData = try String(contentsOf: main, encoding: .utf8)
            let doc = try HTML(html: htmlData, encoding: .utf8)
             
            // XPath <- 개발자 도구에서 가져온것.
            ////*[@id="top_movies_main"]/div/table/tbody/tr[1]/td[3]/a
            // count 는 그냥 콘솔을 위해서
            var count = 0
            
            /// for 문
            // XPath 경로 찾는것은 Python에서 찾아서 쓰는게 쉽다. (확인후 사용)
            for title in doc.xpath("//*[@id='top_movies_main']/div/table/tr/td/a") {
                count += 1
                
                // title 눌렀을때 내용 보기 위해서
                let tempAddress = "https://www.rottentomatoes.com\(String(describing: title["href"]!))"
                
                
                // Working - Kanna_04
                // Rank 만드는것
                // 숫자 정렬
                let countStr = String(format: "%3d", count)
                
                let tempStr = "\(countStr) :\(String(title.text!.trimmingCharacters(in: .whitespacesAndNewlines)))"
                
                // Locations
                locations.add(tempStr)
                
                // Address
                locationsAddress.add(tempAddress)
                
            } ///for 문
            
            
        } catch let error {
            print("Error \(error)")
        }
        
        // Asynk Task
        // 년도 바뀌었을때 새로 구성 되야 하니까.
        // closer 함수 만든것.
        DispatchQueue.main.async(execute: {() -> Void in
            // protocol에 연결되있는 함수
            self.delegate.itemDownLoaded(items: locations, itemsAddress: locationsAddress)
        })
        
    }
    
}
