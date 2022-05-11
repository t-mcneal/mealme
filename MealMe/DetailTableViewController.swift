//
//  DetailTableViewController.swift
//  MealMe
//
//  Created by Kai McNeal on 3/18/22.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categorySegment: UISegmentedControl!
    @IBOutlet weak var ingredients: UILabel!
    @IBOutlet weak var instructions: UILabel!
    @IBOutlet weak var favoriteSwitch: UISwitch!
    
    var recipe: Recipe?
    
    var categoryMap: [String: Int] = [
        "breakfast": 0,
        "lunch": 1,
        "dinner": 2,
        "dessert": 3
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titleLabel.text = recipe?.name
        self.categorySegment.selectedSegmentIndex = categoryMap[recipe?.category.rawValue ?? "lunch"] ?? 1
        self.ingredients.text = recipe?.ingredients
        self.instructions.text = recipe?.steps
        self.favoriteSwitch.isOn = recipe?.isFavorite == true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.titleLabel.text = recipe?.name
        self.categorySegment.selectedSegmentIndex = categoryMap[recipe?.category.rawValue ?? "lunch"] ?? 1
        self.ingredients.text = recipe?.ingredients
        self.instructions.text = recipe?.steps
        self.favoriteSwitch.isOn = recipe?.isFavorite == true
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 3 || indexPath.row == 5 {
            return UITableView.automaticDimension
        } else {
            return CGFloat(super.tableView(tableView, heightForRowAt: indexPath))
        }
    }

    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 3 || indexPath.row == 5 {
            return UITableView.automaticDimension
        } else {
            return CGFloat(super.tableView(tableView, heightForRowAt: indexPath))
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        (segue.destination as? EditTableViewController)?.recipe = recipe
    }
    

}
