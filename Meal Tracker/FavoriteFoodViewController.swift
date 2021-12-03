//
//  FavoriteFoodViewController.swift
//  Meal Tracker
//
//  Created by Olibo moni on 03/12/2021.
//

import UIKit

class FavoriteFoodViewController: UIViewController {
    @IBOutlet weak var mealNameTextField: UITextField!
    @IBOutlet weak var foodNameTextField: UITextField!
    @IBOutlet weak var descriptionTextfield: UITextField!
    
    
    var food: Food?
    init?(coder: NSCoder, food: Food?){
        self.food = food
        super.init(coder: coder)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()

        
    }
    func updateView(){
        guard let food = food else {
            return
        }
        foodNameTextField.text = food.name
        descriptionTextfield.text = food.description

    }

  

}
