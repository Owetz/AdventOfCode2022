public with sharing class AdventOfCode5 {

    public final List<String> PuzzleInput = AdventOfCode2022Utilities.getStaticResource('AdventOfCode5').split('\n');
    public final Map<Integer, List<String>> crateStacks = generateCrateStack(9);

    public AdventOfCode5(){
        //First stack
        addCrateToStack(1, 'B');
        addCrateToStack(1, 'L');
        addCrateToStack(1, 'D');
        addCrateToStack(1, 'T');
        addCrateToStack(1, 'W');
        addCrateToStack(1, 'C');
        addCrateToStack(1, 'F');
        addCrateToStack(1, 'M');
        //Second stack
        addCrateToStack(2, 'N');
        addCrateToStack(2, 'B');
        addCrateToStack(2, 'L');
        //Third stack
        addCrateToStack(3, 'J');
        addCrateToStack(3, 'C');
        addCrateToStack(3, 'H');
        addCrateToStack(3, 'T');
        addCrateToStack(3, 'L');
        addCrateToStack(3, 'V');
        //Fourth stack
        addCrateToStack(4, 'S');
        addCrateToStack(4, 'P');
        addCrateToStack(4, 'J');
        addCrateToStack(4, 'W');
        //Fifth stack
        addCrateToStack(5, 'Z');
        addCrateToStack(5, 'S');
        addCrateToStack(5, 'C');
        addCrateToStack(5, 'F');
        addCrateToStack(5, 'T');
        addCrateToStack(5, 'L');
        addCrateToStack(5, 'R');
        //Sixt stack
        addCrateToStack(6, 'W');
        addCrateToStack(6, 'D');
        addCrateToStack(6, 'G');
        addCrateToStack(6, 'B');
        addCrateToStack(6, 'H');
        addCrateToStack(6, 'N');
        addCrateToStack(6, 'Z');
        //Seventh stack
        addCrateToStack(7, 'F');
        addCrateToStack(7, 'M');
        addCrateToStack(7, 'S');
        addCrateToStack(7, 'P');
        addCrateToStack(7, 'V');
        addCrateToStack(7, 'G');
        addCrateToStack(7, 'C');
        addCrateToStack(7, 'N');
        //Eight' stack
        addCrateToStack(8, 'W');
        addCrateToStack(8, 'Q');
        addCrateToStack(8, 'R');
        addCrateToStack(8, 'J');
        addCrateToStack(8, 'F');
        addCrateToStack(8, 'V');
        addCrateToStack(8, 'C');
        addCrateToStack(8, 'Z');
        //Ninth stack
        addCrateToStack(9, 'R');
        addCrateToStack(9, 'P');
        addCrateToStack(9, 'M');
        addCrateToStack(9, 'L');
        addCrateToStack(9, 'R');
    }

    public void firstPuzzle() {
        for(String instructions : PuzzleInput){
            followInstructions(instructions);
        }
        System.debug('Message to the elves: ' + generateMessageToElfs(crateStacks));
    }
    
    /* public void secondPuzzle() {

    } */

    public void followInstructions(String instructions){
        List<String> easyToReadInstructions = instructions.split(' ');
        Integer numberOfCrates, fromStack, toStack;
        numberOfCrates = valueAsInteger(easyToReadInstructions[1]);
        fromStack = valueAsInteger(easyToReadInstructions[3]);
        toStack = valueAsInteger(easyToReadInstructions[5]);
        if(numberOfCrates > 1){
            moveMultipleCratesToAnotherStack(numberOfCrates, fromStack, toStack);
        } else {
            moveSingleCrateToAnotherStack(fromStack, toStack);
        }
    }

    public void moveSingleCrateToAnotherStack(Integer fromStack, Integer toStack){
        String crate = removeCrateFromStack(fromStack);
        addCrateToStack(toStack, crate);
    }
    
    public void moveMultipleCratesToAnotherStack(Integer numberOfCrates, Integer fromStack, Integer toStack){
        for(Integer i = 1; i <= numberOfCrates; i++){
            String crate = removeCrateFromStack(fromStack);
            addCrateToStack(toStack, crate);
        }
    }

    public void addCrateToStack(Integer stackNumber, String crate){
        crateStacks.get(stackNumber).add(crate);
    }

    public String removeCrateFromStack(Integer stackNumber){
        List<String> stack = crateStacks.get(stackNumber);
        return stack.remove(stack.size()-1);
    }

    public String generateMessageToElfs(Map<Integer,List<String>> crateStacks){
        String message = '';
        for(List<String> stack : crateStacks.values()){
            message += stack[stack.size()-1];
        }
        return message;
    }

    public Map<Integer, List<String>> generateCrateStack(Integer numberOfStacks){
        Map<Integer,List<String>> stacks = new Map<Integer,List<String>>();
        for(Integer i = 1; i <= numberOfStacks; i++){
            stacks.put(i,new List<String>());
        }
        return stacks;
    }

    public String valueAsString(Integer n){
        return String.valueOf(n);
    }

    public Integer valueAsInteger(String s){
        return Integer.valueOf(s);
    }
}
