//
//  AccountSummaryJSONReader.swift
//  InstagramClone
//
//  Created by Claude Botes on 12/04/2018.
//  Copyright © 2018 Claude. All rights reserved.
//
import Foundation

final class AccountSummaryStyleJSONReader {
    // 1
    static let shared = AccountSummaryStyleJSONReader()
    
    // 2
    private init() {
    }
    
    func GetTextStyleJSONData() -> [TextStyleFromJSON]{
        
        let textStyleJSONData: [TextStyleFromJSON] = {
            
            guard let path = Bundle.main.path(forResource: "TestTextStyle", ofType: "json") else { return [] }
            let url = URL(fileURLWithPath: path)
            
            guard let data = try? Data(contentsOf: url) else { return [] }
            
            do {
                let decoder = JSONDecoder()
                let sections = try decoder.decode([TextStyleFromJSON].self, from: data)
                return sections
            }catch{
                print(error)
            }
            
            return []
        }()
        return textStyleJSONData
    }
}



final class JSONReader {
    // 1
    static let shared = JSONReader()

    // 2
    private init() {
    }

    func GetJSONData<T: Decodable>(fileName: String, type: T) -> [T]{

        let JSONData: [T] = {

            guard let path = Bundle.main.path(forResource: fileName, ofType: "json") else { return [] }
            let url = URL(fileURLWithPath: path)

            guard let data = try? Data(contentsOf: url) else { return [] }

            do {
                let decoder = JSONDecoder()
                let sections = try decoder.decode([T].self, from: data)
                return sections
            }catch{
                print(error)
            }

            return []
        }()
        return JSONData
    }


}
