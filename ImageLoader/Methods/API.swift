

import SwiftUI

// Функция получения ссылок на изображения

func fetchImageLinks(completion: @escaping ([String]) -> Void) {
    guard let url = URL(string: "https://it-link.ru/test/images.txt") else { return }

    URLSession.shared.dataTask(with: url) { data, response, error in
        guard let data = data, error == nil else {
            completion([])
            return
        }

        let links = String(data: data, encoding: .utf8)?.components(separatedBy: "\n") ?? []
        completion(links)
    }.resume()
}
