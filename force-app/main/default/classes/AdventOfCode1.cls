public with sharing class AdventOfCode1 {
    static public void firstPuzzle() {
        String calorieList = AdventOfCode2022Utilities.getStaticResource('AdventOfCode1');
        Integer mostTotalCalories = 0;
        Integer tmpCalCount = 0;
        for(String s : calorieList.split('\n')){
            if(s == ''){
                mostTotalCalories = tmpCalCount > mostTotalCalories ? tmpCalCount : mostTotalCalories;
                tmpCalCount = 0;
            } else {
                tmpCalCount += Integer.valueOf(s);
            }
        }
        System.debug(mostTotalCalories);
    }

    static public void secondPuzzle() {
        String calorieList = AdventOfCode2022Utilities.getStaticResource('AdventOfCode1');
        List<Integer> CalorieCountList = new List<Integer>();
        Integer tmpCalCount = 0;
        for(String s : calorieList.split('\n')){
            if(s == ''){
                CalorieCountList.add(tmpCalCount);
                tmpCalCount = 0;
            } else {
                tmpCalCount += Integer.valueOf(s);
            }
        }
        CalorieCountList.sort();
        Integer listSize = CalorieCountList.size();
        Integer sumCalories = CalorieCountList[listSize-1]+CalorieCountList[listSize-2]+CalorieCountList[listSize-3];
        System.debug(sumCalories);
    }
}