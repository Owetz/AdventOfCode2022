public with sharing class AdventOfCode2 {
    static public Integer firstPuzzle() {
        List<String> PuzzleInput = AdventOfCode2022Utilities.getStaticResource('AdventOfCode2').split('\n');
        Map<String, Integer> ScoreMap = createScoreMap();
        Map<String, String> winConditionMap = createWinConditionMap();
        Map<String, String> drawConditionMap = createDrawConditionMap();
        Map<String, String> lossConditionMap = createLossConditionMap();
        Integer totalScore = 0;

        for(String round : PuzzleInput){
            if(winConditionMap.get(round.left(1)) == round.right(1)){
                totalScore += (ScoreMap.get('Win') + ScoreMap.get(round.right(1)));
            } else if (drawConditionMap.get(round.left(1)) == round.right(1)){
                totalScore += (ScoreMap.get('Draw') + ScoreMap.get(round.right(1)));
            } else if (lossConditionMap.get(round.left(1)) == round.right(1)){
                totalScore += (ScoreMap.get('Loss') + ScoreMap.get(round.right(1)));
            }
        }


        return totalScore;
    }

    static public Integer secondPuzzle() {
        List<String> PuzzleInput = AdventOfCode2022Utilities.getStaticResource('AdventOfCode2').split('\n');
        Integer totalScore = 0;

        for(String round : PuzzleInput){
            totalScore += calculateRoundScore(round.left(1), round.right(1));
        }


        return totalScore;
    }

    static public Integer calculateRoundScore(String opponentChoice , String desiredOutcome){
        Map<String, Integer> ScoreMap = createScoreMap();
        Map<String, String> winConditionMap = createWinConditionMap();
        Map<String, String> drawConditionMap = createDrawConditionMap();
        Map<String, String> lossConditionMap = createLossConditionMap();
        String myChoice;
        Integer roundScore = 0;

        if(desiredOutcome == 'Z'){
            myChoice = winConditionMap.get(opponentChoice);
            roundScore = ScoreMap.get('Win') + ScoreMap.get(myChoice);
        }
        if(desiredOutcome == 'Y'){
            myChoice = drawConditionMap.get(opponentChoice);
            roundScore = ScoreMap.get('Draw') + ScoreMap.get(myChoice);
        }
        if(desiredOutcome == 'X'){
            myChoice = lossConditionMap.get(opponentChoice);
            roundScore = ScoreMap.get('Loss') + ScoreMap.get(myChoice);
        }
        return roundScore;
    }

    static public Map<String, Integer> createScoreMap(){
        return new Map<String, Integer>{
            'X' =>  1,
            'Y' =>  2,
            'Z' =>  3,
            'Win'   =>  6,
            'Draw'  =>  3,
            'Loss'  =>  0
        };
    }

    static public Map<String, String> createWinConditionMap(){
        return new Map<String, String>{
            'A' => 'Y',
            'B' => 'Z',
            'C' => 'X'
        };
    }

    static public Map<String, String> createDrawConditionMap(){
        return new Map<String, String>{
            'A' => 'X',
            'B' => 'Y',
            'C' => 'Z'
        };
    }
    
    static public Map<String, String> createLossConditionMap(){
        return new Map<String, String>{
            'A' => 'Z',
            'B' => 'X',
            'C' => 'Y'
        };
    }
}