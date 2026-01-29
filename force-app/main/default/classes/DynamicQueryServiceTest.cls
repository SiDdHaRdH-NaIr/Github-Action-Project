@IsTest
public class DynamicQueryServiceTest {

    @TestSetup
    static void setupData() {
        List<Account> accList = new List<Account>();

        for (Integer i = 0; i < 5; i++) {
            accList.add(new Account(
                Name = 'Test Account ' + i
            ));
        }
        insert accList;
    }

    @IsTest
    static void testFetchRecords_success() {
        Test.startTest();

        List<String> fields = new List<String>{ 'Id', 'Name' };

        List<SObject> results = DynamicQueryService.fetchRecords(
            'Account',
            fields,
            3
        );

        Test.stopTest();

        System.assertEquals(3, results.size(), 'Should return 3 records');
        System.assertNotEquals(null, results[0].get('Name'));
    }

    @IsTest
    static void testFetchRecords_blankObjectName() {
        Test.startTest();

        List<SObject> results = DynamicQueryService.fetchRecords(
            '',
            new List<String>{ 'Id' },
            5
        );

        Test.stopTest();

        System.assertEquals(0, results.size(), 'Should return empty list');
    }

    @IsTest
    static void testFetchRecords_emptyFieldList() {
        Test.startTest();

        List<SObject> results = DynamicQueryService.fetchRecords(
            'Account',
            new List<String>(),
            5
        );

        Test.stopTest();

        System.assertEquals(0, results.size(), 'Should return empty list');
    }
}