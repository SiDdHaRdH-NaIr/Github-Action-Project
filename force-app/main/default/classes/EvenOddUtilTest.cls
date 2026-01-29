@IsTest
public class EvenOddUtilTest {

    @IsTest
    static void testIsEven() {
        System.assertEquals(true, EvenOddUtil.isEven(4));
        System.assertEquals(false, EvenOddUtil.isEven(5));
    }
}