

class Masa {
  int id;
  String masaAdi;
  String masaUrunler;
  String _status;

  Masa.withId(int id,String masaAdi,String masaUrunler){
    this.id = id;
    this.masaAdi = masaAdi;
    this.masaUrunler = masaUrunler;
  }
  Masa(String firstName,String lastName,int grade){

    this.masaAdi = masaAdi;
    this.masaUrunler = masaUrunler;
  }

  Masa.withoutInfo(){
  }
  String get getMasaUrunler{
    return this.masaUrunler;
  }

  void set setMasaUrunler(String value) {

    this.masaUrunler = value;
  }

  String get getStatus{
    if (this.masaUrunler != null) {
     return "Masa Dolu";
    }
    else {
      return "Masa Boş";
    }
  }
}