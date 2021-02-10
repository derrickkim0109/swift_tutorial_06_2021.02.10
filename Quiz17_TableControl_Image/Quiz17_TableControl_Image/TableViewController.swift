//
//  TableViewController.swift
//  Quiz17_TableControl_Image
//
//  Created by Derrick on 2021/02/10.
//

import UIKit

// 변수 선언을 class 정의 전에 하여야 한다.
// 화면 띄울 것들
var items = ["책 구매", "철수와 약속", "스터디 준비하기"]
var itemsImageFile = ["cart.png","clock.png","pencil.png"]

class TableViewController: UITableViewController {

    //---------------
    // Fields
    //---------------
    
    // List View
    @IBOutlet var tvListView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Ediit 버튼을 마들고 삭제 기능 추가하기, 왼쪽으로 배치
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    
    }

    // MARK: - Table view data source
    // 보통은 테이블 안에 Secssion이 1개 있다 (Secssion 이란?)
    // Secssion 은 그냥 한뭉치를 뜻하는 것이다.
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    // Cell의 구성 정의 _ myCell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        // Configure the cell...
        
        // indexPath 0, 1, 2... 인지 구분
        // 지금은 Label , Image 있으니까 그 두가지를 구성하는것.
        cell.textLabel?.text = items[(indexPath as NSIndexPath).row]
        cell.imageView?.image = UIImage(named: itemsImageFile[(indexPath as NSIndexPath).row])
        return cell
    }
    
    // Table View에 추가된 내용 불러들이기
    override func viewWillAppear(_ animated: Bool) {
        tvListView.reloadData()
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Delete
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            // 글지움
            items.remove(at: (indexPath as NSIndexPath).row)
            // 이미지 지움
            itemsImageFile.remove(at: (indexPath as NSIndexPath).row)
            // 테이블 한 row 지움
            tableView.deleteRows(at: [indexPath], with: .fade)
       
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    // Delete 글자를 삭제로 변경하기
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        // 이동할 item의 위치 - 1
        let itemToMove = items[(fromIndexPath as NSIndexPath).row]
        // 이동할 image의 위치 - 2
        let itemImageToMove = itemsImageFile[(fromIndexPath as NSIndexPath).row]
        // 이동할 item을 삭제 - 3
        items.remove(at: (fromIndexPath as NSIndexPath).row)
        // 이동할 image를 삭제 - 4
        itemsImageFile.remove(at: (fromIndexPath as NSIndexPath).row)
        // items 삽입 (1,2번)
        items.insert(itemToMove, at: (to as NSIndexPath).row)
        itemsImageFile.insert(itemImageToMove, at: (to as NSIndexPath).row)
        
    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
        // 쓸려면 저기 선언 해주고 와야함.
        if segue.identifier == "sgDetail" {
            // 이 cell 클릭한 row 의 값들을 가져옴
            let cell = sender as! UITableViewCell
            // 몇번 째를 눌럿냐?
            let indexPath = self.tvListView.indexPath(for: cell)
            let detailView = segue.destination as! DetailViewController
            // Label에 넣기 위한 글씨 날라가는 것이다.
            // detailView.receiveItem = items[(indexPath! as NSIndexPath).row]
            
            // 21.02.10 위의 버전에서 items로 바꿀거다
            detailView.receiveItems(items[(indexPath! as NSIndexPath).row], itemsImageFile[(indexPath! as NSIndexPath).row])
            
        }
        
        
    }
    
}
