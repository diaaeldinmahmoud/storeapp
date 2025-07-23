import 'package:flutter/material.dart';
import 'package:storeapp/models/product_models.dart';
import 'package:storeapp/services/updateproduct.dart';
import 'package:storeapp/widgets/button.dart';
import 'package:storeapp/widgets/textfield.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Productpage extends StatefulWidget {
  Productpage({super.key});
  static const String id = 'productpage';

  @override
  State<Productpage> createState() => _ProductpageState();
}

class _ProductpageState extends State<Productpage> {
  dynamic? productname, description, image, price;
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    dynamic product = ModalRoute.of(context)!.settings.arguments;
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        appBar: AppBar(
          title: Text('update product', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 180),
                customtextfield(
                  onChanged: (value) => productname = value,
                  hinttext: 'product name',
                ),
                customtextfield(
                  onChanged: (value) => description = value,
                  hinttext: 'description',
                ),
                customtextfield(
                  onChanged: (value) => image = value,
                  hinttext: 'image',
                ),
                customtextfield(
                  onChanged: (value) => price = value,
                  hinttext: 'price',
                  inputType: TextInputType.number,
                ),
                SizedBox(height: 20),
                custombutton(
                  text: 'update',
                  ontap: () async {
                    isloading = true;
                    setState(() {});
                    await updateproductinpage(product);
                    try {
                      print('updated');
                    } catch (e) {
                      print(e.toString());
                    }
                    isloading = false;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateproductinpage(ProductModels product) async {
    await Updateproduct().updateProduct(
      id: product.id.toString(),
      title: productname == null ? product.title : productname!,
      price: price == null ? product.price : price!,
      description: description == null ? product.description : description!,
      image: image == null ? product.image : image!,
      category: product.category,
    );
  }
}
