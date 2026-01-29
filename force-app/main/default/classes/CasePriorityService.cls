public with sharing class CasePriorityService {

    public static void updateCasePriority(List<Case> caseList) {

        if (caseList == null || caseList.isEmpty()) {
            return;
        }

        for (Case c : caseList) {

            if (c.Origin == 'Phone') {
                c.Priority = 'High';

            } else if (c.Origin == 'Email') {
                c.Priority = 'Medium';

            } else if (c.Origin == 'Web') {
                c.Priority = 'Low';
            }
        }

        update caseList;
    }
}