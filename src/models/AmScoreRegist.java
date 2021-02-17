package models;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Table(name="amscores")
@NamedQueries({
        @NamedQuery(
                name = "getUserAllScore",
                query = "SELECT s FROM AmScoreRegist AS s WHERE s.user = :user"
        ),
        @NamedQuery(
                name = "getUserMostRecentScore",
                query = "SELECT MAX(s.id) FROM AmScoreRegist AS s WHERE s.user = :user"
        )
})
@Entity
public class AmScoreRegist {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "user_id",nullable = false)
    private UserList user;

    @Column(name = "score",nullable = false)
    private Integer score;

    @Column(name = "test_year",nullable = false)
    private String test_year;

    @Column(name = "test_season",nullable = false)
    private String test_season;

    @Column(name = "anstime",nullable = false)
    private Date anstime;

    @Column(name = "anscount",nullable = false)
    private Integer anscount;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public UserList getUser() {
        return user;
    }

    public void setUser(UserList user) {
        this.user = user;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public String getTest_year() {
        return test_year;
    }

    public void setTest_year(String test_year) {
        this.test_year = test_year;
    }

    public String getTest_season() {
        return test_season;
    }

    public void setTest_season(String test_season) {
        this.test_season = test_season;
    }

    public Date getAnstime() {
        return anstime;
    }

    public void setAnstime(Date anstime) {
        this.anstime = anstime;
    }

    public Integer getAnscount() {
        return anscount;
    }

    public void setAnscount(Integer anscount) {
        this.anscount = anscount;
    }

}
