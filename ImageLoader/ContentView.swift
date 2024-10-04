import SwiftUI

// Основная структура представления
struct ContentView: View {
    
    @State private var imageLinks: [String] = [] // массив ссылок на изображения
    @State private var validImageLinks: [String] = [] // массив валидных ссылок на изображения
    @State private var isDarkMode: Bool = false // Флаг для проверки темной темы
    @State private var hasFetchedLinks: Bool = false // Флаг для проверки получения ссылок
    @State private var isLoading: Bool = true // Флаг для отображения индикатора загрузки
    
    var body: some View {
        NavigationView { // Оборачиваем все в NavigationView для поддержки навигации
            GeometryReader { geometry in // Используем GeometryReader для доступа к ширине экрана
                let columns = Array(repeating: GridItem(.flexible()), count: numberOfColumns(for: geometry.size.width)) // Определяем количество колонок для сетки
                
                ScrollView { // Добавляем ScrollView для прокрутки содержимого
                    VStack { // Используем VStack для вертикального расположения элементов
                        Toggle("Темная тема", isOn: $isDarkMode)
                            .padding()
                            .toggleStyle(SwitchToggleStyle(tint: .blue)) // Стиль переключателя
                        
                        if isLoading { // Проверяем, загружаем ли мы изображения
                            ProgressView("Загрузка изображений...") // Индикатор загрузки
                                .progressViewStyle(CircularProgressViewStyle(tint: .blue)) // Стиль индикатора
                                .padding()
                        } else {
                            LazyVGrid(columns: columns) { // Используем ленивую вертикальную сетку для отображения изображений
                                ForEach(validImageLinks, id: \.self) { link in // Проходим по каждой валидной ссылке на изображение
                                    if let url = URL(string: link) { // Преобразуем строку в URL
                                        NavigationLink(destination: ImageDetailView(imageURL: url)) { // Создаем навигационную ссылку на представление деталей изображения
                                            AsyncImage(url: url) // Загружаем изображение асинхронно
                                                .frame(width: 100, height: 100) // Устанавливаем размер изображения
                                                .clipped() // Обрезаем изображение по заданным границам
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .navigationTitle("Изображения") // Устанавливаем заголовок навигации
                    .preferredColorScheme(isDarkMode ? .dark : .light) // Установка темы в зависимости от состояния переключателя
                    .onAppear { // Вызывается, когда представление появляется на экране
                        if !hasFetchedLinks { // Проверяем, были ли уже получены ссылки
                            fetchImageLinks { links in // Запускаем функцию для получения ссылок на изображения
                                DispatchQueue.main.async { // Переходим на главный поток для обновления UI
                                    self.imageLinks = links // Сохраняем все ссылки в состоянии представления
                                    validateImageLinks(links) { validLinks in
                                        self.validImageLinks = validLinks // Сохраняем только валидные ссылки в состоянии представления
                                        self.hasFetchedLinks = true // Устанавливаем флаг о завершении получения ссылок
                                        self.isLoading = false // Устанавливаем флаг загрузки в false после завершения загрузки изображений
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
#Preview {
    ContentView()
}
