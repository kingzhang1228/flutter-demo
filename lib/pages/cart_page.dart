import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provide/provide.dart';
import '../provide/cart.dart';


class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('购物车'),
      ),
      body: FutureBuilder(
        future: _getCartInfo(context),
        builder: (context, snapshot){
          List cartList = Provide.value<CartProvide>(context).cartList;
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: cartList.length,
              itemBuilder: (context,index){
                return ListTile(
                  title: Text(cartList[index].goodsName),
                );
              },
            );
          } else {
            return Text('正在加载。。。');
          }
        },
      ),
    );
  }

  Future<String> _getCartInfo(BuildContext context) async {
    await Provide.value<CartProvide>(context).getCartInfo();
    return 'end';
  }
}

// class CartPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('购物车'),
//       ),
//       body: FutureBuilder(
//         future: _getCartInfo(context),
//         builder: (context, snapshot){
//           List cartList = Provide.value<CartProvide>(context).cartList;
//           if (snapshot.hasData) {
//             return ListView.builder(
//               itemCount: cartList.length,
//               itemBuilder: (context, index){
//                 return ListTile(
//                   title: Text(cartList[index].goodsName),
//                 );
//               },
//             );
//           } else {
//             return Text('正在加载');
//           }
//         },
//       ),
//     );
//   }
//   Future<String> _getCartInfo(BuildContext context) async {
//     await Provide.value<CartProvide>(context).getCartInfo();
//     return 'end';
//   }
// }