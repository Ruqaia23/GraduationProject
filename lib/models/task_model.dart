import 'package:flutter/material.dart';

class TaskModel {
  String? title;
  String? note;
  DateTime? date;
  TimeOfDay? startDate;
  TimeOfDay? endDate;
  int? remind;
  double? latitude;
  double? longitude;

  TaskModel({
    this.title,
    this.note,
    this.date,
    this.startDate,
    this.endDate,
    this.remind,
    this.latitude,
    this.longitude,
  });

  TaskModel.fromJson(Map<dynamic, dynamic> json) {
    title = json['title'];
    note = json['note'];
    date = json['date'];
    startDate = TimeOfDay.fromDateTime(json['start_date']);
    endDate = TimeOfDay.fromDateTime(json['end_date']);
    remind = json['remind'];
     latitude = json['latitude']; 
    longitude = json['longitude']; 
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['title'] = title;
    data['note'] = note;
    data['date'] = date;
    data['start_date'] = DateTime.now().copyWith(
      hour: startDate!.hour,
      minute: startDate!.minute,
    );
    data['end_date'] = DateTime.now().copyWith(
      hour: endDate!.hour,
      minute: endDate!.minute,
    );
    data['remind'] = remind;
     data['latitude'] = latitude; 
    data['longitude'] = longitude; 

    return data;
    
    
  }
}
