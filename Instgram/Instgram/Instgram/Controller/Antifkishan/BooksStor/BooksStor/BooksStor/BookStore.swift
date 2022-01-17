//
//  BookStore.swift
//  BooksStor
//
//  Created by sally asiri on 08/06/1443 AH.
//

import UIKit
class BookStore: UIViewController {
  lazy var tabelView : UITableView = {
    let tv = UITableView()
    tv.rowHeight = 140
    tv.register(BookStoreCell.self, forCellReuseIdentifier: "cell")
    tv.translatesAutoresizingMaskIntoConstraints = false
    tv.dataSource = self
    tv.delegate = self
    return tv
  }()
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.addSubview(tabelView)
    NSLayoutConstraint.activate([
      tabelView.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 0),
      tabelView.rightAnchor.constraint(equalTo: view.rightAnchor,constant: 0),
      tabelView.topAnchor.constraint(equalTo: view.topAnchor,constant: 0),
      tabelView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: 0)
    ])
  }
}
extension BookStore: UITableViewDelegate , UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return bookStore.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let book = bookStore[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BookStoreCell
    cell.bookName.text = "اسم الكتاب:\(book.name)"
    cell.autherName.text = "المؤلف:\(book.auther)"
    cell.bookPrice.text = "السعر:\(book.price)"
    cell.imageBook.image = UIImage(named: book.image)
    cell.numberOfBooks.text = "عدد الصفحات :\(book.numberOfBooks)"
    return cell
  }
}

