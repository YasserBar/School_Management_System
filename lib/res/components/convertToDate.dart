
import 'package:intl/intl.dart';

class ConvertToDate{
  static String formattedDate(timeStamp){
    var dateFormTime = DateTime.tryParse(timeStamp);
    return DateFormat('yyyy-MM-dd').format(dateFormTime!);
  }
}