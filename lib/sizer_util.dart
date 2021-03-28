import 'package:flutter/material.dart';

class SizerUtil {
  static late double _width;
  static late double _height;
  static Orientation? _orientation;
  static DeviceType? _deviceType;

  void init(BoxConstraints constraints, Orientation orientation) {
    //use constraints object for maxWidth and maxHeight of device screen

    _orientation = orientation;
    if (orientation == Orientation.portrait) {
      _width = constraints.maxWidth;
      _height = constraints.maxHeight;
    } else {
      _width = constraints.maxHeight;
      _height = constraints.maxWidth;
    }

    if (_width <= 480) {
      _deviceType = DeviceType.Mobile;
    } else if (_width <= 768) {
      _deviceType = DeviceType.Tablet;
    } else if (_width <= 1200) {
      _deviceType = DeviceType.Desktop;
    }
  }

  //If you want to set height 50% of screen height then follow this method
  // screenHeight * yourInput /100;
  static height(var i) {
    return _height * i / 100;
  }

  //If you want to set width 50% of screen width then follow this method
  // screenWidth * yourInput /100;
  static width(var i) {
    return _width * i / 100;
  }

  //If you want to set textSize 50% of screen width then follow this method
  // screenWidth * yourInput /1000;
  static sp(var i) {
    return _width / 100 * (i / 3);
  }

  static get orientation => _orientation;

  static get deviceType => _deviceType;
}

enum DeviceType {
  Mobile,
  Tablet,
  Desktop,
}
