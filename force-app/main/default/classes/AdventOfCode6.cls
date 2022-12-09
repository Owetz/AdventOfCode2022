public with sharing class AdventOfCode6 {
    public final String PuzzleInput = AdventOfCode2022Utilities.getStaticResource('AdventOfCode6');

    public Integer firstPuzzle(){
        for(Integer startIndex = 0; startIndex < PuzzleInput.length(); startIndex++){
            Integer stopIndex = startIndex+4;
            String subString = PuzzleInput.substring(startIndex, stopIndex);
            if(searchForStartOfPacket(startIndex, stopIndex, subString)) return stopIndex;
        }
        return null;
    }

    public Integer secondPuzzle(){
        for(Integer startIndex = 0; startIndex < PuzzleInput.length(); startIndex++){
            Integer stopIndex = startIndex+14;
            String subString = PuzzleInput.substring(startIndex, stopIndex);
            if(searchForStartOfMessage(startIndex, stopIndex, subString)) return stopIndex;
        }
        return null;
    }

    public Boolean searchForStartOfMessage(Integer startIndex, Integer stopIndex, String subString){
        List<String> stringList = subString.split('');
        Set<String> stringSet = new Set<String>(stringList);
        return stringset.size() == stringList.size();
    }

    public Boolean searchForStartOfPacket(Integer index, Integer stopIndex, String subString){
        List<String> stringList = subString.split('');
        Set<String> stringSet = new Set<String>(stringList);
        return stringset.size() == stringList.size();
    }

}
