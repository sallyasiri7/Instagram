//
//  BookDetails.swift
//  BooksStor
//
//  Created by sally asiri on 08/06/1443 AH.
//


struct BookDetails {
  let name : String
  let auther : String
  let price : Int
  let image : String
  var numberOfBooks : Int
//  var numberOfBook : Int{
////   get{
////     numberOfBooks
////   }
////   set(Value){
////     numberOfBooks = Value
////   }
////  }
//  init(name: String , auther: String , price: Int , image:String ,numberOfBooks: Int ){
//    self.name = name
//    self.auther = auther
//    self.price = price
//    self.image = image
//    self.numberOfBooks = numberOfBooks
//  }
//  func printsBookStore() {
//  }
}
var bookStore = [
  BookDetails(name: "اعجوبه", auther: "ايهاب عبدالحميد", price: 39, image: "1", numberOfBooks: 100),
  BookDetails(name: "لاعب شطرنج", auther: "ستيفان", price: 50, image: "2", numberOfBooks: 200),
  BookDetails(name: "تاريخ موجز للزمن", auther: "ستيفن", price: 70, image: "3", numberOfBooks: 300),
  BookDetails(name: "هاري بوتر", auther: "رولينج", price: 80, image: "5", numberOfBooks: 400)
]
////MARK: - prints BookStore details
//class bookDetails : BookDetails {
//  override func printsBookStore() {
//     super.printsBookStore()
//     print("name:\(name)","price:\(price)","auther\(auther)","number of books\(numberOfBooks)")
//  }
//}










