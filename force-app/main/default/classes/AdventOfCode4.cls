public with sharing class AdventOfCode4 {
    
    public static final List<String> PuzzleInput = AdventOfCode2022Utilities.getStaticResource('AdventOfCode4').split('\n');

    public Integer firstPuzzle() { 
        Integer numberOfPairsNeedReconsideration = 0;
        for(String pair : PuzzleInput){ 
            if(pairNeedReconsideration(pair.split(','))){
                numberOfPairsNeedReconsideration++;
            }
        }
        return numberOfPairsNeedReconsideration;
    }

    public Boolean pairNeedReconsideration(List<String> gnomeAssignments){
        Boolean reconsiderationNeeded = false;
        List<Integer> a = new List<Integer>();
        for(String assignment : gnomeAssignments){
            for(String s : assignment.split('-')) {
                a.add(Integer.valueOf(s));
            }
        }
        reconsiderationNeeded = a[0] <= a[2] && a[1] >= a[3] || a[2] <= a[0] && a[3] >= a[1];
        return reconsiderationNeeded;
    }
}