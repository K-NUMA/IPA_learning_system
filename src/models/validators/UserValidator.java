package models.validators;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;

import models.UserList;
import utils.DBUtil;

public class UserValidator {
    public static List<String> validate(UserList u,Boolean uidDuplicateCheckFlag,Boolean passwordCheckFlag){
        List<String> errors = new ArrayList<String>();

        String user_id_error = validateUserId(u.getUser_id(), uidDuplicateCheckFlag);

        if(!user_id_error.equals("")){
            errors.add(user_id_error);
        }

        String user_name_error = validateUserName(u.getUser_name());
        if(!user_name_error.equals("")){
            errors.add(user_name_error);
        }

        String password_error = validatePassword(u.getPassword(), passwordCheckFlag);
        if(!password_error.equals("")){
            errors.add(password_error);
        }

        return errors;
    }

    // 社員番号
    private static String validateUserId(String user_id,Boolean uidDuplicateCheckFlag){
        // 必須入力チェック
        if(user_id == null || user_id.equals("")){
            return "ユーザーIDを入力してください。";
        }

        // すでに登録されている社員番号との重複チェック
        if(uidDuplicateCheckFlag){
            EntityManager em = DBUtil.createEntityManager();
            long users_count = (long)em.createNamedQuery("checkRegisterdUserId", Long.class)
                    .setParameter("user_id",user_id)
                    .getSingleResult();

            em.close();
            if(users_count > 0){
                return "入力されたユーザーの情報はすでに存在しています。";
            }
        }

        return "";
    }

    // 社員名の必須入力チェック
    private static String validateUserName(String username){
        if(username == null || username.equals("")){
            return "氏名を入力してください。";
        }
        return "";
    }

    // パスワードの必須入力チェック
    private static String validatePassword(String password,Boolean passwordCheckFlag){
        // パスワードを変更する場合のみ実行
        if(passwordCheckFlag && (password == null || password.equals(""))){
            return "パスワードを入力してください。";
        }
        return "";
    }
}
