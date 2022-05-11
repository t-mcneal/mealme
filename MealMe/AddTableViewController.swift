//
//  AddTableViewController.swift
//  MealMe
//
//  Created by Kai McNeal on 3/18/22.
//

import UIKit

class AddTableViewController: UITableViewController {
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var categorySegment: UISegmentedControl!
    @IBOutlet weak var ingredients: UITextView!
    @IBOutlet weak var instructions: UITextView!
    @IBOutlet weak var favoriteSwitch: UISwitch!
    
    let segmentsIdxCategory: [Int:Recipe.Category] = [
        0: Recipe.Category.breakfast,
        1: Recipe.Category.lunch,
        2: Recipe.Category.dinner,
        3: Recipe.Category.dessert
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        titleField.resignFirstResponder()
        ingredients.resignFirstResponder()
        instructions.resignFirstResponder()
    }
    
    @IBAction func doneEditing(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        if let recipeTitle = titleField.text {
            if recipeTitle == "" {
                alertInvalidTitle()
            } else {
                let newRecipe = Recipe(name: recipeTitle, category: segmentsIdxCategory[categorySegment.selectedSegmentIndex]!, ingredients: ingredients.text, steps: instructions.text, isFavorite: favoriteSwitch.isOn)
                data.append(newRecipe)
                navigationController?.popToRootViewController(animated: true)
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
