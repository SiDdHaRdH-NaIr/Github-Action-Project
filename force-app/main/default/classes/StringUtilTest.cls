@IsTest
public class StringUtilTest {

    @IsTest
    static void testToUpperCase() {
        String result = StringUtil.toUpperCase('salesforce');
        System.assertEquals('SALESFORCE', result);
    }
}