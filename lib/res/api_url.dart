class EndPointGuest{
  // Emulation => _url = 'http://10.0.2.2:8000/api/'

  // physic device => _url = '/// IP PC on LAN /// + :8000/api/'
  
  static const baseUrl = 'http://192.168.43.93:8000/api/';

  static const loginEmployee = 'employee/login';
  static const logoutEmployee = 'employee/logout';

  static const loginStudent = 'student/login';
  static const logoutStudent = 'student/logout';

  static const affiliationEmployee = 'affiliation_request_employee';
  static const affiliationStudent = 'affiliation_request_student';  
}

const master ='master/';
const teacher ='teacher/';
const student ='student/';

class EndPointMaster{

  static const getClassByname = '${master}get_Class_Byname';
  static const getClassById = '${master}get_Class_By_Id';
  static const getClassesBylevel = '${master}get_Classes_By_level';
  static const getMyClasses = '${master}get_My_Classes';
  static const setMarkForClass = '${master}set_Mark_For_Class';
  static const getStudentByname = '${master}get_Student_By_name';
  static const getTeacherByname = '${master}get_Teacher_Byname';
  static const setNoteStudent = '${master}set_Note_Student';
  static const setNoteClass = '${master}set_Note_Class';
  static const addImageProgramClass = '${master}add_Image_Program_Class';
  static const addFileToClass = '${master}add_File_To_Class';
  static const setAbsenceOrLateSt = '${master}set_Absence_Or_Late_St';
  static const setAbsenceOrLateEm = '${master}set_Absence_Or_Late_Em';
  static const getSubjects = '${master}get_subjects';
  static const getExams = '${master}get_Type_Exam';

}


class EndPointTeacher{

  static const getClassByname = '${teacher}get_Class_Byname';
  static const getClassesBylevel = '${teacher}get_Classes_By_level';
  static const getClassById = '${teacher}get_Class_By_Id';
  static const getMyClasses = '${teacher}get_My_Classes';
  static const setValuation = '${teacher}set_Valuation';
  static const getStudentByname = '${teacher}get_Student_By_name';
  static const setNoteStudent = '${teacher}set_Note_Student';
  static const setNoteClass = '${teacher}set_Note_Class';
  static const getLectures = '${teacher}get_lectures';
  static const getAbsenceOrLate = '${teacher}get_Absence_Or_Late';
  static const addFileToClass = '${teacher}add_File_To_Class';
  static const getTimeTable = '${teacher}get_Time_Table';
  static const getMySubject = '${teacher}get_My_subject';

}


class EndPointStudent{

  static const getMarks = '${student}get_Mark';
  static const getNoteStudent = '${student}get_Note_Student';
  static const getNoteClass = '${student}get_Note_Class';
  static const getValuation = '${student}get_Valuation';
  static const getAbsenceOrLate = '${student}get_Absence_Or_Late';
  static const profile = '${student}profile';
  static const setImageProfile = '${student}set_Image_Profile';
  static const getImageProfile = '${student}get_Image_Profile';
  static const getTimeTable = '${student}get_Time_Table';
  static const getMyFile = '${student}get_My_File';
  static const getFile = '${student}get_File';

}