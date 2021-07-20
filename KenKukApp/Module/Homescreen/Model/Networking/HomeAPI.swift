//
//  HomeAPI.swift
//  KenKukApp
//
//  Created by Bayu Aslama  on 18/07/21.
//

import Foundation
import Alamofire



class HomeAPI{
    static let shared = HomeAPI()
    
    func getMealsByFirstLetter(_ firstLetter: String, completion: @escaping(Meal?, AFError?) -> Void){
      let url = "https://www.themealdb.com/api/json/v1/1/search.php?f=\(firstLetter)"
        print(url)
        AF.request(url)
            .validate()
            .responseDecodable(of: Meal.self) { response in
                switch response.result{
                    case.success(let meals):
                        completion(meals, nil)
                    case .failure(let error):
                        completion(nil, error)
                }
            }
    }
    
    func searchMeal(_ query: String, completion: @escaping(Meal?, AFError?) -> ()){
        let url = "https://www.themealdb.com/api/json/v1/1/search.php?s=\(query)"
        AF.request(url)
            .validate()
            .responseDecodable(of: Meal.self) { response in
                switch response.result{
                    case.success(let meals):
                        completion(meals, nil)
                    case .failure(let error):
                        completion(nil, error)
                }
            }
    }
}


struct Meal: Codable{
    let meals: [MealItem]?
}

struct MealItem: Codable {
    let idMeal: String?
    let strMeal: String?
    let strCategory: String?
    let strMealThumb: String?
    let strArea: String?
    
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strInstructions: String?
    let strYoutube: String?

}
