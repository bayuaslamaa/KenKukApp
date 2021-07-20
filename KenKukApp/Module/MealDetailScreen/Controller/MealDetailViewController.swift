//
//  MealDetailViewController.swift
//  KenKukApp
//
//  Created by Bayu Aslama  on 19/07/21.
//

import UIKit
import SDWebImage
import SafariServices

class MealDetailViewController: UIViewController {
    var idMeal: String?
    var recipes: [String] = []
    var urlVideo: String?
    @IBOutlet weak var areaView: UIView! {
        didSet {
            areaView.layer.cornerRadius = 10
        }
    }
    
    @IBOutlet weak var topView: UIView! {
        didSet {
            topView.layer.cornerRadius = 17
        }
    }
    @IBOutlet weak var recipeTableView: UITableView!
    
    @IBOutlet weak var mealDetailImageView: UIImageView!
    
    @IBOutlet weak var recipeTextView: UITextView!
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var mealNameLabel: UILabel!
    
    @IBOutlet weak var watchButton: UIButton!{
        didSet{
            watchButton.layer.backgroundColor = UIColor(red: 255, green: 0, blue: 0, alpha: 1).cgColor
            watchButton.layer.cornerRadius = 10
        }
    }
    @IBAction func crossButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func watchButtonTapped(_ sender: Any) {
        guard let urlStr = urlVideo else { return }
        if let url = URL(string: urlStr){
            let vc = SFSafariViewController(url: url)
            present(vc, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recipeTableView.delegate = self
        recipeTableView.dataSource = self
        
        if let idMeal = idMeal {
            getDetailMeal(idMeal)
        }
    }
    
    func getDetailMeal(_ idMeal: String){
        self.showLoader()
        MealDetailAPI.shared.getMealDetail(idMeal: idMeal) { detail, error in
            self.hideLoader()
            guard let detail = detail else { return }
            guard let meals = detail.meals else { return }
            let meal = meals[0]
            if let imgUrl = meal.strMealThumb {
                self.mealDetailImageView.sd_setImage(with: URL(string: imgUrl), completed: .none)
            }
            self.mealNameLabel.text = meal.strMeal
            self.areaLabel.text = meal.strArea
            self.recipes = self.groupRecipe(meal)
            self.recipeTextView.text = meal.strInstructions
            self.urlVideo = meal.strYoutube
            self.recipeTableView.reloadData()
        }
    }
    
    
    func groupRecipe(_ meal: MealItem) -> [String]{
        var recipes: [String] = []
        if meal.strMeasure1 != nil && meal.strMeasure1 != ""{
            recipes.append("\(meal.strMeasure1 ?? "") \(meal.strIngredient1 ?? "-")")
        }
        if meal.strMeasure2 != nil && meal.strMeasure2 != ""{
            recipes.append("\(meal.strMeasure2 ?? "") \(meal.strIngredient2 ?? "-")")
        }
        if meal.strMeasure3 != nil && meal.strMeasure3 != ""{
            recipes.append("\(meal.strMeasure3 ?? "") \(meal.strIngredient3 ?? "-")")
        }
        if meal.strMeasure4 != nil && meal.strMeasure4 != ""{
            recipes.append("\(meal.strMeasure4 ?? "") \(meal.strIngredient4 ?? "-")")
        }
        if meal.strMeasure5 != nil && meal.strMeasure5 != ""{
            recipes.append("\(meal.strMeasure5 ?? "") \(meal.strIngredient5 ?? "-")")
        }
        if meal.strMeasure6 != nil && meal.strMeasure6 != "" {
            recipes.append("\(meal.strMeasure6 ?? "") \(meal.strIngredient6 ?? "-")")
        }
        if meal.strMeasure7 != nil && meal.strMeasure7 != ""{
            recipes.append("\(meal.strMeasure7 ?? "") \(meal.strIngredient7 ?? "-")")
        }
        if meal.strMeasure8 != nil && meal.strMeasure8 != "" {
            recipes.append("\(meal.strMeasure8 ?? "") \(meal.strIngredient8 ?? "-")")
        }
        if meal.strMeasure9 != nil && meal.strMeasure9 != "" {
            recipes.append("\(meal.strMeasure9 ?? "") \(meal.strIngredient9 ?? "-")")
        }
        if meal.strMeasure10 != nil && meal.strMeasure10 != "" {
            recipes.append("\(meal.strMeasure10 ?? "") \(meal.strIngredient10 ?? "-")")
        }


print(recipes)

        return recipes
    }
}


extension MealDetailViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe = recipes[indexPath.item]
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeTableViewCell") as! RecipeTableViewCell
        cell.recipeLabel.text = "\(indexPath.item + 1). \(recipe)"
        return cell
    }
    
    
}
