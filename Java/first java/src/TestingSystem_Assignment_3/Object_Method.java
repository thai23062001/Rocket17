package TestingSystem_Assignment_3;

public class Object_Method {
    public static void main(String[] args) {
        Department[] departments = new Department[6];
        Department department = new Department();
        department.id=1;
        department.departmentName= "Accounting";

        Department department2 = new Department();
        department2.id=2;
        department2.departmentName= "Boss of director";

        Department department3 = new Department();
        department3.id=3;
        department3.departmentName= "Marketing";

        Department department4 = new Department();
        department4.id=4;
        department4.departmentName= "Sale";

        Department department5 = new Department();
        department5.id=5;
        department5.departmentName= "Waiting room";

        Department department6 = new Department();
        department6.id=6;
        department6.departmentName= "Phòng A";

        departments[0] = department;
        departments[1] =department2;
        departments[2] =department3;
        departments[3] =department4;
        departments[4] =department5;
        departments[5] =department6;
        //Question 1:
        System.out.println(department.toString());
        //Question 2:
        for (Department departments1 : departments)
        System.out.println(departments1.toString());
        //Question3:
        System.out.println(department.hashCode());
        //Question4:
        if (department.equals("Phòng A")){
            System.out.println("Có Phòng A");
        }else {
            System.out.println("Không Phòng A");
        }
        //Question5:
        System.out.println(department.equals(department2));
        //Question 6:
        for (int i=0;i<departments.length;i++) {
            //compareToIgnoreCase() so sánh hai chuỗi
            for (int j = 0; j < departments.length - 1; j++) {
                if (departments[i].departmentName.compareToIgnoreCase(departments[j].departmentName) < 0) {
                    Department temp = departments[i];
                    departments[i] = departments[j];
                    departments[j] = temp;
                }
            }
        }
        for (Department departmentss : departments)
            System.out.println(departmentss);
    }
}
