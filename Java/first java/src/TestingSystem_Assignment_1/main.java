package TestingSystem_Assignment_1;


import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Date;

public class main {
    private static Group Group1;
    private static Group Group2;
    private static Group Group3;

    public static void main(String[] args){
        //tạo department 1
        Department department1 = new Department();
        department1.departmentId=1;
        department1.departmentName = "Sale";

        // tạo department 2
        Department department2 = new Department();
        department2.departmentId=2;
        department2.departmentName="marketting";

        // tạo department 3
        Department department3 = new Department();
        department3.departmentId=3;
        department3.departmentName = "Bảo vệ";

        // tạo position 1
        Position position1 = new Position();
        position1.positionId=1;
        position1.positionName = PositionName.Dev;

        // tạo position 2
        Position position2 = new Position();
        position2.positionId=2;
        position2.positionName = PositionName.ScrumMaster;

        // tạo position 3
        Position position3 = new Position();
        position3.positionId=1;
        position3.positionName = PositionName.PM;

        // tạo group 1
        Group group1 = new Group();
        group1.groupId=1;
        group1.groupName="Group1";
        group1.createDate = new Date(2021, 5,17);

        // tạo group 2
        Group group2 = new Group();
        group2.groupId=2;
        group2.groupName="Group2";
        group2.createDate = new Date(2021, 4, 16);
        
        // tạo group 3
        Group group3 = new Group();
        group3.groupId=3;
        group3.groupName="Group3";
        group3.createDate = new Date(2021, 5,15);


        //tạo account 1
        Account account1 = new Account();
        account1.accountId=1;
        account1.email="thai123@gmai.com";
        account1.userName="thai1234";
        account1.fullName="Trần Danh Thái";
        account1.department = department2;
        account1.position = position1;
        Group[] groupsOfAccount1 = {Group1,Group2};
        account1.groups = groupsOfAccount1;
        account1.createDate = new Date(2021,5,16);

        //tạo account 2
        Account account2 = new Account();
        account2.accountId=2;
        account2.email="thai123@gmai.com";
        account2.userName="thai1234";
        account2.fullName="Trần Danh Thái";
        account2.department = department3;
        account2.position = position2;
        account2.groups = new Group[]{Group2,Group3};
        account2.createDate = new Date(2021, 3,14);

        //tạo account 3
        Account account3 = new Account();
        account3.accountId=3;
        account3.email="thai123@gmai.com";
        account3.userName="thai1234";
        account3.fullName="Trần Danh Thái";
        account3.department = department2;
        account3.position = position3;
        Group[] groupsOfAccount3 = {Group1,Group3};
        account3.groups = groupsOfAccount1;
        account3.createDate = new Date(2021,4,10);

        // tạo TypeQuestion1
        TypeQuestion typeQuestion1 = new TypeQuestion();
        typeQuestion1.typeId=1;
        typeQuestion1.typeName = TypeName.ESSAY ;

        // tạo TypeQuestion2
        TypeQuestion typeQuestion2 = new TypeQuestion();
        typeQuestion2.typeId=2;
        typeQuestion2.typeName = TypeName.MULTIPLE_CHOICE;

        // tạo TypeQuestion3
        TypeQuestion typeQuestion3 = new TypeQuestion();
        typeQuestion3.typeId=3;
        typeQuestion3.typeName = TypeName.ESSAY ;

        //tạo CategoryQuestion1
        CategoryQuestion categoryQuestion1 = new CategoryQuestion();
        categoryQuestion1.categoryId=1;
        categoryQuestion1.categoryName ="Java";

        //tạo CategoryQuestion2
        CategoryQuestion categoryQuestion2 = new CategoryQuestion();
        categoryQuestion2.categoryId=2;
        categoryQuestion2.categoryName ="Postman";

        //tạo CategoryQuestion3
        CategoryQuestion categoryQuestion3 = new CategoryQuestion();
        categoryQuestion3.categoryId=3;
        categoryQuestion3.categoryName ="Ruby";

        // tạo Question1
        Question question1 = new Question();
        question1.questionId =1;
        question1.content="Câu hỏi về Postman ";
        question1.categoryQuestion=categoryQuestion2;
        question1.typeQuestion = typeQuestion3;
        question1.account=account1;
        question1.createDate = new Date(2021, 8,15 );

        // tạo Question2
        Question question2 = new Question();
        question2.questionId =2;
        question2.content="NCâu hỏi về Java ";
        question2.categoryQuestion=categoryQuestion1;
        question2.typeQuestion = typeQuestion2;
        question2.account=account2;
        question2.createDate = new Date(2021, 8,16);

        // tạo Question3
        Question question3 = new Question();
        question3.questionId =3;
        question3.content="Câu hỏi về Ruby ";
        question3.categoryQuestion=categoryQuestion3;
        question3.typeQuestion = typeQuestion1;
        question3.account=account3;
        question3.createDate = new Date(2021,8,16);

        // tạo Answer1
        Answer answer1 = new Answer();
        answer1.answerId=1;
        answer1.content = "nội dung của câu trả lời 1";
        answer1.question = question1;
        answer1.isCorrect = Boolean.TRUE;

        // tạo Answer2
        Answer answer2 = new Answer();
        answer2.answerId=2;
        answer2.content = "nội dung của câu trả lời 2";
        answer2.question = question2;
        answer2.isCorrect =Boolean.FALSE;

        // tạo Answer3
        Answer answer3 = new Answer();
        answer3.answerId=3;
        answer3.content = "nội dung của câu trả lời 3";
        answer3.question = question3;
        answer3.isCorrect =Boolean.TRUE;

        // tạo Exam1
        Exam exam1 = new Exam();
        exam1.examId=1;
        exam1.code= "V001";
        exam1.title= "Câu hỏi về Java";
        exam1.categoryQuestion=categoryQuestion1;
        exam1.duration = LocalTime.of(1, 20, 30);
        exam1.account = account1;
        exam1.createDate = LocalDate.now();

        // tạo Exam2
        Exam exam2 = new Exam();
        exam2.examId=2;
        exam2.code= "V0012";
        exam2.title= "Câu hỏi về postman";
        exam2.categoryQuestion=categoryQuestion2;
        exam2.duration = LocalTime.of(1, 1, 1);
        exam2.account = account2;
        exam2.createDate = LocalDate.now();

        // tạo Exam3
        Exam exam3 = new Exam();
        exam3.examId=3;
        exam3.code= "V003";
        exam3.title= "Câu hỏi về RuBy";
        exam3.categoryQuestion=categoryQuestion3;
        exam3.duration = LocalTime.of(1, 1, 1);
        exam3.account = account3;
        exam3.createDate = LocalDate.now();



        // in ra department
        System.out.println("Thông tin department 1 :");
        System.out.println(" ID:" + department1.departmentId);
        System.out.println(" Tên Phòng Ban:" + department1.departmentName);

        // in ra Position
        System.out.println("Thông tin Position 1 :");
        System.out.println(" ID:" + position1.positionId);
        System.out.println(" Tên Chức Vụ:" + department1.departmentName);

        // in ra Group 1
        System.out.println("Thông tin Group 1 :");
        System.out.println(" ID:" + group1.groupId);
        System.out.println(" Tên Nhóm :" + group1.groupName);
        System.out.println(" Ngày tạo:" + group1.createDate);

        // in ra account 1
        System.out.println("Thông tin account 1 :");
        System.out.println(" ID:" + account1.accountId);
        System.out.println(" Tên :" + account1.email );
        System.out.println(" Ngày tạo:" + account1.userName);
        System.out.println(" Ngày tạo:" + account1.fullName);
        System.out.println(" Ngày tạo:" + account1.department);
        System.out.println(" Ngày tạo:" + account1.position);
        System.out.println(" Ngày tạo:" + account1.createDate);

        // in ra TypeQuestion1
        System.out.println("Thông tin TypeQuestion 1 :");
        System.out.println(" ID:" + typeQuestion1.typeId);
        System.out.println(" Tên câu Hỏi:" + typeQuestion1.typeName );

        // in ra CategoryQuestion1
        System.out.println("Thông tin CategoryQuestion 1 :");
        System.out.println(" ID:" + categoryQuestion1.categoryId);
        System.out.println(" Chủ đề câu hỏi :" + categoryQuestion1.categoryName);

        // in ra Question1
        System.out.println("Thông tin Question 1 :");
        System.out.println(" ID:" + question1.questionId);
        System.out.println(" ND câu hỏi :" + question1.content);
        System.out.println(" chủ đề :" + question1.categoryQuestion);
        System.out.println(" loại câu hỏi :" + question1.typeQuestion);
        System.out.println(" người tạo câu hỏi :" + question1.account);
        System.out.println(" ngày tạo câu hỏi :" + question1.createDate);

        // in ra Answer1
        System.out.println("Thông tin Answer 1 :");
        System.out.println(" ID:" + answer1.answerId);
        System.out.println(" ND câu trả lời :" + answer1.content);
        System.out.println(" định danh câu hỏi:" + answer1.question);
        System.out.println(" Đúng/ sai :" + answer1.isCorrect);

        // in ra exam1
        System.out.println("Thông tin exam 1 :");
        System.out.println(" ID:" + exam1.examId);
        System.out.println(" mã đề:" + exam1.code);
        System.out.println(" Tiêu đề:" + exam1.title);
        System.out.println(" Chủ đề :" + exam1.categoryQuestion);
        System.out.println(" thời gian :" + exam1.duration);
        System.out.println(" ID người tạo :" + exam1.account);
        System.out.println(" Ngày tạo :" + exam1.createDate);

    }
}
