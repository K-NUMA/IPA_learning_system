package utils;

public class AnsWord {
    public static String ansWordTrans(Integer a){
        String word=null;

        switch(a){
            case 1:
                word = "ア";
                break;
            case 2:
                word = "イ";
                break;
            case 3:
                word = "ウ";
                break;
            case 4:
                word = "エ";
                break;
        }

        return word;
    }

    public static Integer wordAnsTrans(String s){
        int num=0;

        switch(s){
            case "ア":
                num = 1;
                break;
            case "イ":
                num = 2;
                break;
            case "ウ":
                num = 3;
                break;
            case "エ":
                num = 4;
                break;
        }

        return num;
    }
}
