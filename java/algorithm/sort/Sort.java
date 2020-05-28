package sort;

public class Sort {

    public static void main(String[] args) {
        Integer[] int1 = {5,6,8,7,6,8,5,4};
        Comparable[] comparables = bubbleSort(int1);
        for (Comparable comparable : comparables) {
            System.out.println(comparable);
        }

    }

    /**
     * 冒泡排序
     * 每次对比相邻元素，把较大的数交换到后面
     * 最好时间复杂度O(n),最差时间复杂度O(n2)
     * @param comp
     * @return
     */
    public static Comparable[] bubbleSort(Comparable[] comp){

        Comparable temp = 0;//定义临时变量

        //i从0到length-1，这个循环的目的是每次找出最大的数放在数组末尾
        for (int i = 0; i < comp.length; i++) {
            //j从0至length-i-1，这个循环的目的是在剩余数组中找出最大值
            for (int j = 0; j < comp.length-i-1; j++) {
                if ((comp[j].compareTo(comp[j+1])) > 0 ? true : false){
                    //如果前一个元素大于后一个元素，交换两个元素
                    temp = comp[j];
                    comp[j] = comp[j+1];
                    comp[j+1] = temp;
                }
            }
        }

        return comp;
    }
}
