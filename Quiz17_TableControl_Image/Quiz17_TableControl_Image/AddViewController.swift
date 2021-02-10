//
//  AddViewController.swift
//  Quiz17_TableControl_Image
//
//  Created by Derrick on 2021/02/10.
//

import UIKit

class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    

    
    //---------------
    // Fields
    //---------------
    
    // Image
    @IBOutlet weak var imageView: UIImageView!
    
    // Picker View
    @IBOutlet weak var pickerImage: UIPickerView!
    // Text Field
    @IBOutlet weak var txtField: UITextField!
    
    // Picker View 범위 구하기
    // 전체 이미지 개수
    let MAX_ARRAY_NUM = 3
    // PickerView의 컬럼 개수
    let PICKER_VIEW_COLUMN = 1
    // 그림들 넣을 Array
    var imageArray = [UIImage?]()
    
    // Image File Array
    var imageFileName = ["cart.png","clock.png","pencil.png"]
    var imgName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // image 준비 : image를 배열로 생성한다.
        for i in 0..<MAX_ARRAY_NUM{
            
            // File 이름들 읽어 오기 위한 변수
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        // 이미지 집어 넣기 - 2
        imageView.image = imageArray[0]
        
    }
    
    @IBAction func btnAdd(_ sender: UIButton) {
        // Table View에 있는 items Array
        // items에 text field의 text 값을 추가
        items.append(txtField.text!)
        itemsImageFile.append(imgName)
        txtField.text = ""
        navigationController?.popViewController(animated: true)
    }
    
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }
    
    // PickerView에 이미지 집어 넣기
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: imageArray[row])
        imageView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        return imageView
    }
    
    // PickerView 움직이면 이미지 넣어줄곳
    // PickerView로 선택된 파일명을 레이블 및 Image View에 출력
    // 몇번 째를 선택 했구나? -> 그럼 그 배열row에 맞는 이미지 주면 된다.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        imageView.image = imageArray[row]
        imgName = imageFileName[row]
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
