@IsTest
public class MathUtilTest {

    @IsTest
    static void testAdd() {
        Integer result = MathUtil.add(2, 3);
        System.assertEquals(5, result);
    }
}