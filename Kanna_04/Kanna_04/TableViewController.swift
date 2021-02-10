//
//  TableViewController.swift
//  Kanna_04
//
//  Created by Derrick on 2021/02/10.
//

import UIKit

class TableViewController: UITableViewController , CrawlModelProtocol{

    //-------------
    // Fields
    //-------------
    
    @IBOutlet var listView: UITableView!
    
    var feedItem: NSArray = NSArray()
    var year:String = ""
    
    // title -> contents
    var feedIItemAddress:NSArray = NSArray()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.listView.delegate = self
        self.listView.dataSource = self
        
        // Class 연결
        let crawlModel = CrawlModel()
        crawlModel.delegate = self
        year = "2019"
        // Table에 있는 Title 바꿔줄것
        self.title = "Rotten Tomatoes \(year)"
        crawlModel.dataCrawling(year: year)
    }
    
    // items을 feeditem으로 받을것이다
    func itemDownLoaded(items: NSArray, itemsAddress: NSArray) {
        feedItem = items
        // 재구성한다. (화면)
        
        // *** Title 눌렀을때 내용 추가 여기서 한다.
        feedIItemAddress = itemsAddress
        
        // 리스트 띄우기
        self.listView.reloadData()
    }
    
    
    @IBAction func btnYear(_ sender: UIBarButtonItem) {
        // Controller
        let alert = UIAlertController(title: "년도 입력", message: "순위를 보고 싶은 년도는?", preferredStyle: UIAlertController.Style.alert)
        
        // Cancel
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: nil)
        // OK
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {ACTION in
            // nil 값 들어올수 있으니까 if let
            if let year = alert.textFields?.first?.text{
                self.title = "Rotten Tomatoes : \(year)"
                // Crawling
                let crawlModel = CrawlModel()// Instance
                crawlModel.delegate = self
                crawlModel.dataCrawling(year: year)
            }
        })
        
        // 밑의 textField는  if let year = alert.textFields?.의 textField이다.
        alert.addTextField(configurationHandler: {textField in
            textField.placeholder = "년도 입력..."
        })
        //
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return feedItem.count
    }


    // Data 넣을곳.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        // Configure the cell...
        let item:String = feedItem[indexPath.row] as! String
        cell.textLabel?.text = "\(item)"
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // Click 했을때 Navigation 바뀌어야 한다.!!!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        let indexPath = self.listView.indexPath(for: cell)
        let detailView = segue.destination as! ViewController
        detailView.receiveItem = feedIItemAddress[(indexPath! as NSIndexPath).row] as! String
        
        
    }
    

}
