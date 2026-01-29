public with sharing class OpportunityStageProbabilityService {

    public static void updateProbability(List<Opportunity> oppList) {

        if (oppList == null || oppList.isEmpty()) {
            return;
        }

        for (Opportunity opp : oppList) {

            if (opp.StageName == 'Prospecting') {
                opp.Probability = 10;

            } else if (opp.StageName == 'Qualification') {
                opp.Probability = 30;

            } else if (opp.StageName == 'Proposal/Price Quote') {
                opp.Probability = 60;

            } else if (opp.StageName == 'Closed Won') {
                opp.Probability = 100;

            } else if (opp.StageName == 'Closed Lost') {
                opp.Probability = 0;
            }
        }

        update oppList;
    }
}