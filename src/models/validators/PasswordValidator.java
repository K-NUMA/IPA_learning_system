package models.validators;

import java.util.ArrayList;
import java.util.List;

import models.UserList;

public class PasswordValidator {
    public static List<String> validate(UserList u,String pass,String re_entpass){
        List<String> errors = new ArrayList<String>();

        String user_id_error = validateUserId(u);

        if(!user_id_error.equals("")){
            errors.add(user_id_error);
        }

        String password_match_error = validatePassWord(pass,re_entpass);

        if(!password_match_error.equals("")){
            errors.add(password_match_error);
        }

        return errors;
    }

    private static String validateUserId(UserList user){
        if(user == null){
            return "入力したユーザーIDは登録されていません";
        }

        return "";
    }

    private static String validatePassWord(String pass,String re_entpass){
        if(!pass.equals(re_entpass)){
            return "入力したパスワードが一致していません";
        }
        if(pass.equals("") || re_entpass.equals("")){
            return "パスワードが入力されていません";
        }
        return "";
    }
}
