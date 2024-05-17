import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile_app/dashboard/modules/Cart/Controller/cart_cubit.dart';
import 'package:mobile_app/dashboard/modules/Cart/Controller/cart_state.dart';
import 'package:mobile_app/dashboard/modules/Cart/Model/cart_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..getData(),
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: _buildCartList(state.cart),
                ),
              ],
            ),
            bottomNavigationBar: InkWell(
              onTap: () {
                Fluttertoast.showToast(
                  msg: "Payment Successful",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 2,
                  backgroundColor: const Color.fromARGB(255, 15, 237, 82),
                  textColor: Colors.black,
                  fontSize: 16.0,
                );
              },
              child: Container(
                color: const Color.fromARGB(255, 15, 237, 82),
                alignment: Alignment.center,
                height: 50.0,
                child: const Text(
                  'Proceed to Pay',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCartList(List<Cart> cart) {
    if (cart.isEmpty) {
      return const Center(
        child: Text(
          'Your Cart is Empty',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
        ),
      );
    } else {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: cart.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.blueGrey.shade200,
            elevation: 5.0,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    height: 100,
                    width: 70,
                    image: MemoryImage(cart[index].image!),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          text: TextSpan(
                            text: 'Name: ',
                            style: TextStyle(
                              color: Colors.blueGrey.shade800,
                              fontSize: 16.0,
                            ),
                            children: [
                              TextSpan(
                                text: '${cart[index].productName!}\n',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          text: TextSpan(
                            text: 'Price: ' r"$",
                            style: TextStyle(
                              color: Colors.blueGrey.shade800,
                              fontSize: 16.0,
                            ),
                            children: [
                              TextSpan(
                                text: '${cart[index].productPrice}\n',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  BlocListener<CartCubit, CartState>(
                    listener: (context, state) {},
                    child: Builder(
                      builder: (context) {
                        return PlusMinusButtons(
                          addQuantity: () {
                            context
                                .read<CartCubit>()
                                .addQuantity(cart[index].id!);
                          },
                          deleteQuantity: () {
                            context
                                .read<CartCubit>()
                                .deleteQuantity(cart[index].id!);
                          },
                          text: cart[index].quantity.toString(),
                        );
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<CartCubit>().removeItem(cart[index].id!);
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red.shade800,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }
}

class PlusMinusButtons extends StatelessWidget {
  final VoidCallback deleteQuantity;
  final VoidCallback addQuantity;
  final String text;
  const PlusMinusButtons({
    Key? key,
    required this.addQuantity,
    required this.deleteQuantity,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: deleteQuantity, icon: const Icon(Icons.remove)),
        Text(text),
        IconButton(onPressed: addQuantity, icon: const Icon(Icons.add)),
      ],
    );
  }
}

class ReusableWidget extends StatelessWidget {
  final String title, value;
  const ReusableWidget({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Text(
            value.toString(),
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ],
      ),
    );
  }
}
// class CartScreen extends StatelessWidget {
//   const CartScreen({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: Column(
//           children: [
//             Expanded(
//               child: Container(
//                 child: ListView.separated(
//                   itemBuilder: (context, index) {
//                     return Container(
//                       height: 160,
//                       child: Row(
//                         children: [
//                           Container(
//                             width: 150,
//                             child: Image.asset(
//                               "assets/images/Portable.png",
//                               fit: BoxFit.fill,
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 40, top: 20),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 CustomText(
//                                   fontSize: 20,
//                                   text: "Power Bank",
//                                 ),
//                                 SizedBox(
//                                   height: 15,
//                                 ),
//                                 CustomText(
//                                   color: Color.fromARGB(255, 8, 169, 8),
//                                   text: "\$200",
//                                 ),
//                                 SizedBox(
//                                   height: 20,
//                                 ),
//                                 Container(
//                                   width: 120,
//                                   color: ccolor.gray2,
//                                   height: 40,
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Icon(
//                                         Icons.add,
//                                         color: Colors.black,
//                                       ),
//                                       SizedBox(
//                                         width: 20,
//                                       ),
//                                       CustomText(
//                                         text: '1',
//                                         alignment: Alignment.center,
//                                         fontSize: 20,
//                                         color: Colors.black,
//                                       ),
//                                       SizedBox(
//                                         width: 20,
//                                       ),
//                                       Container(
//                                         padding: EdgeInsets.only(bottom: 15),
//                                         child: Icon(
//                                           Icons.minimize,
//                                           color: Colors.black,
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                     );
//                   },
//                   itemCount: 4,
//                   separatorBuilder: (BuildContext context, int index) {
//                     return SizedBox(
//                       height: 15,
//                     );
//                   },
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(
//                 left: 20,
//                 right: 20,
//                 top: 20,
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       CustomText(
//                         text: "Total",
//                         fontSize: 22,
//                         color: const Color.fromARGB(255, 0, 0, 0),
//                       ),
//                       SizedBox(
//                         height: 15,
//                       ),
//                       CustomText(
//                         text: "\$800",
//                         fontSize: 18,
//                         color: Color.fromARGB(255, 8, 169, 8),
//                       ),
//                     ],
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       // Add your checkout functionality here
//                     },
//                     child: CustomText(
//                       text: "CheckOut",
//                       color: Colors.white,
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.green,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
