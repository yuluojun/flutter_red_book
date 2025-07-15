class BannerListData {
/*
{
  "id": "201",
  "catid": "13",
  "title": "轮播图2",
  "thumb": "https://img.flutterschool.cn/202405/1f4de393a45f202.png",
  "description": "轮播图1",
  "hits": "4921",
  "count": "2785",
  "author": "",
  "videourl": "",
  "head": "",
  "vid": "轮播图2"
}
*/

  String? id;
  String? catid;
  String? title;
  String? thumb;
  String? description;
  String? hits;
  String? count;
  String? author;
  String? videourl;
  String? head;
  String? vid;

  BannerListData({
    this.id,
    this.catid,
    this.title,
    this.thumb,
    this.description,
    this.hits,
    this.count,
    this.author,
    this.videourl,
    this.head,
    this.vid,
  });

  BannerListData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    catid = json['catid']?.toString();
    title = json['title']?.toString();
    thumb = json['thumb']?.toString();
    description = json['description']?.toString();
    hits = json['hits']?.toString();
    count = json['count']?.toString();
    author = json['author']?.toString();
    videourl = json['videourl']?.toString();
    head = json['head']?.toString();
    vid = json['vid']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['catid'] = catid;
    data['title'] = title;
    data['thumb'] = thumb;
    data['description'] = description;
    data['hits'] = hits;
    data['count'] = count;
    data['author'] = author;
    data['videourl'] = videourl;
    data['head'] = head;
    data['vid'] = vid;
    return data;
  }
}

class BannerList {
/*
{
  "code": 1,
  "msg": "此接口由flutterschool.cn提供，当前是get请求",
  "data": [
    {
      "id": "201",
      "catid": "13",
      "title": "轮播图2",
      "thumb": "https://img.flutterschool.cn/202405/1f4de393a45f202.png",
      "description": "轮播图1",
      "hits": "4921",
      "count": "2785",
      "author": "",
      "videourl": "",
      "head": "",
      "vid": "轮播图2"
    }
  ]
}
*/

  int? code;
  String? msg;
  List<BannerListData>? data;

  BannerList({
    this.code,
    this.msg,
    this.data,
  });

  BannerList.fromJson(Map<String, dynamic> json) {
    code = json['code']?.toInt();
    msg = json['msg']?.toString();
    if (json['data'] != null) {
      final v = json['data'];
      final arr0 = <BannerListData>[];
      v.forEach((v) {
        arr0.add(BannerListData.fromJson(v));
      });
      data = arr0;
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['code'] = code;
    data['msg'] = msg;
    if (this.data != null) {
      final v = this.data;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v.toJson());
      }
      data['data'] = arr0;
    }
    return data;
  }
}
