//
//  API.swift
//  ImageLoader
//
//  Created by Кирилл Уваров on 04.10.2024.
//

import Foundation
//
//func fetchImageLinks(completion: @escaping ([String]) -> Void) {
//    guard let url = URL(string: "https://it-link.ru/test/images.txt") else { return }
//    
//    URLSession.shared.dataTask(with: url) { data, response, error in
//        guard let data = data, error == nil else {
//            completion([])
//            return
//        }
//        
//        let links = String(data: data, encoding: .utf8)?.components(separatedBy: "\n") ?? []
//        completion(links)
//    }.resume()
//}

//
//func fetchImageLinks(completion: @escaping ([String]) -> Void) {
//    guard let url = URL(string: "https://it-link.ru/test/images.txt") else { return }
//    
//    URLSession.shared.dataTask(with: url) { data, response, error in
//        guard let data = data, error == nil else {
//            completion([])
//            return
//        }
//        
//        let links = String(data: data, encoding: .utf8)?
//            .components(separatedBy: "\n")
//            .filter { $0.contains("images") || $0.contains(".jpg") } ?? []
//        
//        completion(links)
//    }.resume()
//}

//import Foundation
//import SwiftUI
//
//func fetchImageLinks(from url: String, completion: @escaping ([String]) -> Void) {
//    guard let url = URL(string: url) else {
//        completion([])
//        return
//    }
//    
//    URLSession.shared.dataTask(with: url) { data, _, error in
//        guard let data = data, error == nil else {
//            completion([])
//            return
//        }
//        
//        let links = String(data: data, encoding: .utf8)?
//            .components(separatedBy: .newlines) ?? []
//        
//        // Асинхронная проверка URL
//        checkValidURLs(links) { validLinks in
//            completion(validLinks)
//        }
//    }.resume()
//}
//
//func checkValidURLs(_ urls: [String], completion: @escaping ([String]) -> Void) {
//    var validURLs = [String]()
//    let dispatchGroup = DispatchGroup()
//    
//    for url in urls {
//        dispatchGroup.enter() // Увеличиваем счетчик группы
//        
//        DispatchQueue.global(qos: .userInitiated).async {
//            if isValidURL(url) {
//                validURLs.append(url)
//            }
//            dispatchGroup.leave() // Уменьшаем счетчик группы
//        }
//    }
//    
//    dispatchGroup.notify(queue: .main) {
//        completion(validURLs)
//    }
//}
//
//func isValidURL(_ string: String) -> Bool {
//    guard let url = URL(string: string) else { return false }
//    return UIApplication.shared.canOpenURL(url)
//}
