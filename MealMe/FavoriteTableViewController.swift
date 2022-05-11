//
//  FavoriteTableViewController.swift
//  MealMe
//
//  Created by Kai McNeal on 3/17/22.
//

import UIKit

class FavoriteTableViewController: UITableViewController {
    
    var favorites = [Recipe]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.favorites = getFavoriteRecipes()
        if self.favorites.isEmpty {
            setBackgroundForNoRecipes()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.favorites = getFavoriteRecipes()
        self.tableView.reloadData()
        if self.favorites.isEmpty {
            setBackgroundForNoRecipes()
        }
    }
    
    
    func getFavoriteRecipes() -> [Recipe] {
        var favorites = [Recipe]()
        for recipe in data {
            if recipe.isFavorite {
                favorites.append(recipe)
            }
        }
        return favorites
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

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return favorites.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FAVORITE_RECIPES_CELL", for: indexPath)
        cell.textLabel?.text = favorites[indexPath.row].name
        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            (segue.destination as? DetailTableViewController)?.recipe = favorites[indexPath.row]
        }
    }
    

}
