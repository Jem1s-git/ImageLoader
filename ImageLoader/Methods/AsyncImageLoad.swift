

import SwiftUI

// Структура для асинхронной загрузки изображений

struct AsyncImage: View {
    @State private var image: UIImage?
    let url: URL

    var body: some View {
        Group {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else {
                ProgressView()
                    .onAppear {
                        loadImage()
                    }
            }
        }
    }

    private func loadImage() {
        if let cachedImage = ImageCache.shared.get(forKey: url.absoluteString) {
            self.image = cachedImage
        } else {
            DispatchQueue.global(qos: .userInitiated).async {
                do {
                    let data = try Data(contentsOf: self.url)
                    if let uiImage = UIImage(data: data) {
                        ImageCache.shared.set(uiImage, forKey: self.url.absoluteString)
                        DispatchQueue.main.async {
                            self.image = uiImage
                        }
                    } else {
                        print("Не удалось создать изображение из данных.")
                    }
                } catch {
                    print("Ошибка загрузки изображения: \(error.localizedDescription)")
                }
            }
        }
    }
}

// Функция проверки валидности изображения по URL асинхронно
//проверят размер полученного изображения если она имеет размер 1х1 не загружает ее
func isValidImage(url: URL, completion: @escaping (Bool) -> Void) {
    DispatchQueue.global(qos: .userInitiated).async {
        do {
            let data = try Data(contentsOf: url)
            guard let image = UIImage(data: data) else {
                completion(false)
                return
            }
            completion(image.size.width > 1 && image.size.height > 1)
        } catch {
            print("Ошибка при проверке валидности изображения по URL \(url): \(error.localizedDescription)")
            completion(false)
        }
    }
}
