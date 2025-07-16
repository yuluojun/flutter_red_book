class VideoModelData {
/*
{
  "id": "192",
  "catid": "12",
  "title": "三步学会背后运球",
  "thumb": "https://img.flutterschool.cn/202404/90d3ba804d261a6.jpg",
  "description": "三步学会背后运球",
  "hits": 16054,
  "count": "9811",
  "author": "背后运球",
  "videourl": "https://mall.flutterschool.cn/uploadfile/202404/a09f6916dbd77.mp4",
  "head": "https://img.flutterschool.cn/202404/adc93e0b073dd71.jpg"
}
*/

  String? id;
  String? catid;
  String? title;
  String? thumb;
  String? description;
  int? hits;
  String? count;
  String? author;
  String? videourl;
  String? head;

  VideoModelData({
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
  });

  VideoModelData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    catid = json['catid']?.toString();
    title = json['title']?.toString();
    thumb = json['thumb']?.toString();
    description = json['description']?.toString();
    hits = json['hits']?.toInt();
    count = json['count']?.toString();
    author = json['author']?.toString();
    videourl = json['videourl']?.toString();
    head = json['head']?.toString();
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
    return data;
  }
}

class VideoModel {
/*
{
  "code": 1,
  "msg": "此接口由flutterschool.cn提供，当前是get请求",
  "data": {
    "id": "192",
    "catid": "12",
    "title": "三步学会背后运球",
    "thumb": "https://img.flutterschool.cn/202404/90d3ba804d261a6.jpg",
    "description": "三步学会背后运球",
    "hits": 16054,
    "count": "9811",
    "author": "背后运球",
    "videourl": "https://mall.flutterschool.cn/uploadfile/202404/a09f6916dbd77.mp4",
    "head": "https://img.flutterschool.cn/202404/adc93e0b073dd71.jpg"
  }
}
*/

  int? code;
  String? msg;
  VideoModelData? data;

  VideoModel({
    this.code,
    this.msg,
    this.data,
  });

  VideoModel.fromJson(Map<String, dynamic> json) {
    code = json['code']?.toInt();
    msg = json['msg']?.toString();
    data =
        (json['data'] != null) ? VideoModelData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['code'] = code;
    data['msg'] = msg;
    if (data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
