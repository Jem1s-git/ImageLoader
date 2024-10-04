//
//  2.swift
//  ImageLoader
//
//  Created by Кирилл Уваров on 04.10.2024.
//

import SwiftUI

// Структура для представления деталей изображения
struct ImageDetailView: View {
    let imageURL: URL // URL изображения

    var body: some View {
        AsyncImage(url: imageURL) // Загружаем изображение асинхронно
            .aspectRatio(contentMode: .fit) // Устанавливаем режим отображения с сохранением пропорций
            .padding() // Добавляем отступы вокруг изображения
    }
}
