import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations{

  @override
  Map<String, Map<String, String>> get keys => {
    'en_US' : {
      'internet_exception' : "We're unable to show results. \n Please check your data \n connection", 
      'general_exception' : "We're unable to process your request. \n Please try again",
      'welcome_back' : 'Welcome \n Back',
      'innovabe_solutions' : 'INNOVABE \n SOLUTIONS',
      'name' : 'Name',
      'login' : 'Login',
      'register' : 'Register',
      'email_hint' : 'Email',
      'password_hint' : 'Password',
    },
    'ur_PK' : {
      'internet_exception' : "ہم نتائج دکھانے سے قاصر ہیں۔ \n براہ کرم اپنا ڈیٹا \n کنیکشن چیک کریں",
      'general_exception' : "ہم آپ کی درخواست پر کارروائی نہیں کر سکے۔ \n براہ کرم دوبارہ کوشش کریں",
      'welcome_back' : 'خوش آمدید \n واپس',
      'innovabe_solutions' : 'انوویب \n سولوشنز',
      'login' : 'لاگ ان',
      'email_hint' : 'ای میل درج کریں',
      'password_hint' : 'پاس ورڈ',      
    }
  };

}