@IsTest
public class CasePriorityServiceTest {

    @IsTest
    static void testUpdateCasePriority_allScenarios() {

        List<Case> cases = new List<Case>{
            new Case(Subject = 'Phone Case', Origin = 'Phone'),
            new Case(Subject = 'Email Case', Origin = 'Email'),
            new Case(Subject = 'Web Case', Origin = 'Web')
        };
        insert cases;

        Test.startTest();
        CasePriorityService.updateCasePriority(cases);
        Test.stopTest();

        List<Case> updatedCases = [
            SELECT Origin, Priority
            FROM Case
            WHERE Id IN :cases
        ];

        for (Case c : updatedCases) {
            if (c.Origin == 'Phone') {
                System.assertEquals('High', c.Priority);
            }
            else if (c.Origin == 'Email') {
                System.assertEquals('Medium', c.Priority);
            }
            else if (c.Origin == 'Web') {
                System.assertEquals('Low', c.Priority);
            }
        }
    }

    @IsTest
    static void testUpdateCasePriority_emptyList() {

        Test.startTest();
        CasePriorityService.updateCasePriority(new List<Case>());
        Test.stopTest();

        System.assert(true, 'Handled empty list correctly');
    }
}