

import SwiftUI

// Функция для валидации всех ссылок на изображения асинхронно
func validateImageLinks(_ links: [String], completion: @escaping ([String]) -> Void) {
    var validLinks = [String]()
    let group = DispatchGroup() // Группа для отслеживания завершения всех асинхронных задач
    
    for link in links {
        guard let url = URL(string: link) else { continue }
        group.enter() // Входим в группу перед началом проверки ссылки
        
        isValidImage(url: url) { isValid in
            if isValid {
                validLinks.append(link) // Добавляем валидную ссылку в массив
            }
            group.leave() // Выходим из группы после завершения проверки ссылки
        }
    }

    group.notify(queue: .main) {
        completion(validLinks) // Возвращаем валидные ссылки после завершения всех проверок
    }
}
