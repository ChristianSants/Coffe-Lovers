import 'package:flutter/material.dart';

class CafeCard extends StatelessWidget {
  final String nome;
  final String nota;
  final String tipo;
  //final bool favorito;
  CafeCard({
    required this.nome,
    required this.nota,
    required this.tipo,
    //required this.favorito,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: 180,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            offset: Offset(
              0.0,
              10.0,
            ),
            blurRadius: 10.0,
            spreadRadius: -6.0,
          ),
        ],
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.35),
            BlendMode.multiply,
          ),
          image: NetworkImage(
              'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxIPDxUPEhIVFRUVFRUVFRUVFRUVFRUVFRUWFhUVFRUYHSggGBolHRUVITEhJSkrLi4uFx8zODMtNygtLisBCgoKBQUFDgUFDisZExkrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrK//AABEIALcBEwMBIgACEQEDEQH/xAAYAAEBAQEBAAAAAAAAAAAAAAAAAQIDB//EABYQAQEBAAAAAAAAAAAAAAAAAAARAf/EABQBAQAAAAAAAAAAAAAAAAAAAAD/xAAUEQEAAAAAAAAAAAAAAAAAAAAA/9oADAMBAAIRAxEAPwD2MIAAoIpCAAAgoAACCgIKAgoCQUBBQEAACAEFQAABFQAAAAGgQFAAAAFAQ1QEFASCoAKAgqACoAAAAAEAAARRIAGgIAAADQEABQAAIAAAAAAAAACKAIoAgqAAAAAIoCCoAACAaAADQZoCggKAAAAAAQAAAAAEUAQAAAAoACAqKgAACKgAIApAGlRQAAAAFQAAAAAAAAABAAAAABAAKAAgKIAAgKgAAA2oAAAAAAAAAAACAAAAAAAAgAIAoIAAAaACKgAgCiAOgAKRFAAAABFEAKAAAAIAqAAgCiAKgAFAAEBUAAAEAAolAdRAFABUAFQAAAAQFEAAAEAFQACiUFCoC4gAAAIoAgAIqAlFqA6rUAUACgAboUBFEAVEBRAAAAqUBQQFRUBRAAAAE0AVAAATQABAHWggKAAAAIAogAUAAAEFoIAAAAAAIoICgRBaCAAAgAAFABsKAqACoAAICglBUABUAIAAaAAAAIClSAFABUAANARdQAKGggoDaACmgAABEAAAAAAACgAigAgAKAIoAigCGgBQAMQANKgBUAH/2Q=='),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Align(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                nome,
                style: TextStyle(
                  fontSize: 19,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
            alignment: Alignment.center,
          ),
          Align(
            // ignore: sort_child_properties_last
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 18,
                      ),
                      SizedBox(width: 7),
                      Text(nota),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.schedule,
                        color: Colors.yellow,
                        size: 18,
                      ),
                      SizedBox(width: 7),
                      Text(tipo),
                    ],
                  ),
                )
              ],
            ),
            alignment: Alignment.bottomLeft,
          ),
        ],
      ),
    );
  }
}
