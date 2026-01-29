@IsTest
public class ApexHello_Test {

    @IsTest
    static void testHelloSalesforce() {
        String result = ApexHello.helloSalesforce('Hello', 'Salesforce');
        System.assertEquals('Hello Salesforce', result);
    }

    @IsTest
    static void testAddNum() {
        Integer result = ApexHello.addNum(5, 7);
        System.assertEquals(12, result);
    }
    @IsTest
    static void testhello() {
        String result = ApexHello.hello('Hello', 'Salesforce');
        System.assertEquals('HelloSalesforce', result);
    }
}