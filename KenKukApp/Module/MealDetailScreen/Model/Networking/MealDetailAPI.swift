//
//  MealDetailAPI.swift
//  KenKukApp
//
//  Created by Bayu Aslama  on 19/07/21.
//

import Foundation
import Alamofire

class MealDetailAPI {
    static let shared = MealDetailAPI()
    
    func getMealDetail(idMeal: String, completion: @escaping(Meal?, AFError?) -> ()){
        let url = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(idMeal)"
        AF.request(url)
            .validate()
            .responseDecodable(of: Meal.self) { response in
                switch response.result {
                    case .success(let detail):
                        completion(detail, nil)
                    case .failure(let error):
                        completion(nil, error)
                }
            }
    }
}
