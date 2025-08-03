import 'package:ecom_app/details_screen.dart';
import 'package:ecom_app/main.dart';
import 'package:ecom_app/providers/favourite_provider.dart';
import 'package:ecom_app/widgets/my_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = FavouriteProvider.of(context);
    final finalList = provider.favourites;
    return Scaffold(
      appBar: MyAppBar(title: 'Favourites'),
      body: Column(
        children: [
          
          Expanded(
              child: ListView.builder(
                  itemCount: finalList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Slidable(
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(), children: [
                            SlidableAction(onPressed: (context){
                              finalList.removeAt(index);
                              setState(() {
                                
                              });
                            },
                              backgroundColor: Colors.redAccent,
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                              label: 'Delete',
      
                            )
                        ],
                        ),
                        child: ListTile(
                          onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(product: finalList[index],),));
                          },
                          title: Text(
                            finalList[index].name,
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(finalList[index].description,overflow: TextOverflow.ellipsis),
      
                          leading: CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage(finalList[index].image),
                            backgroundColor: Colors.grey.withOpacity(0.2),
                          ),
      
                          trailing: Text("₹ ${finalList[index].price}",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
      
                          tileColor: Colors.grey[100],
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}