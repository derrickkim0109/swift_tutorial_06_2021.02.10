//
//  DetailViewController.swift
//  Quiz17_TableControl_Image
//
//  Created by Derrick on 2021/02/10.
//

import UIKit

class DetailViewController: UIViewController {

    
    //---------------
    // Fields
    //---------------
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var lblIItem: UILabel!
    
    var receiveItem = ""
    var receiveImage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblIItem.text = receiveItem
        imageView.image = UIImage(named: receiveImage)
        // Do any additional setup after loading the view.
    }
    
    // 21.02.10
    // Prepare 에서 아이템들을 구동 시킬수 있다. --> TableView에 있음
    func receiveItems(_ item: String, _ itemsImageFile: String){
        receiveItem = item
        receiveImage = itemsImageFile
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
