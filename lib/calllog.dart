import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CallLogs{

  void call(String text) async{
    bool? res = await FlutterPhoneDirectCaller.callNumber(text);
  }

  getAvator(CallType callType){
    switch(callType){
      case CallType.outgoing:
        return Icon(Icons.add_ic_call_outlined,color: Colors.greenAccent,);
      case CallType.missed:
        return Icon(Icons.phone_callback,color: Colors.redAccent,);
      default:
        return Icon(Icons.call,color: Colors.blueGrey,);
    }
  }

  Future<Iterable<CallLogEntry>> getCallLogs(){
    return CallLog.get();
  }
  String formatDate(DateTime dt){

    return DateFormat('d-MMM-y H:m:s').format(dt);
  }

  getTitle(CallLogEntry entry){

    if(entry.name == null) {
      return Text(entry.number!);
    }
    if(entry.name!.isEmpty) {
      return Text(entry.number!);
    } else {
      return Text(entry.name!);
    }
  }

  getSim(CallLogEntry entry){

    if(entry.simDisplayName == null) {
      return Text(entry.simDisplayName!);
    }
    if(entry.simDisplayName!.isEmpty) {
      return Text(entry.simDisplayName!);
    } else {
      return Text(entry.simDisplayName!);
    }
  }

  String getTime(int duration){
    Duration d1 = Duration(seconds: duration);
    String formatedDuration = "";
    if(d1.inHours > 0){
      formatedDuration += d1.inHours.toString() + "h ";
    }
    if(d1.inMinutes > 0){
      formatedDuration += d1.inMinutes.toString() + "m ";
    }
    if(d1.inSeconds > 0){
      formatedDuration += d1.inSeconds.toString() + "s";
    }
    if(formatedDuration.isEmpty) {
      return "0s";
    }
    return formatedDuration;
  }

}