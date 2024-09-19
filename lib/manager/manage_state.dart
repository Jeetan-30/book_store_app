
import 'package:bookstore/model/address_model.dart';
import 'package:bookstore/model/bookmark_class.dart';
import 'package:bookstore/model/product_model.dart';
import 'package:flutter/cupertino.dart';

class ManageState with ChangeNotifier{
  /// for book buying
  int _counter = 0;

  set counter(int value){
    _counter=value;
    notifyListeners();
  }
  int get counter=>_counter;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  List<BookList> _cardProducts=[];

  bool addToCard(BookList product){
    if(!_cardProducts.contains(product)){
      _cardProducts.add(product);
      _counter++;
      notifyListeners();
      return true;
    }
    else{
      _cardProducts.remove(product);
      _counter--;
      notifyListeners();
      return false;
    }
  }

  List<BookList> get cardProducts=> _cardProducts;

  /// for bookmark
  int _bookmarkCounter = 0;

  set bookmarkCounter(int value){
    _bookmarkCounter=value;
    notifyListeners();
  }

  int get bookmarkCounter => _bookmarkCounter;
  void incrementBookmarkCounter() {
    _bookmarkCounter++;
    notifyListeners();
  }

  List<BookList> _cardProduct=[];

  bool addToBookmark(BookList product) {
    if(!_cardProduct.contains(product)){
      _cardProduct.add(product);
      _bookmarkCounter++;
      product.Bookmarked = true;
      notifyListeners();
      return true;
    }
    else{
      _cardProduct.remove(product);
      _bookmarkCounter--;
      product.Bookmarked = false;
      notifyListeners();
      return false;
    }
  }
  List<BookList> get cardProduct=> _cardProduct;

  /// bookmark boolean form

  List<Book> _bookmarks = [];

  List<Book> get bookmarks => _bookmarks;

  void Bookmark(Book book) {
    if (_bookmarks.contains(book)) {
      _bookmarks.remove(book);
      bookmarkCounter--;
      book.isBookmarked = false;
      // store[0].Bookmarked = false;
      notifyListeners();

    } else {
      _bookmarks.add(book);
      book.isBookmarked = true;
      bookmarkCounter++;
      // store[0].Bookmarked = false;
      notifyListeners();
    }
  }



  void increaseQuantity(BookList product){
    product.quantity++;
    notifyListeners();
  }

  void decreaseQuantity(BookList product){
    if(product.quantity>0){
      product.quantity--;
      notifyListeners();
    }
    // else{
    //   _cardProducts.remove(product);
    //   _counter--;
    //   notifyListeners();
    // }
  }

  double calculate(){
    double total=0;
    for(var product in _cardProducts){
      total+=product.price*product.quantity;
    }
    return total;
  }

  void deleteProducts(BookList product){
    _cardProducts.remove(product);
    bookmarkCounter--;
    notifyListeners();
  }
  List<AddressClass> _deliveryInfo = [];

  List<AddressClass> get deliveryInfo => _deliveryInfo;

  void deleteProduct(BookList product){
    _cardProduct.remove(product);
    _counter--;
    notifyListeners();
  }
  List<AddressClass> _favourite = [];

  List<AddressClass> get favourite => _favourite;

  void addDeliveryInfo(String name, String address, String email,String phoneNo) {
    _deliveryInfo.add(
      AddressClass(
        name: name,
        email:email,
        address: address,
        phoneNo: phoneNo,
      ),
    );
  }
}
