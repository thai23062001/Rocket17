package TestingSystem_Assignment_1;

import java.time.LocalDate;
import java.time.LocalTime;

public class Exam {
    int examId;
    String code;
    String title;
    CategoryQuestion categoryQuestion;
    LocalTime duration;
    Account account;
    LocalDate createDate;
    Question[] questions;

}
