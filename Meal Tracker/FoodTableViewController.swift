//
//  FoodTableViewController.swift
//  Meal Tracker
//
//  Created by Olibo moni on 03/12/2021.
//

import UIKit

class FoodTableViewController: UITableViewController {
    
    var meals: [Meal] {
      [
          Meal(name: "breakfast", food: [Food(name: "milo", description: "nice milo"),
                                        Food(name: "bread", description: "Sliced bread"),
                                        Food(name: "Beans", description: "Baked beans"),
                                         Food(name: "Beans", description: "Baked beans")
                                         ]),
            
          Meal(name: "lunch", food: [Food(name: "Rice", description: "rice and stew"),
                                    Food(name: "Fufu", description: "Fufu and soup"),
                                    Food(name: "Banku", description: "banku and soup"),
                                     Food(name: "Beans", description: "Baked beans")
                                     ]),
            
          Meal(name: "dinner", food: [Food(name: "Fruit1", description: "Orange"),
                                     Food(name: "Fruit2", description: "Banana"),
                                     Food(name: "Fruit3", description: "watermelon")])
        ]
       
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return meals.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
//        for meal in 0..<meals.count{
//            for food in 0..<1 {
//              let int = meals[section].food.count
//        }
//    }
        return meals[section].food.count
}
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Food", for: indexPath)
        let meals = meals[indexPath.section].food
        let meal = meals[indexPath.row]
        cell.textLabel?.text = meal.name
        cell.detailTextLabel?.text = meal.description
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return meals[section].name
    }
    
    @IBSegueAction func segueToFavorite(_ coder: NSCoder, sender: Any?) -> FavoriteFoodViewController? {
        let foodToEdit : Food?
        if let cell = sender as? UITableViewCell,
           let indexPath = tableView.indexPath(for: cell){
            foodToEdit = meals[indexPath.section].food[indexPath.row]
        } else {
            foodToEdit = nil
        
    }
        return FavoriteFoodViewController(coder: coder, food: foodToEdit)
    }
    
    
}
