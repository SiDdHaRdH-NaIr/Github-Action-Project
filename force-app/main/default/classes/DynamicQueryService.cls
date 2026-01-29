public with sharing class DynamicQueryService {

    /**
     * Generic method to fetch records dynamically
     */
    public static List<SObject> fetchRecords(
        String objectName,
        List<String> fieldNames,
        Integer recordLimit
    ) {
        // Basic validations
        if (String.isBlank(objectName) || fieldNames == null || fieldNames.isEmpty()) {
            return new List<SObject>();
        }

        // Build dynamic SOQL
        String soql = 'SELECT ' + String.join(fieldNames, ',') +
                      ' FROM ' + objectName +
                      ' LIMIT :recordLimit';

        // Execute and return
        return Database.query(soql);
    }
}