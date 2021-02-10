//
//  AddViewController.swift
//  Table
//
//  Created by Derrick on 2021/02/09.
//

import UIKit

class AddViewController: UIViewController {

    //------------
    // Fields
    //------------
    
    @IBOutlet weak var txtAddItem: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //------------
    // Actions
    //------------
    
    @IBAction func btnAddItem(_ sender: UIButton) {
        // Table View에 있는 items Array
        // items에 text field의 text 값을 추가
        items.append(txtAddItem.text!)
        itemsImageFile.append("clock.png")
        txtAddItem.text = ""
        navigationController?.popViewController(animated: true)
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
