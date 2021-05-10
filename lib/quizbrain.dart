import 'questions.dart';
class quiz_brain{
  int i=0;
  List<question>ql=[
    question('How many individual centuries have been scored in World Cup finals so far?','Five','Six','Seven','Eight', 2),
    question('In the 2015 World Cup final, who triggered New Zealand\'s collapse which saw them lose their last seven wickets for just 33 runs?','James Faulkner','Six','Seven','Eight', 1),
    question('How many individual centuries have been scored in World Cup finals so far?','Five','Six','Seven','Eight', 3),
    question('sadsady individual centuries have been scored in World Cup finals so far?','Five','Six','Seven','Eight', 3),
    question('How many individual centuries have been scored in World Cup finals so far?','Five','Six','Seven','Eight', 3),

  ];
  void next_question() {
    if (i < ql.length - 1) {
      i++;
    }
  }
    String get_question(){
      return ql[i].ques;
    }
    String op1(){
      return ql[i].opt1;
    }
  String op2(){
    return ql[i].opt2;
  }
  String op3(){
    return ql[i].opt3;
  }
  String op4(){
    return ql[i].opt4;
  }
    int get_answer(){
      return ql[i].ans;
    }
    bool check_finished(){
      if(i>=ql.length-1){
        return true;
      }
      else{
        return false;
      }
    }
    void reset(){
      i=0;
    }

}