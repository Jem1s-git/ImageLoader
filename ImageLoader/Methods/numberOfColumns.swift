


import SwiftUI

   func numberOfColumns(for width: CGFloat) -> Int { // Определяем количество колонок в зависимости от ширины экрана
        if width > 600 {
            return 4 // Для широких экранов (например, iPad)
        } else if width > 400 {
            return 3 // Для средних экранах (например, большие телефоны)
        } else {
            return 2 // Для узких экранах (например, маленькие телефоны)
        }
    }
