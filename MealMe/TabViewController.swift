//
//  TabViewController.swift
//  MealMe
//
//  Created by Kai McNeal on 3/17/22.
//

import UIKit
import CoreHaptics


var data: [Recipe] = [
    Recipe(name: "Baked Chicken Parmesan", category: .dinner, ingredients: "", steps: "", isFavorite: true),
    Recipe(name: "Chicken and Rice", category: .lunch, ingredients: "", steps: "", isFavorite: false),
    Recipe(name: "Chicken and Waffles", category: .breakfast, ingredients: "", steps: "", isFavorite: false),
    Recipe(name: "Pepporoni Pizza", category: .lunch, ingredients: "", steps: "", isFavorite: true),
    Recipe(name: "Mac & Cheese", category: .dinner, ingredients: "", steps: "", isFavorite: false),
    Recipe(name: "Caesar Salad", category: .lunch, ingredients: "", steps: "", isFavorite: false),
    Recipe(name: "Tomato Rigatoni Pasta", category: .dinner, ingredients: "", steps: "", isFavorite: false),
    Recipe(name: "BLT Sandwhich", category: .lunch, ingredients: "", steps: "", isFavorite: false),
    Recipe(name: "Cheesy Omelette", category: .breakfast, ingredients: "", steps: "", isFavorite: false),
    Recipe(name: "Sweet Potato Fries", category: .lunch, ingredients: "", steps: "", isFavorite: false),
    Recipe(name: "French Toast", category: .breakfast, ingredients: "", steps: "", isFavorite: false),
    Recipe(name: "Blueberry Pancakes",  category: .breakfast, ingredients: "", steps: "", isFavorite: false),
    Recipe(name: "Chicken Alfredo Pasta", category: .dinner, ingredients: "", steps: "", isFavorite: true),
]


class TabViewController: UITabBarController {
    var ingredientDetails: [String] = [
        "4 chicken breasts, about 8 oz each, sliced in half\n\n3/4 cup seasoned breadcrumbs\n\n1/4 cup grated Parmesan cheese\n\n2 tbsp butter, melted (or olive oil)\n\n3/4 cup reduced fat mozzarella cheese\n\n1 cup marinara or Filetto di Pomodoro\n\ncooking spray",
        "1 can (10 1/2 ounces) Campbell’s® Condensed Cream of Mushroom Soup\n\n1 cup water (for creamier rice, increase the water to 1 1/3 cups)\n\n3/4 cup uncooked long grain white rice\n\n1 1/4 pounds boneless, skinless chicken breast (4 small or 2 large cut in half lengthwise for thinner pieces)\n\n1/4 teaspoon paprika",
        "CHICKEN:\n\n8 boneless, skin-on chicken thighs\n\n2 cups buttermilk\n\n2 1/2 cups all-purpose flour, plus more if needed\n\n1 tablespoon seasoned salt, such as Lawry's\n\n1 teaspoon paprika\n\n1 teaspoon freshly ground black pepper\n\n1 teaspoon ground dried thyme\n\n1/2 teaspoon cayenne pepper\n\n1/4 cup milk, plus more if needed\n\nVegetable oil, for frying\n\n\nWAFFLES:\n\n2 cups all-purpose flour\n\n1/4 cup sugar\n\n1 tablespoon baking powder\n\n1/2 teaspoon kosher salt\n\n1 1/2 cups milk\n\n1 tablespoon vanilla extract\n\n4 large egg whites plus 2 large egg yolks\n\n8 tablespoons (1 stick) salted butter, melted\n\n1 to 2 jalapenos, chopped",
        "16 ounces pizza dough\n\n1/2 cup pizza sauce (see below)\n\n18 to 20 slices pepperoni\n\n12 ounces mozzarella cheese, grated\n\n1/2 teaspoon ground black pepper\n\n1 teaspoon fresh oregano, optional\n\n1/4 cup softened butter",
        "8 ounces uncooked elbow macaroni\n\n1/4 cup butter\n\n2 1/2 tablespoons all-purpose flour\n\n3 cups milk\n\n2 cups shredded sharp Cheddar cheese\n\n1/2 cup grated Parmesan cheese\n\n2 tablespoons butter\n\n1/2 cup bread crumbs\n\n1 pinch paprika",
        "1 head romaine lettuce\n\n3/4 cup extra virgin olive oil\n\n3 tablespoons red wine vinegar\n\n1 teaspoon Worcestershire sauce\n\n1/2 teaspoon salt\n\n1/4 tablespoon ground mustard\n\n1 clove crushed garlic\n\n1 egg\n\n1 lemon, juiced\n\nfreshly ground black pepper\n\n1/4 cup grated Parmesan cheese\n\n1 1/2 cups garlic croutons\n\n1 (2 ounce) can anchovy filets",
        "1/4 cup unsalted butter\n\n1 cup chopped yellow onion\n\n1 (28-ounce) can whole peeled plum tomatoes, tomatoes crushed by hand and juices reserved\n\n12 ounces uncooked rigatoni pasta\n\n1/2 cup heavy cream\n\n1 teaspoon kosher salt\n\n1/4 teaspoon black pepper\n\n1/4 teaspoon crushed red pepper\n\n1/2 ounce Parmesan cheese, grated\n\nChopped fresh flat-leaf parsley, for garnish",
        "4 slices bacon\n\n2 leaves lettuce\n\n2 slices tomato\n\n2 slices bread, toasted\n\n1 tablespoon mayonnaise",
        "3 eggs\n\n1 tablespoon milk, or as needed\n\nsalt and freshly ground white pepper to taste\n\n2 tablespoons butter\n\n1/4 cup shredded Emmentaler cheese",
        "2 sweet potatoes, cut into french fries\n\n1/4 teaspoon cinnamon\n\n1/4 teaspoon ground cardamom\n\n1/4 teaspoon ground ginger\n\n1/4 teaspoon ground coriander\n\n2 tablespoons light brown sugar\n\nkosher salt and ground black pepper to taste\n\n3 tablespoons light olive oil",
        "3 eggs, beaten\n\n2 teaspoons white sugar\n\n1 teaspoon milk\n\n1 teaspoon ground cinnamon\n\n¼ teaspoon salt\n\n6 slices bread",
        "1 cup all-purpose flour\n\n1 teaspoon baking powder\n\n1/8 teaspoon ground nutmeg\n\n1/8 teaspoon ground cinnamon\n\n1 tablespoon white sugar\n\n1 egg\n1/2 cup plain yogurt\n\n1/2 cup milk\n\n2 tablespoons vegetable oil\n\n3/4 cup fresh blueberries",
        "1 (16 ounce) jar Alfredo-style pasta sauce\n\n1 (16 ounce) package angel hair pasta\n\n2 pounds fresh shrimp, peeled and deveined\n\n1 cup butter, melted\n\n1/2 small green bell pepper, diced\n\n1/2 small red onion, finely chopped\n\n1 teaspoon garlic powder\n\n1/2 teaspoon ground cumin"
    ]

    var stepsTemplate = "Step 1: . . .\n\nStep 2: . . .\n\nStep 3: . . .\n\nStep 4: . . .\n\nStep 5: . . .\n\nEnjoy the meal!"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0..<data.count {
            data[i].ingredients = i < ingredientDetails.count ? ingredientDetails[i] : ""
            data[i].steps = stepsTemplate
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}
