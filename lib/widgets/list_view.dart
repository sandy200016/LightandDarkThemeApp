
import 'package:catalog/main.dart';
import 'package:catalog/models/catalogitem.dart';
import 'package:catalog/widgets/mytheme.dart';
import 'package:flutter/material.dart';

class ItemView extends StatefulWidget {
   final Item item;
  ItemView({required this.item});

  @override
  _ItemViewState createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  var theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Card(
        elevation: 0.0,
        child: ListTile(
          /*leading: Image.network(
              item.image.toString()),*/
          //contentPadding: EdgeInsets.only(top: 10,left: 10,right: 10),
          onTap: (){
            setState(() {

            });

          },

          title: Text(widget.item.name),
          //isThreeLine: true,
          subtitle: Text(widget.item.desc),
          trailing: Text(
            "\$${widget.item.price}",
              style: Theme.of(context).textTheme.headline6,
          ),
        ),
      ),
    );
  }
}



