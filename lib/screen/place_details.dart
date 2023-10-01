import 'package:favourite_place/model/place.dart';
import 'package:flutter/material.dart';

class PlaceDetails extends StatelessWidget {
  const PlaceDetails({super.key,required this.place});
  final Place place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
      ),
      body: Stack(
          children: [
            Container(
              padding:const EdgeInsets.all(8),
              width: double.infinity,
              height:MediaQuery.of(context).size.height/2 ,
              decoration:BoxDecoration(
                borderRadius:BorderRadius.circular(8)
              ),
              child: Card(
                elevation: 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.file(
                    place.image,
                    fit: BoxFit.cover,
                    ),
                ),
                  
              ),
            ),
            
          ],
      )
    );
  }
}
