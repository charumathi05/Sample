public with sharing class OpportunityUpdatedAsClosedWon {

    public static void opportunityUpdatedAsClosedWon(List<Opportunity> newOpportunities, List<Opportunity> oldOpportunities) {

        for(Opportunity oldOpportunity : oldOpportunities) {
            for(Opportunity newOpportunity : newOpportunities) {
                if(oldOpportunity.Id == newOpportunity.Id) {
                    if(oldOpportunity.StageName == 'Closed Won' && newOpportunity.StageName != 'Closed Won') {
}   