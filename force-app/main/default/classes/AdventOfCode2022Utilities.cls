public with sharing class AdventOfCode2022Utilities {
    public AdventOfCode2022Utilities() {

    }

    static public String getStaticResource(String StaticResourceName){
        if(StaticResourceName == null) return null;

        StaticResource sr = [SELECT Id, Body FROM StaticResource WHERE Name =: StaticResourceName];
        return sr.Body.toString();
    }
}