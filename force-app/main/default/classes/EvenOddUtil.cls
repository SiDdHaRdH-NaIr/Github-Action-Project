public class EvenOddUtil {

    public static Boolean isEven(Integer value) {
        return Math.mod(value, 2) == 0;
    }
}