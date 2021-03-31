package models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Table(name="amquestions")
@NamedQueries({
    @NamedQuery(
            name="getQuestionsCount",
            query="SELECT COUNT(q) from AmQuestion as q"

            ),
    @NamedQuery(
            name="getYearQuestion",
            query="SELECT q FROM AmQuestion AS q WHERE "
                    + "q.qs_year = :qs_year AND q.qs_season = :qs_season  ORDER BY q.qs_number"
            ),
    @NamedQuery(
            name="getUploadedQuestion",
            query="SELECT COUNT(q) FROM AmQuestion As q WHERE "
                  + "q.qs_year = :qs_year AND q.qs_season = :qs_season AND q.qs_number = :qs_number"
            )
})
@Entity
public class AmQuestion {
    @Id
    @Column(name="id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name="qs_year",nullable=false)
    private String qs_year;

    @Column(name="qs_season",nullable=false)
    private String qs_season;

    @Column(name="qs_number",nullable=false)
    private Integer qs_number;

    @Column(name="contentImg",nullable=false,unique=true)
    private String contentImg;

    @Column(name="answer",nullable=false)
    private Integer answer;

    @Column(name="category",nullable=false)
    private Integer category;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getQs_year() {
        return qs_year;
    }

    public void setQs_year(String qs_year) {
        this.qs_year = qs_year;
    }

    public String getQs_season() {
        return qs_season;
    }

    public void setQs_season(String qs_season) {
        this.qs_season = qs_season;
    }

    public Integer getQs_number() {
        return qs_number;
    }

    public void setQs_number(Integer qs_number) {
        this.qs_number = qs_number;
    }

    public String getContentImg() {
        return contentImg;
    }

    public void setContentImg(String contentImg) {
        this.contentImg = contentImg;
    }

    public Integer getAnswer() {
        return answer;
    }

    public void setAnswer(Integer answer) {
        this.answer = answer;
    }

    public Integer getCategory() {
        return category;
    }

    public void setCategory(Integer category) {
        this.category = category;
    }
}
