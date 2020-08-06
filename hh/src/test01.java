public class test01 {
    public static void main(String[] args) {

        for (int i = 0; i < 2; i++) {
            for (int j = 0; j < 16; j++) {
                if (i==0){
                    if((j+1)%2==1){
                        System.out.print("N"+(2+j)/2+" ");
                    }else{
                        System.out.print(0+" ");
                    }
                }

                if (i==1){
                    if((j+1)%2==0){
                        System.out.print("N"+(1+j)/2+" ");
                    }else{
                        System.out.print(0+" ");
                    }
                }
            }
            System.out.println();
        }

    }
}
