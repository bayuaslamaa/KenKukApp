//
//  HomeViewController.swift
//  KenKukApp
//
//  Created by Bayu Aslama  on 18/07/21.
//

import UIKit


class HomeViewController: UIViewController{
    
    var meals:[MealItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRandomMeals()
        
        mealTableView.delegate = self
        mealTableView.dataSource = self
        
     
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBOutlet weak var welcomeView: UIView!{
        didSet {
            welcomeView.layer.borderWidth = 2
            welcomeView.layer.cornerRadius = 8
            welcomeView.layer.borderColor = UIColor(named: "greenCustom")?.cgColor
        }
    }
    @IBOutlet weak var searchView: UIView!{
        didSet {
            searchView.layer.cornerRadius = 10
            searchView.layer.borderWidth = 2
            searchView.layer.borderColor = UIColor(named: "yellowCustom")?.cgColor
        }
    }
    
    @IBOutlet weak var mealTableView: UITableView!
    
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var notFoundLabel: UILabel! {
        didSet {
            notFoundLabel.isHidden = true
        }
    }
    
    
    @IBAction func searchButtonTapped(_ sender: Any) {
        if let query = searchTextField.text {
            searchMeal(query)
        }
    }
    
    func getRandomMeals(){
        self.showLoader()
        let words:[String] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k"]
        guard let word = words.randomElement() else { return }
        HomeAPI.shared.getMealsByFirstLetter(word) { listMeal, error in
            self.hideLoader()
            if let meals = listMeal?.meals {
                self.meals = meals
                self.mealTableView.reloadData()
            }
        }
    
    }
    
    func searchMeal(_ query: String){
        self.notFoundLabel.isHidden = true

        HomeAPI.shared.searchMeal(query) { result, error in
            if let meals = result?.meals {
                self.meals = meals
                self.mealTableView.reloadData()
            } else {
                self.notFoundLabel.isHidden = false
            }
            
        }
    }
    
    
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let meal = meals[indexPath.item]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealTableViewCell") as! MealTableViewCell
        cell.setCell(meal)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let meal = meals[indexPath.item]
        let vc = UIStoryboard(name: "mealdetail", bundle: nil).instantiateInitialViewController() as! MealDetailViewController
        
        vc.idMeal = meal.idMeal
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
