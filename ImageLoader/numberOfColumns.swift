//import SwiftUI
//
//struct ContentView: View {
//    @State private var imageLinks: [String] = []
//    
//    var body: some View {
//        let columns = Array(repeating: GridItem(.flexible()), count: numberOfColumns)
//        
//        LazyVGrid(columns: columns) {
//            ForEach(imageLinks, id: \.self) { link in
//                if let image = loadImage(from: link) {
//                    NavigationLink(destination: FullImageView(imageURL: link)) {
//                        Image(uiImage: image)
//                            .resizable()
//                            .scaledToFit()
//                            .frame(height: 100)
//                    }
//                }
//            }
//        }
//        .onAppear {
//            fetchImageLinks(from: "https://it-link.ru/test/images.txt") { links in
//                self.imageLinks = links
//            }
//        }
//    }
//    
//    private var numberOfColumns: Int {
//        // Логика для определения количества столбцов в зависимости от ориентации экрана
//        return UIScreen.main.bounds.width > 600 ? 4 : 2 // Пример
//    }
//}
//struct FullImageView: View {
//    var imageURL: String
//    
//    var body: some View {
//        if let image = loadImage(from: imageURL) {
//            Image(uiImage: image)
//                .resizable()
//                .scaledToFit()
//                .edgesIgnoringSafeArea(.all)
//        } else {
//            Text("Не удалось загрузить изображение")
//        }
//    }
//}
//func loadImage(from urlString: String) -> UIImage? {
//    // Проверка кэша перед загрузкой
//    let fileManager = FileManager.default
//    guard let url = URL(string: urlString) else { return nil }
//    
//    let cacheURL = fileManager.urls(for: .cachesDirectory, in: .userDomainMask)[0]
//        .appendingPathComponent(url.lastPathComponent) // Теперь это корректно
//
//    if let cachedImage = UIImage(contentsOfFile: cacheURL.path) {
//        return cachedImage
//    }
//
//    guard let data = try? Data(contentsOf: url), let image = UIImage(data: data) else {
//        return nil
//    }
//
//    // Сохранение изображения в кэш
//    try? data.write(to: cacheURL)
//
//    return image
//}
