public with sharing class AdventOfCode5 {

    public final List<String> PuzzleInput = AdventOfCode2022Utilities.getStaticResource('AdventOfCode3').split('\n');
    public final Map<Integer, List<String>> crateStacks = generateCrateStack(3);

    public void firstPuzzle() {

    }
    
    /* public void secondPuzzle() {

    } */

    public void moveCrateToAnotherStack(Integer numberOfCrates, Integer fromStack, Integer toStack){
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
}
