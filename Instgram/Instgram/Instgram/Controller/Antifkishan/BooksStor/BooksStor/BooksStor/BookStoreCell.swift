//
//  BookStoreCell.swift
//  BooksStor
//
//  Created by sally asiri on 08/06/1443 AH.
//

import UIKit
class BookStoreCell: UITableViewCell {
  private let identifire = "cell"
   let bookName: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
    label.textColor = .black
    label.textAlignment = .right
    label.font = UIFont(name: "Avenir-Light", size: 20)
    return label
  }()
  public let autherName: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
    label.textColor = .black
    label.textAlignment = .right
    label.font = UIFont(name: "Avenir-Light", size: 18)
    return label
  }()
  public let bookPrice: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
    label.textColor = .black
    label.font = UIFont(name: "Avenir-Light", size: 18)
    label.textAlignment = .right
    return label
  }()
  public let numberOfBooks: UILabel = {
    let label = UILabel()
    label.textAlignment = .right
    label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
    label.textColor = .black
    label.font = UIFont(name: "Avenir-Light", size: 18)
    return label
  }()
  public let imageBook: UIImageView = {
    let image = UIImageView()
    return image
  }()
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
    super.init(style: style , reuseIdentifier: reuseIdentifier )
    contentView.clipsToBounds = true
    contentView.backgroundColor = .white
    contentView.layer.cornerRadius = 13
    contentView.addSubview(bookName)
    contentView.addSubview(autherName)
    contentView.addSubview(bookPrice)
    contentView.addSubview(numberOfBooks)
    contentView.addSubview(imageBook)
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  override func layoutSubviews() {
    super.layoutSubviews()
    bookName.frame = CGRect(x: -20,
            y: -30,
            width: 300,
            height: contentView.frame.size.height-30)
    autherName.frame = CGRect(x: -19,
            y: 5,
            width: 300,
            height: contentView.frame.size.height-30)
    bookPrice.frame = CGRect(x: -19,
            y: 35,
            width: 300,
            height: contentView.frame.size.height-30)
    numberOfBooks.frame = CGRect(x: -19,
            y: 68,
            width: 300,
            height: contentView.frame.size.height-30)
    imageBook.frame = CGRect(x: 290,
            y: 16,
            width: 110,
            height:130)
  }
}

