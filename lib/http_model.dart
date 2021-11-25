class Post {
  Post({
    required this.clients,
  });
  late final List<Clients> clients;

  Post.fromJson(Map<String, dynamic> json){
    clients = List.from(json['clients']).map((e)=>Clients.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['clients'] = clients.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Clients {
  Clients({
    required this.name,
    required this.id,
    required this.company,
    required this.orderId,
    required this.invoicepaid,
    required this.invoicePending,
  });
  late final String name;
  late final String id;
  late final String company;
  late final String orderId;
  late final String invoicepaid;
  late final String invoicePending;

  Clients.fromJson(Map<String, dynamic> json){
    name = json['name'];
    id = json['id'];
    company = json['company'];
    orderId = json['orderId'];
    invoicepaid = json['invoicepaid'];
    invoicePending = json['invoicePending'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['id'] = id;
    _data['company'] = company;
    _data['orderId'] = orderId;
    _data['invoicepaid'] = invoicepaid;
    _data['invoicePending'] = invoicePending;
    return _data;
  }
}