//
//  EditTableViewController.swift
//  MealMe
//
//  Created by Kai McNeal on 3/18/22.
//

import UIKit

class EditTableViewController: UITableViewController {
    
    
    var recipe: Recipe?

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var categorySegment: UISegmentedControl!
    @IBOutlet weak var ingredients: UITextView!
    @IBOutlet weak var instructions: UITextView!
    @IBOutlet weak var favoriteSwitch: UISwitch!
    
    var categoryMap: [String: Int] = [
        "breakfast": 0,
        "lunch": 1,
        "dinner": 2,
        "dessert": 3
    ]
    
    let segmentsIdxCategory: [Int:Recipe.Category] = [
        0: Recipe.Category.breakfast,
        1: Recipe.Category.lunch,
        2: Recipe.Category.dinner,
        3: Recipe.Category.dessert
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleField.text = recipe?.name
        self.categorySegment.selectedSegmentIndex = categoryMap[recipe?.category.rawValue ?? "lunch"] ?? 1
        self.ingredients.text = recipe?.ingredients
        self.instructions.text = recipe?.steps
        self.favoriteSwitch.isOn = recipe?.isFavorite == true
    }
    
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        titleField.resignFirstResponder()
        ingredients.resignFirstResponder()
        instructions.resignFirstResponder()
    }
    
    
    @IBAction func doneEditing(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func deleteButtonPressed(_ sender: UIButton) {
        let confirmation = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let continueAction = UIAlertAction(title: "Delete Recipe", style: .destructive) { _ in
            for i in 0..<data.count {
                if data[i] === self.recipe {
                    data.remove(at: i)
                    break
                }
            }
            self.navigationController?.popToRootViewController(animated: true)
           }
        confirmation.addAction(cancelAction)
        confirmation.addAction(continueAction)
        self.present(confirmation, animated: true, completion: nil)
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        if let currRecipe = recipe, let currTitle = titleField.text {
            if currTitle == "" {
                alertInvalidTitle()
            } else {
                currRecipe.name = currTitle
                currRecipe.category = segmentsIdxCategory[categorySegment.selectedSegmentIndex]!
                currRecipe.ingredients = ingredients.text
                currRecipe.steps = instructions.text
                currRecipe.isFavorite = favoriteSwitch.isOn
                navigationController?.popViewController(animated: true)
            }
        }
    }
    
    func alertInvalidTitle() {
        let title = "Invalid Input"
        let message = "A recipe must have a title. Please enter a title for your recipe."
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alertController.addAction(okayAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
