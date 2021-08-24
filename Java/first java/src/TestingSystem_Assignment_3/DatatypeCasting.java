package TestingSystem_Assignment_3;

import java.util.Scanner;

public class DatatypeCasting {

//    public static void main(String[] args) {
//        //Question1:
//        float account1 = 5240.5f;
//        float account2 = 10970.055f;
//        int Account1 = (int) account1;
//        int Account2 = (int) account2;
//        System.out.println("Lương account1 :" + Account1);
//        System.out.println("Lương account2 :" + Account2);
//
//        //Question 2:Lấy ngẫu nhiên 1 số có 5 chữ số (những số dưới 5 chữ số thì sẽ thêm có số 0 ở đầu cho đủ 5 chữ số)
//        int a = 0;
//        int b = 99999;
//        Random random = new Random();
//        int c = random.nextInt(99999 - 0 + 1);
//        while (c < 10000) {
//            c = c * 10;
//        }
//        System.out.println(c);
//
//        //Question 3:Lấy 2 số cuối của số ở Question 2 và in ra.
//        //Gợi ý:
//        //Cách 1: convert số có 5 chữ số ra String, sau đó lấy 2 số cuối
//        //Cách 2: chia lấy dư số đó cho 100
//        int a1 = 0;
//        int b1 = 99999;
//        Random random1 = new Random();
//        int c1 = random.nextInt(99999 - 0 + 1);
//        while (c1 < 10000) {
//            c1 = c * 10;
//        }
//        System.out.println(c1);
//        int d1 = c1 % 100;
//        System.out.println(d1);
//
//        // Question 4:
//        //Viết 1 method nhập vào 2 số nguyên a và b và trả về thương của chúng
//        int Kq = thuong(4, 2);
//        System.out.println(Kq);
//
//    }
//
//    private static int thuong(int a2, int b2) {
//        int c2 = a2 / b2;
//        return c2;
//    }
//
//    public static void main1(String[] args) {
//        // Question 2:
//        Account[] accounts = new Account[5];
//        for (int i = 0; i < accounts.length; i++) {
//            Account account = new Account();
//            account.id = i;
//            account.email = "email" + i;
//            account.username = "User name " + i;
//            account.fullname = "fullname " + i;
//            account.CreateDate = LocalDate.now();
//
//            accounts[i] = account;
//            System.out.printf("Thông tin account thứ  %d :", i + 1);
//            System.out.println("ID :" + accounts[i].id);
//            System.out.println("Email :" + accounts[i].email);
//            System.out.println("Full name :" + accounts[i].fullname);
//            System.out.println("Ngày tạo :" + accounts[i].CreateDate);
//        }
//    }

//    public static void main(String[] args) {
////        Question 1: Khởi tạo lương có datatype là Integer có giá trị bằng 5000.
////        Sau đó convert lương ra float và hiển thị lương lên màn hình (với số float có 2 số sau dấu thập phân)
//        Integer a = new Integer(5000);
//        float b=a.floatValue();
//        System.out.printf("%2.2f\n",b);
//
//        //Question 2: Khai báo 1 String có value = "1234567"
//        //Hãy convert String đó ra số int
//        String a1 = "1234567";
//        int b1= Integer.valueOf(a1);
//        System.out.println(b1);
//
//        //Question 3: Khởi tạo 1 số Integer có value là chữ "1234567"
//        //Sau đó convert số trên thành datatype int
//        Integer a3=1234567;
//        int b3 = Integer.valueOf(a3);
//        System.out.println(b3);
//    }
        public static void main(String[] args) {
            //Question 1: Nhập một xâu kí tự, đếm số lượng các từ trong xấu kí tự đó (các từ có
            //thể cách nhau bằng nhiều khoảng trắng );
//            Scanner scanner = new Scanner(System.in);
//            System.out.println("mời bạn nhập xâu kí tự :");
//            String a = scanner.nextLine();
//            String[] ar = a.split(" "); // split :tách chuỗi
//            for (String s : ar){
//                System.out.println("Số kí tự " + s.length());
//            }
//            scanner.close();

            //Question 2: Nhập hai xâu kí tự s1, s2 nối xâu kí tự s2 vào sau xâu s1;
//            Scanner scanner1 = new Scanner(System.in);
//            Scanner scanner2 = new Scanner(System.in);
//            System.out.println("mời bạn nhập xâu kí tự 1:");
//            String a1 = scanner1.next();
//            System.out.println("mời bạn nhập xâu kí tự 2:");
//            String a2 = scanner2.next();
//            System.out.println(" Nối 2 xâu kí tự :" + a1 + " " + a2);

            //Question 3:Viết chương trình để người dùng nhập vào tên và kiểm tra, nếu tên chữ
            //viết hoa chữ cái đầu thì viết hoa lên
//            Scanner scanner3 = new Scanner(System.in);
//            System.out.println("Mời nhập tên : ");
//            String a3 = scanner3.next();
//            //substring() lấy chuỗi con
//            //toUpperCase(): để in hoa phần đầu tiên rồi gộp hai phần đó lại
//            String b3 = a3.substring(0,1).toUpperCase() +a3.substring(1);
//            System.out.println(b3);

            //Question 4: Viết chương trình để người dùng nhập vào tên in từng ký tự trong tên của người dùng ra
//            Scanner scanner4 = new Scanner(System.in);
//            System.out.println("Mời nhập tên : ");
//            String a4 = scanner4.next();
//            a4 = a4.toUpperCase();
//            char c ;
//            for (int i=0;i<a4.length();i++){
//                c=a4.charAt(i); //charAt(i) : trả về 1 kí tự ở vị trí đc truyền vào
//                System.out.println( c );
//            }
            //Question 5: Viết chương trình để người dùng nhập vào họ, sau đó yêu cầu người
            //dùng nhập vào tên và hệ thống sẽ in ra họ và tên đầy đủ
//            Scanner scanner5 = new Scanner(System.in);
//            System.out.println("Mời nhập vào Họ :");
//            String họ = scanner5.next();
//            System.out.println("Mời nhập vào tên :");
//            String tên = scanner5.nextLine();
//            System.out.println("Họ và tên đầy đủ :" +họ + " " + tên);
//            System.out.println("Họ và tên đầy đủ :" + họ.concat(tên));//String.concat(String): nỗi chuỗi
//            scanner5.close();

//            Question 6:
//            Viết chương trình yêu cầu người dùng nhập vào họ và tên đầy đủ và
//            sau đó hệ thống sẽ tách ra họ, tên , tên đệm
//            Scanner scanner6 =new Scanner(System.in);
//            System.out.println("Mời nhập họ và tên đầy đủ :");
//            String hvt = scanner6.nextLine();
//            hvt = hvt.trim();//trim():Xóa dấu cách ở đầu và cuối
//            String[] a6 = hvt.split(" ");


            //Question 7:
            //Viết chương trình yêu cầu người dùng nhập vào họ và tên đầy đủ và
            //chuẩn hóa họ và tên của họ như sau:
            //a) Xóa dấu cách ở đầu và cuối và giữa của chuỗi người dùng nhập vào
            //b) Viết hoa chữ cái mỗi từ của người dùng
//            Scanner scanner7 = new Scanner(System.in);
//            System.out.println("Mời nhập họ và tên đầy đủ :");
//            String a7 = scanner7.nextLine();
//            String arr[] = a7.split(" ");

                //Question 8: In ra tất cả các group có chứa chữ "Java"
//            String[] groupname = {"java1","java2","c++","PHP" };
//            for (String groupnames : groupname){
//                // contains() : tìm kiếm chuỗi ký tự trong chuỗi này.
//                if (groupnames.contains("java")){
//                    System.out.println(groupnames);
//                }
//            }
//            Question 9:In ra tất cả các group "Java"
//            String[] groupname9 = {"java","java2","c++","PHP" };
//            for (String groupnames9 : groupname9){
//                if (groupnames9.equals("java")){
//                    System.out.println(groupnames9);
//                }
//
//            }

//Question 10 (Optional):Kiểm tra 2 chuỗi có là đảo ngược của nhau hay không. Nếu có xuất ra “OK” ngược lại “KO”.
//            Scanner scanner10 =new Scanner(System.in);
//            System.out.println("Nhập chuỗi thứ nhất :");
//            String s1= scanner10.nextLine();
//            System.out.println("Nhập chuỗi thứ hai :");
//            String s2 = scanner10.nextLine();
//            String revs1 = " ";
//            for (int i= s1.length()-1;i>=0 ;i--){
//                revs1 += s1.substring(i,i+1);
//            }
//            if(s2.equals(revs1)){
//                System.out.println("OK");
//            }else{
//                System.out.println("KO");
//            }

//            Question 11 (Optional): Count special Character
//            Tìm số lần xuất hiện ký tự "a" trong chuỗi
//            Scanner scanner11 =new Scanner(System.in);
//            System.out.println("Mời nhập chuỗi :");
//            String s11 = scanner11.nextLine();
//            int count =0;
//            for (int i=0; i< s11.length();i++){
//                if('a' == s11.charAt(i)) {
//                    count++;
//                }
//            }
//            System.out.println("số lần xuất hiện ký tự \"a\" trong chuỗi" + count);

//            Question 12 (Optional): Reverse String
//            Đảo ngược chuỗi sử dụng vòng lặp
//            Scanner scanner12 = new Scanner(System.in);
//            System.out.println("Mời nhập chuỗi :");
//            String s12 = scanner12.nextLine();
//            String rev12 = " ";
//            for (int i = s12.length()-1;i>=0;i--){
//                rev12 += s12.charAt(i);
//            }
//            System.out.println(rev12);

            //Question 13 (Optional): String not contains digit
            //Kiểm tra một chuỗi có chứa chữ số hay không, nếu có in ra false ngược lại true.
//            Scanner scanner13 = new Scanner(System.in);
//            System.out.println("Mời nhập chuỗi :");
//            String s13 = scanner13.nextLine();
//            if (s13.matches("a-zA-Z_0-9")){
//                System.out.println("False");
//            }else {
//                System.out.println("true");
//            }

//            Question 14 (Optional): Replace character
//            Cho một chuỗi str, chuyển các ký tự được chỉ định sang một ký tự khác cho trước
//            Scanner scanner14 = new Scanner(System.in);
//            System.out.println("Mời nhập chuỗi :");
//            String s14 = scanner14.nextLine();
//            // nhập kí tự muốn chuyển
//            System.out.println("Ký tự muốn chuyển :");
//            char c = scanner14.nextLine().toCharArray()[0];// chuyển mảng String sang arr và lấy phần tử thứ 0
//            // nhập kí tự sẽ chuyển
//            System.out.println("Ký tự sẽ chuyển :");
//            char c1 = scanner14.nextLine().toCharArray()[0];
//            for (int i=0;i<s14.length();i++){
//                if (s14.charAt(i) == c){
//                    s14= s14.replace(c,c1) ; //replace() : thay hế kí tự c thành c1
//                }
//            }
//            System.out.println("kí tự đã chuyển :"+s14);

            //Question 15 (Optional): Revert string by word
            //Đảo ngược các ký tự của chuỗi cách nhau bởi dấu cách mà không dùng thư viện.
//            Scanner scanner15 = new Scanner(System.in);
//            System.out.println("Mời nhập chuỗi :");
//            String s15 = scanner15.nextLine();
//            s15=s15.trim();
//            String[] arr15 = s15.split(" ");
//            for (int i=s15.length()-1;i>=0;i--){
//                System.out.println(arr15[i]);

            //Questtion 16 :Cho một chuỗi str và số nguyên n >= 0. Chia chuỗi str ra làm các phần
            //bằng nhau với n ký tự. Nếu chuỗi không chia được thì xuất ra màn hình “KO”.

            }
}
