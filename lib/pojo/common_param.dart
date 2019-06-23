class CommonParam {
  String ver;
  String imei;
  String userID;
  String platform;
  String mid;
  String phoneModel;
  String channelID;
  String channelName;
  CommonParam();

  // CommonParam(this.ver, this.imei, this.userID, this.platform, this.mid,
  //     this.phoneModel, this.channelID, this.channelName);

  CommonParam.fromJson(Map<String, dynamic> json)
      : ver = json['ver'],
        imei = json['imei'],
        userID = json['userID'],
        platform = json['platform'],
        mid = json['mid'],
        phoneModel = json['phoneMode'],
        channelID = json['channelID'],
        channelName = json['channelName'];

  Map<String, dynamic> toJson() => {
        'ver': '$ver',
        'imei': '$imei',
        'userID': '$userID',
        'platform': '$platform',
        'mid': '$mid',
        'phoneModel': '$phoneModel',
        'channelId': '$channelID',
        'channelName': '$channelName'
      };
}
