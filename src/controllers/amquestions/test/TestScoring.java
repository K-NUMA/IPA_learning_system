package controllers.amquestions.test;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.AmQuestion;
import utils.AnsWord;

/**
 * Servlet implementation class TestScoring
 */
@WebServlet("/amquestions/test/testscoring")
public class TestScoring extends HttpServlet {
    private static final long serialVersionUID = 1L;

    //問題の種類数(1.基礎理論から9.企業と法務まで)
    final static int QCATEGORY = 9;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestScoring() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] ans = (String[])request.getSession().getAttribute("ans");
        int ansnum;

        @SuppressWarnings("unchecked")
        ArrayList<AmQuestion> questions = (ArrayList<AmQuestion>)request.getSession().getAttribute("qlist");

        //採点結果の配列を定義。
        //正解か不正解かを格納する配列
        String[] ansResult = new String[questions.size()];

        //解答した問題の種類毎の正答数(1行目)と出題数(2行目)を格納する配列の宣言
        int[][] categoryNumAnsCnt = new int[2][QCATEGORY];
        //小数第3位まで丸めるための配列を定義
        BigDecimal[] ansCategoryDeci = new BigDecimal[QCATEGORY];

        for(int i=0 ; i < 2;i++){
            for(int j=0 ; j < QCATEGORY;j++){
                categoryNumAnsCnt[i][j] = 0;
            }
        }

        double scorePoint = 0.0;

        //解答が正解か一問ずつチェック
        for(int i=0 ; i < questions.size(); i++){
            ansnum = AnsWord.wordAnsTrans(ans[i]);
            if(questions.get(i).getAnswer() == ansnum){
                ansResult[i] = "〇";
                scorePoint += (double)1 / questions.size() * 100;

              //問題の種類(1～9の番号)に応じた場所の正答数をカウント
                categoryNumAnsCnt[0][questions.get(i).getCategory()-1]++;
            }else{
                ansResult[i] = "×";
            }

          //問題の種類(1～9の番号)に応じた場所の出題数をカウント
            categoryNumAnsCnt[1][questions.get(i).getCategory()-1]++;
        }

      //問題の種類ごとの正答率を小数第2位まで丸める(四捨五入)
        for(int i=0 ; i < QCATEGORY;i++){
            //問題数が0出ない場合、正答率を計算
            if(categoryNumAnsCnt[1][i] != 0){
                ansCategoryDeci[i] = new BigDecimal((double)categoryNumAnsCnt[0][i]/categoryNumAnsCnt[1][i]);
                ansCategoryDeci[i] = ansCategoryDeci[i].setScale(2,RoundingMode.HALF_UP);
            }else{
                ansCategoryDeci[i] = BigDecimal.valueOf(0.00);
            }
        }

        if((int)scorePoint >= 60){
            request.setAttribute("passjudge", "1");
        }else{
            request.setAttribute("passjudge", "0");
        }

        //採点結果と問題の出題数をリクエストスコープへ格納
        request.setAttribute("ansresult",ansResult);
        request.setAttribute("scorepoint",(int)scorePoint);
        request.setAttribute("qcounts",questions.size());

        //問題の種類ごとの点数はセッションスコープへ格納
        request.getSession().setAttribute("anscategory",ansCategoryDeci);

        //戻るボタンで解答を改ざんできないようにセッションスコープをリクエストスコープへ
        request.setAttribute("qlist", request.getSession().getAttribute("qlist"));
        request.setAttribute("ans", request.getSession().getAttribute("ans"));
        request.getSession().removeAttribute("qlist");
        request.getSession().removeAttribute("ans");

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/amquestions/test/testscore.jsp");
        rd.forward(request, response);

    }

}
