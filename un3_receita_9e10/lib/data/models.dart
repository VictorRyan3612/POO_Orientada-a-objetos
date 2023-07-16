class Coffee{
  String blendName, origin, variety;
  Coffee({this.blendName='', this.origin='', this.variety=''});

  Coffee.fromJson(Map<String, dynamic> json):
    blendName = json['blend_name'] ?? '',
    origin = json['origin'] ?? '',
    variety = json['variety'] ?? '';

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['blend_name'] = this.blendName;
    data['origin'] = this.origin;
    data['variety'] = this.variety;
    return data;
  }

  void copy(Map<String, dynamic> json){
    blendName = json['blend_name'] ?? blendName;
    origin = json['origin'] ?? origin;
    variety = json['variety'] ?? variety;
  }

}


class Beer{
  String name, style, ibu;
  Beer({this.name='',this.style='',this.ibu=''});

  Beer.fromJson(Map<String, dynamic> json):
    name = json['name'] ?? '',
    style = json['style'] ?? '',
    ibu = json['ibu'] ?? '';

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['style'] = this.style;
    data['ibu'] = this.ibu;
    return data;
  }

  void copy(Map<String, dynamic> json){
    name = json['name'] ?? name;
    style = json['style'] ?? style;
    ibu = json['ibu'] ?? ibu;
  }
}

class Nation{
  String nationality, capital, language;
  Nation({this.nationality='', this.capital='', this.language=''});

  Nation.fromJson(Map<String, dynamic> json):
    nationality = json['nationality'] ?? '',
    capital = json['capital'] ?? '',
    language = json['language'] ?? '';


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['nationality'] = this.nationality;
    data['capital'] = this.capital;
    data['language'] = this.language;
    return data;
  }

  void copy(Map<String, dynamic> json){
    nationality = json['nationality'] ?? nationality;
    capital = json['capital'] ?? capital;
    language = json['language'] ?? language;
  }

}


class Blood{
  String type, rh_factor, group;
  
  Blood({required this.type, required this.rh_factor, required this.group});
  
  Blood.fromJson(Map<String, dynamic> json):
    type = json['type'] ?? '',
    rh_factor = json['rh_factor'] ?? '',
    group = json['group'] ?? '';

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['type'] = this.type;
    data['rh_factor'] = this.rh_factor;
    data['group'] = this.group;
    return data;
  }

  void copy(Map<String, dynamic> json){
    type = json['type'] ?? type;
    rh_factor = json['rh_factor'] ?? rh_factor;
    group = json['group'] ?? group;
  }
}


class Device{
  String manufacturer, model, platform;
  
  Device({required this.manufacturer, required this.model, required this.platform});
  
  Device.fromJson(Map<String, dynamic> json):
    manufacturer = json['manufacturer'] ?? '',
    model = json['model'] ?? '',
    platform = json['platform'] ?? '';

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['manufacturer'] = this.manufacturer;
    data['model'] = this.model;
    data['platform'] = this.platform;
    return data;
  }

  void copy(Map<String, dynamic> json){
    manufacturer = json['manufacturer'] ?? manufacturer;
    model = json['model'] ?? model;
    platform = json['platform'] ?? platform;
  }
}
