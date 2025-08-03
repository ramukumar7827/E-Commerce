import 'package:ecom_app/models/product.dart';
import 'package:ecom_app/providers/favourite_provider.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required this.product});
  final Product product;
  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {

    final provider=FavouriteProvider.of(context);
    return Container(
      width: MediaQuery.of(context).size.width/2,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.grey.withOpacity(0.1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: ()=>provider.toggleFavourite(widget.product),
                child: Icon(
                  provider.isExist(widget.product)?Icons.favorite:
                  Icons.favorite_border_outlined,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 55,
            width: 55,
            child: Image.asset(widget.product.image,fit: BoxFit.cover,),
          ),
          Text(widget.product.name,textAlign: TextAlign.center,style: const TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 13,),),
          Text(widget.product.category,style: const TextStyle(color: Color(0xffB81736),fontSize: 13),),
          Text("₹ ${widget.product.price}",style: const TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 16)),
          
        ],
      ),
    );
  }
}