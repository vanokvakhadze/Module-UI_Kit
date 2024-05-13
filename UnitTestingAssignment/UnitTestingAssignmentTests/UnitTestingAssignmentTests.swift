//
//  UnitTestingAssignmentTests.swift
//  UnitTestingAssignmentTests
//
//  Created by vano Kvakhadze on 12.05.24.
//

import XCTest
@testable import UnitTestingAssignment

final class UnitTestingAssignmentTests: XCTestCase {
    
    var cart: CartViewModel!

    override func setUpWithError() throws {
         cart = CartViewModel()
    }

    override func tearDownWithError() throws {
         cart = nil
    }
    
    
    
    func testAddwithId(){
        cart.fetchProducts()
        cart.allproducts = [Product]()
        cart.selectedProducts = [Product()]
        var addWithId = Product().id
        addWithId = 2
        cart.addProduct(withID: addWithId)
        XCTAssertEqual(cart.selectedProducts.count, 1)
        XCTAssertNil(cart.selectedProducts.first { $0.id == addWithId })
    }
    
    
    func testAddproducts(){
        cart.fetchProducts()
        cart.allproducts = [Product]()
        let productToadd = Product()
        cart.addProduct(product: productToadd)
        XCTAssertEqual(cart.selectedProducts.count, 1)
        
    }
    
    func testRandomElement(){
        cart.allproducts = [Product()]
        cart.fetchProducts()
        let size = cart.selectedProducts.count
        cart.addRandomProduct()
        XCTAssertEqual(cart.selectedProducts.count, size + 1)
    }
    
    func testRemoveWithId(){
        cart.fetchProducts()
        cart.allproducts = [Product]()
        cart.selectedProducts = [Product]()
        let size = cart.selectedProducts.count
        
        let productToadd = Product()
        cart.addProduct(product: productToadd)
        XCTAssertEqual(cart.selectedProducts.count, size + 1)
        
        cart.allproducts = [Product]()
        cart.selectedProducts = [Product]()
        
        var removeId = Product().id
        removeId = 2
        cart.removeProduct(withID: removeId!)
        XCTAssertEqual(cart.selectedProducts.count, size )
        XCTAssertNil(cart.selectedProducts.first { $0.id == removeId })
        
    }
    
    func testRemoveAll(){
        cart.allproducts = [Product()]
        cart.fetchProducts()
        cart.selectedProducts = [Product]()
        let size = cart.selectedProducts.count
        
        let productToadd = Product()
        cart.addProduct(product: productToadd)
        XCTAssertEqual(cart.selectedProducts.count, size + 1)
        
        cart.allproducts = [Product]()
        cart.selectedProducts = [Product]()
        
        cart.clearCart()
        XCTAssertEqual(cart.selectedProducts.count, 0)
    }
    

    
    //MARK: testSelelctedQantity2 da testTotalPrice2 sworad weria?
    func testSelelctedQantity2(){
        cart.fetchProducts()
        cart.allproducts = [Product]()
        let productToadd = Product()
        cart.addProduct(product: productToadd)
        cart.selectedProducts = [Product()]
        XCTAssertNotNil(cart.selectedItemsQuantity)
    }
    
    
    func testTotalPrice2(){
        cart.fetchProducts()
        cart.allproducts = [Product]()
        cart.addProduct(product: Product())
        cart.selectedProducts = [Product]()
        XCTAssertNotNil(cart.totalPrice)
    }
    
    
    
    //MARK: testSelelctedQantity da testTotalPrice  მარტივად რომ გამეგო მაგიტო დავწერე ეს ტესტები და აღარ წავშალე
    
    func testTotalPrice(){
        let product1 = Product(id: 1, title: "iphone 14pro", price: 10.0, selectedQuantity: 2)
        let product2 = Product(id: 2, title: "iphone 15 pro", price: 20.0, selectedQuantity: 3)
        cart.selectedProducts = [product1, product2]
        let expectedTotalPrice = (10.0 * 2) + (20.0 * 3)
        let totalPrice = cart.totalPrice
        XCTAssertEqual(totalPrice, expectedTotalPrice)
    }
    
    func testSelectedQuantity(){
        let product1 = Product(id: 1, title: "iphone 14pro", price: 10.0, selectedQuantity: 2)
        let product2 = Product(id: 2, title: "iphone 15 pro", price: 20.0, selectedQuantity: 3)
        cart.selectedProducts = [product1, product2]
        XCTAssertEqual(cart.selectedItemsQuantity, 5)
    }

}
