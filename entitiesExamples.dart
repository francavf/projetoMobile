class Device {
  String nameDevice;
  String macAddress;
  bool state;

  Device(this.nameDevice, this.macAddress, this.state);
  void changeState() {
    if (this.state == false) {
      this.state = true;
    } else {
      this.state = false;
    }
  }
}

class LedBrightness extends Device {
  int brightness = 0;
  LedBrightness(String nameDevice, String macAddress, this.brightness)
      : super(nameDevice, macAddress, false);

  void changeBrightness(int _brightness) {
    this.brightness = _brightness;
  }
}

class Rgb extends LedBrightness {
  int red, green, blue;
  Rgb(String nameDevice, String macAddress, this.red, this.green, this.blue)
      : super(nameDevice, macAddress, 0);

  void setColor(int _red, int _green, int _blue) {
    this.red = _red;
    this.green = _green;
    this.blue = _blue;
  }
}

void main(List<String> args) {
  Rgb led = new Rgb("teste1", "blabla", 1, 2, 3);
  print("red = ${led.red} green = ${led.green} blue = ${led.blue}");

  led.setColor(10, 33, 255);

  print("red = ${led.red} green = ${led.green} blue = ${led.blue}");
}
