@IsTest
public class OpportunityStageProbabilityServiceTest {

    @IsTest
    static void testUpdateProbability_allStages() {

        List<Opportunity> oppList = new List<Opportunity>{
            new Opportunity(
                Name = 'Opp 1',
                StageName = 'Prospecting',
                CloseDate = Date.today()
            ),
            new Opportunity(
                Name = 'Opp 2',
                StageName = 'Qualification',
                CloseDate = Date.today()
            ),
            new Opportunity(
                Name = 'Opp 3',
                StageName = 'Proposal/Price Quote',
                CloseDate = Date.today()
            ),
            new Opportunity(
                Name = 'Opp 4',
                StageName = 'Closed Won',
                CloseDate = Date.today()
            ),
            new Opportunity(
                Name = 'Opp 5',
                StageName = 'Closed Lost',
                CloseDate = Date.today()
            )
        };
        insert oppList;

        Test.startTest();
        OpportunityStageProbabilityService.updateProbability(oppList);
        Test.stopTest();

        Map<String, Opportunity> oppMap = new Map<String, Opportunity>(
            [SELECT StageName, Probability FROM Opportunity WHERE Id IN :oppList]
        );

        System.assertEquals(10, oppMap.get(oppList[0].Id).Probability);
        System.assertEquals(30, oppMap.get(oppList[1].Id).Probability);
        System.assertEquals(60, oppMap.get(oppList[2].Id).Probability);
        System.assertEquals(100, oppMap.get(oppList[3].Id).Probability);
        System.assertEquals(0, oppMap.get(oppList[4].Id).Probability);
    }

    @IsTest
    static void testUpdateProbability_emptyList() {

        Test.startTest();
        OpportunityStageProbabilityService.updateProbability(
            new List<Opportunity>()
        );
        Test.stopTest();

        System.assert(true, 'Handled empty list safely');
    }
}