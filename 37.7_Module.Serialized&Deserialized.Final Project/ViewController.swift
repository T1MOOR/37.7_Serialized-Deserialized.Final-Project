//
//  ViewController.swift
//  37.7_Module.Serialized&Deserialized.Final Project
//
//  Created by Тимур Гарипов on 08.01.23.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var imagesArray: [String] = []
    var titlesArray: [String] = []
    var descriptionsArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        //  Делаем запрос, получаем массив с картинками и массив с заголовками. Используем их для наполнения массивов, использующихся в таблице и обновляем таблицу
        NewsRequest.getNewsData(type: ArticlesModel.self) { [self] imagesArray, titlesArray, descriptionsArray in
            self.imagesArray = imagesArray
            self.titlesArray = titlesArray
            self.descriptionsArray = descriptionsArray
            self.tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDelegate {
    //  Описываем действия при взаимодействии с таблицей
}

extension ViewController: UITableViewDataSource {
    //  Описываем внешний вид таблицы
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imagesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as? ArticleCell else { return UITableViewCell() }
        cell.cellLabel.text = titlesArray[indexPath.row]
        cell.cellLabelDescription.text = descriptionsArray[indexPath.row]
        cell.cellImage.sd_setImage(with: URL(string: imagesArray[indexPath.row]),
                                         placeholderImage: nil,
                                         options: [.continueInBackground, .progressiveLoad],
                                         completed: nil)
        return cell
    }
}

