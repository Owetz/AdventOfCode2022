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
        return calculateFullyOverlapped(a[0], a[1], a[2], a[3]);
    }

    public Integer secondPuzzle(){
        Integer numberOfPairsNeedReconsideration = 0;
        for(String pair : PuzzleInput){ 
            if(isPairOverlapping(pair.split(','))){
                numberOfPairsNeedReconsideration++;
            }
        }
        return numberOfPairsNeedReconsideration;
    }

    public Boolean isPairOverlapping(List<String> gnomeAssignments){
        Boolean reconsiderationNeeded = false;
        List<Integer> a = new List<Integer>();
        for(String assignment : gnomeAssignments){
            for(String s : assignment.split('-')) {
                a.add(Integer.valueOf(s));
            }
        }
        return calculatePartlyOverlapped(a[0], a[1], a[2], a[3]);
    }

    public Boolean calculateFullyOverlapped(Integer n1, Integer n2, Integer n3, Integer n4){
        return (n1 <= n3 && n2 >= n4 || n3 <= n1 && n4 >= n2);
    }
    
    public Boolean calculatePartlyOverlapped(Integer n1, Integer n2, Integer n3, Integer n4){
        return (n1 <= n3 && n2 >= n3) || (n1 >= n3 && n1 <= n4);
    }
}