
import 'package:universal_html/html.dart';

class CacheHelper{
   late Storage myPref;

   CacheHelper(){
    myPref = window.localStorage;
   }
   void putData({required key,required value}){
    myPref[key]=value;
   }
   dynamic getData({required key}){
    return myPref[key];
   }
   void deleteData({required key}){
    myPref.remove(key);
   }
}