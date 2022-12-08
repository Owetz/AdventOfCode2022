public with sharing class AdventOfCode3 {

    public static final List<String> PuzzleInput = AdventOfCode2022Utilities.getStaticResource('AdventOfCode3').split('\n');
    Integer sumOfPrios;

    public Integer firstPuzzle(){
        sumOfPrios = 0;
        
        for(String s : PuzzleInput){
            sumOfPrios += compareCompartments(s.substring(0, s.length()/2), s.substring(s.length()/2));
        }

        return sumOfPrios;
    }

    public Integer secondPuzzle(){
        Integer counter = 0;
        sumOfPrios = 0;
        String s1, s2, s3;

        for(String s : PuzzleInput){
            counter++;
            
            if(counter == 1) s1 = s;
            if(counter == 2) s2 = s;
            if(counter == 3){
                s3 = s;
                sumOfPrios += compareRucksacks(s1, s2, s3);
                counter = 0;
            }
        }

        return sumOfPrios;
    }

    public Integer compareCompartments(String firstCompartment, String secondCompartment){
        Integer ruckSackScore = 0;
        Set<String> alreadyCheckedLetters = new Set<String>();
        for(String x : firstCompartment.split('')){
            if(secondCompartment.contains(x) && !alreadyCheckedLetters.contains(x)) {
                alreadyCheckedLetters.add(x);
                ruckSackScore += getPrioScore(x);
            }
        }
        return ruckSackScore;
    }

    public Integer compareRucksacks(String s1, String s2, String s3){
        Integer groupScore = 0;
        Set<String> alreadyCheckedLetters = new Set<String>();
        System.debug('Checking the following bags: ');
        System.debug('s1: ' + s1);
        System.debug('s2: ' + s2);
        System.debug('s3: ' + s3);
        for(String x : s1.split('')){
            if(alreadyCheckedLetters.contains(x)) continue;
            if(s2.contains(x) && s3.contains(x)){
                System.debug('Bags 2 and 3 did contain: ' + x);
                groupScore += getPrioScore(x);
                alreadyCheckedLetters.add(x);
            } else {
                System.debug('Bags 2 and 3 did not contain: ' + x);
            }
        }
        return groupScore;
    }

    public Integer getPrioScore(String item){
        switch on item {
            when 'a' {
                return 1;
            }
            when 'b' {
                return 2;
            }
            when 'c' {
                return 3;
            }
            when 'd' {
                return 4;
            }
            when 'e' {
                return 5;
            }
            when 'f' {
                return 6;
            }
            when 'g' {
                return 7;
            }
            when 'h' {
                return 8;
            }
            when 'i' {
                return 9;
            }
            when 'j' {
                return 10;
            }
            when 'k' {
                return 11;
            }
            when 'l' {
                return 12;
            }
            when 'm' {
                return 13;
            }
            when 'n' {
                return 14;
            }
            when 'o' {
                return 15;
            }
            when 'p' {
                return 16;
            }
            when 'q' {
                return 17;
            }
            when 'r' {
                return 18;
            }
            when 's' {
                return 19;
            }
            when 't' {
                return 20;
            }
            when 'u' {
                return 21;
            }
            when 'v' {
                return 22;
            }
            when 'w' {
                return 23;
            }
            when 'x' {
                return 24;
            }
            when 'y' {
                return 25;
            }
            when 'z' {
                return 26;
            }
            when 'A' {
                return 27;
            }
            when 'B' {
                return 28;
            }
            when 'C' {
                return 29;
            }
            when 'D' {
                return 30;
            }
            when 'E' {
                return 31;
            }
            when 'F' {
                return 32;
            }
            when 'G' {
                return 33;
            }
            when 'H' {
                return 34;
            }
            when 'I' {
                return 35;
            }
            when 'J' {
                return 36;
            }
            when 'K' {
                return 37;
            }
            when 'L' {
                return 38;
            }
            when 'M' {
                return 39;
            }
            when 'N' {
                return 40;
            }
            when 'O' {
                return 41;
            }
            when 'P' {
                return 42;
            }
            when 'Q' {
                return 43;
            }
            when 'R' {
                return 44;
            }
            when 'S' {
                return 45;
            }
            when 'T' {
                return 46;
            }
            when 'U' {
                return 47;
            }
            when 'V' {
                return 48;
            }
            when 'W' {
                return 49;
            }
            when 'X' {
                return 50;
            }
            when 'Y' {
                return 51;
            }
            when 'Z' {
                return 52;
            }
            when else {
                system.debug('this value is not in here: ' + item);
            }
        }
        return null;
    }
}
