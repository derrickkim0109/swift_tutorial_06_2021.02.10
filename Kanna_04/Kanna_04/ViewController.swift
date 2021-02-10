//
//  ViewController.swift
//  Kanna_04
//
//  Created by Derrick on 2021/02/10.
//

import UIKit
import WebKit
class ViewController: UIViewController, WKNavigationDelegate {

    //---------------
    // Fields
    //---------------
    
    @IBOutlet weak var myWebView: WKWebView!
    
    @IBOutlet weak var myWebViewIndicator: UIActivityIndicatorView!
    
    // 넘겨 받을 값
    var receiveItem:String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // First
        myWebView.navigationDelegate = self
        loadWebPage(url: receiveItem)
    }
    
    // Load
    // 읽어오기
    func loadWebPage(url: String){
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        myWebView.load(myRequest)
    }
    // commit은 시작이다.
    // Indicator 시작
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myWebViewIndicator.startAnimating()
        myWebViewIndicator.isHidden = false
    }
    // Indicator 종료
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myWebViewIndicator.stopAnimating()
        myWebViewIndicator.isHidden = true
    }
    
    // Error 발생
    // 사이트 연결 안되거나 , 없어졌을경우
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        myWebViewIndicator.stopAnimating()
        myWebViewIndicator.isHidden = true
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
