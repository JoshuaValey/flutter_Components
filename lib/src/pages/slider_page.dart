import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sliders'),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            children: <Widget>[
              _crearSlider(),
              Expanded(child: _crearImagen()),
            ],
          ),
        ));
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño del Slider',
      //divisions: 20,
      value: _valorSlider,
      min: 100.0,
      max: 200.0,
      onChanged: (valor) {
        setState(() {
          _valorSlider = valor;
        });
      },
    );
  }

  Widget _crearImagen() {
    return Image(
      width: _valorSlider,
      fit: BoxFit.contain,
      image: NetworkImage(
          'https://prodimage.images-bn.com/pimages/9781975328146_p0_v1_s550x406.jpg'),
    );
  }
}
