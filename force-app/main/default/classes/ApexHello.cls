public class ApexHello {
    public static String helloSalesforce(String a, String b){
        String c = a + ' ' + b;
        return c;
    }
    public static Integer addNum(Integer x, Integer y){
        Integer z = x+y;
        return z;
    }
    public static String hello(String x, String y){
        String v = x+y;
        System.debug('HELLO WORLD');

        return v;
    }
    
}