import 'interest_model.dart';

class InterestResponse {
  String message;
  Result result;
  int status;

  InterestResponse({this.message, this.result, this.status});

  InterestResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Result {
  Years years;
  Interest interest;
  SearchMonth searchMonth;

  Result({this.years, this.interest, this.searchMonth});

  Result.fromJson(Map<String, dynamic> json) {
    years = json['years'] != null ? new Years.fromJson(json['years']) : null;
    interest = json['interest'] != null
        ? new Interest.fromJson(json['interest'])
        : null;
    searchMonth = json['searchMonth'] != null
        ? new SearchMonth.fromJson(json['searchMonth'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.years != null) {
      data['years'] = this.years.toJson();
    }
    if (this.interest != null) {
      data['interest'] = this.interest.toJson();
    }
    if (this.searchMonth != null) {
      data['searchMonth'] = this.searchMonth.toJson();
    }
    return data;
  }
}

class Years {
  List<String> aYearRange;

  Years({this.aYearRange});

  Years.fromJson(Map<String, dynamic> json) {
    aYearRange = json['aYearRange'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aYearRange'] = this.aYearRange;
    return data;
  }
}

class Interest {
  List<InterestModel> thisYear;
 
  String startYear;
  String endYear;

  Interest({this.thisYear, this.startYear, this.endYear});

  Interest.fromJson(Map<String, dynamic> json) {
    if (json['thisYear'] != null) {
      thisYear = new List<InterestModel>();
      json['thisYear'].forEach((v) {
        thisYear.add(new InterestModel.fromJson(v));
      });
    }
   
    startYear = json['startYear'];
    endYear = json['endYear'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.thisYear != null) {
      data['thisYear'] = this.thisYear.map((v) => v.toJson()).toList();
    }
    
    data['startYear'] = this.startYear;
    data['endYear'] = this.endYear;
    return data;
  }
}