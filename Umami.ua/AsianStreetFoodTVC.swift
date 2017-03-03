//
//  AsianStreetFoodTVC.swift
//  Umami.ua
//
//  Created by October Hammer on 2/28/17.
//  Copyright © 2017 Ocotober Hammer. All rights reserved.
//

import UIKit


protocol TableItem {}

class NewsItem: NSObject, TableItem {
	var actual: Bool?
	var text: String?
	init(text: String, actual: Bool) {
		super.init()
		self.text = text
		self.actual = actual
	}
}

class NewsArray: TableItem {
	var newsArray: [TableItem]?
	init(witArrayOfNews: [TableItem]){
		self.newsArray = witArrayOfNews
	}
}


class Meal: NSObject, TableItem {
	var name: String?
	var price: Int?
	var weight: Int?
	var imageName: String?
	init(name: String, price: Int, weight: Int, imageName: String) {
		super.init()
		self.name = name
		self.price = price
		self.weight = weight
		self.imageName = imageName
	}
}

enum TypeOfCell {
	case newsCell(row: Int, tableItem: TableItem)
}

class AsianStreetFoodTVC: UITableViewController {
	//MARK: Model
	var news = NewsArray(witArrayOfNews: [NewsItem(text: "First News", actual: true),
	                      NewsItem(text: "Second News", actual: true)])
	

	var itemsForTabel: [TableItem] = [Meal(name: "КУРКА З ОВОЧАМИ В ІНДОНЕЗІЙСЬКОМУ СТИЛІ", price: 70, weight: 400, imageName: "chicken"),
	                                  Meal(name: "САЛАТ ЧУКА З ГОРІХОВИМ СОУСОМ", price: 70, weight: 400, imageName: "chuka"),
	                                  Meal(name: "СУП ЛАКСА З КРЕВЕТКАМИ", price: 70, weight: 400, imageName: "laksa"),
	                                  Meal(name: "FANTA 0.33", price: 70, weight: 400, imageName: "fanta"),
	                                  Meal(name: "МІСО СУП З ТОФУ", price: 70, weight: 400, imageName: "miso"),
	                                  Meal(name: "ЛОКШИНА З КУРКОЮ", price: 70, weight: 400, imageName: "noddle_chicken"),
	                                  Meal(name: "ЛОКШИНА З КРЕВЕТКАМИ", price: 70, weight: 400, imageName: "noddle_shrimps"),
	                                  Meal(name: "СУП ФО БО", price: 70, weight: 400, imageName: "soup"),
	                                  Meal(name: "КРЕВЕТКИ З ОВОЧАМИ В ІНДОНЕЗІЙСЬКОМУ СТИЛІ", price: 70, weight: 400, imageName: "shrimps")]
	//
    override func viewDidLoad() {
        super.viewDidLoad()
		let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 38, height: 38))
		imageView.contentMode = .scaleAspectFit
		let image = UIImage(named: "logo")
		imageView.image = image
		navigationItem.titleView = imageView
		self.tableView.register(UINib(nibName: "MealViewCell", bundle: nil), forCellReuseIdentifier: "MealViewCell")
		self.tableView.register(UINib(nibName: "NewsViewCell", bundle: nil), forCellReuseIdentifier: "NewsViewCell")
		self.tableView.rowHeight = self.view.frame.size.height / 3
		
		self.itemsForTabel.insert(self.news, at: 1)
		// Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return itemsForTabel.count
    }

	
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let _ = self.itemsForTabel[indexPath.row] as? NewsArray {
			let cell = tableView.dequeueReusableCell(withIdentifier: "NewsViewCell", for: indexPath) as! NewsViewCell
			return cell
		}
		else {
			let cell = tableView.dequeueReusableCell(withIdentifier: "MealViewCell", for: indexPath) as! MealViewCell
			if let item = self.itemsForTabel[indexPath.row] as? Meal {
				cell.labelName.text = item.name!
				cell.labelPriceWeight.text = "\(item.price!) ₴ / \(item.weight!)г."
				cell.mealImage.image = UIImage(named: item.imageName!)
			}
        // Configure the cell...
			return cell
		}
    }
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		let some = self.itemsForTabel[indexPath.row]
		switch some {
		case ( _ as NewsArray): return 120.0
		default: return 200.0
		}

//		let typeOfItem = TypeOfCell.newsCell(row: indexPath.row, tableItem: (self.itemsForTabel[indexPath.row]))
//		switch typeOfItem  {
//		case .newsCell(row: indexPath.row, tableItem: (self.itemsForTabel[indexPath.row])) where indexPath.row == 0: return 120.0
//		default: return 200.0
//		}
		
		if let _ = self.itemsForTabel[indexPath.row] as? NewsArray {
			return 120.0
		} else {
			return 200.0
		}
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
