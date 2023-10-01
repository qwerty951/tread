//
//  ImageTableViewCell.swift
//  cell1
//
//  Created by admin on 26.09.2023.
//

import Foundation
import UIKit

class ImageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageCell: UIImageView!
    
    var imageURL: URL?
    var dataTask: URLSessionDataTask?
    
    func loadImage(url: URL) {
        imageCell?.image = nil
        dataTask?.cancel()
        
        // Создайте отдельную очередь для обработки данных
        let dataProcessingQueue = DispatchQueue(label: "com.example.dataProcessing", qos: .userInitiated)
        
        self.dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            // Проверяем, что данные получены успешно
            guard let data = data else {
                // Обработка ошибки, если данные не получены
                return
            }
            // Обработка данных (создание UIImage) на отдельной очереди
            dataProcessingQueue.async {
                if let image = UIImage(data: data) {
                    // Выполняем обновление UI на главной очереди
                    DispatchQueue.main.async {
                        self?.imageCell?.image = image
                        print("LoadImage url:\(url)")
                        print("image:\(image)")
                    }
                }
            }
        }
        dataTask?.resume()
    }
}

