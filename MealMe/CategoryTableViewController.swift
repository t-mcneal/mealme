//
//  CategoryTableViewController.swift
//  MealMe
//
//  Created by Kai McNeal on 3/17/22.
//

import UIKit

class CategoryTableViewController: UITableViewController {
    
    var categoryRecipes = [Recipe]()
    
    var categoryTitle: String?
    
    let emptyMessageLabel: UILabel = UILabel()

    @IBOutlet weak var nav: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nav.title = "Your \(categoryTitle ?? "") Recipes"

        self.categoryRecipes = getCategoryRecipes(categoryTitle?.lowercased() ?? "")
        
        if self.categoryRecipes.isEmpty {
            setBackgroundForNoRecipes()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.categoryRecipes = getCategoryRecipes(categoryTitle?.lowercased() ?? "")
        tableView.reloadData()
        if self.categoryRecipes.isEmpty {
            setBackgroundForNoRecipes()
        }
    }
    
    func setBackgroundForNoRecipes() {
        let altView = UIView()
        let altLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
        altLabel.center = view.center
        altLabel.text = "No Recipes"
        altLabel.textColor = .lightGray
        altLabel.font = UIFont.systemFont(ofSize: 18)
        altView.addSubview(altLabel)
        self.tableView.backgroundView = altView
    }
    
    @IBAction func switchToCategoryVC(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    func getCategoryRecipes(_ category: String) -> [Recipe] {
        if category == "" {
            return [Recipe]()
        }
        
        var recipes = [Recipe]()
        for recipe in data {
            if recipe.category.rawValue == category {
                recipes.append(recipe)
            }
        }
        return recipes
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categoryRecipes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CATEGORY_RECIPES_CELL", for: indexPath)
        cell.textLabel?.text = categoryRecipes[indexPath.row].name
        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let indexPath = tableView.indexPathForSelectedRow {
            (segue.destination as? DetailTableViewController)?.recipe = categoryRecipes[indexPath.row]
        }
    }
    

}
