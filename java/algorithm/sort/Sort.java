package sort;

/**
 * 作者：黄垚森
 * 所有排序为升序
 * 使用原生java代码书写
 */
public class Sort {

    public static void main(String[] args) {
        Integer[] int1 = {5,6,8,10,2,7,17,20,21};
        Comparable[] comparables = insertionSort(int1);
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

    /**
     * 选择排序
     * 与冒泡排序不同是优化了交换元素的次数，对于n的变大，效率没有本质提升
     * 时间复杂度O(n2)
     * @param comp
     * @return
     */
    public static Comparable[] selectionSort(Comparable[] comp){

        Comparable temp = 0;//定义临时变量

        //i从0到length-1，这个循环的目的是每次找出最小的数放在数组前部
        for (int i = 0; i < comp.length; i++) {

            int min = i;//定义下方j循环中最小元素的索引，初始化为i；

            //j从0至length-i-1，这个循环的目的是在剩余数组中找出最小值
            for (int j = i; j < comp.length; j++) {

                //如果有元素比i处元素小，替换索引值
                if ((comp[j].compareTo(comp[min]) < 0 ? true : false)){
                    min = j;
                }
            }

            //交换i与所得最小元素索引的值
            temp = comp[i];
            comp[i] = comp[min];
            comp[min] = temp;
        }
        return comp;
    }


    /**
     * 插入排序
     * 最好时间复杂度O(n),最差时间复杂度O(n2)
     * 像打牌一样把后面的牌插入前面有序的部分
     * 但是交换还是通过与冒泡类似的方式通过相邻的对比交换找到位置
     * @param comp
     * @return
     */
    public static Comparable[] insertionSort(Comparable[] comp){

        Comparable temp = 0;//定义临时变量

        //这个循环的作用是确定i之前的数组有序
        for (int i = 1; i < comp.length; i++) {

            //这个循环的作用是把i插入到前面有序的数组中
            for (int j = i; j > 0 ; j--) {

                //对比i与之前元素，通过交换排序
                if ((comp[j].compareTo(comp[j-1]) < 0? true : false)){
                    temp = comp[j];
                    comp[j] = comp[j-1];
                    comp[j-1] = temp;
                }
            }
        }
        return comp;
    }


}
