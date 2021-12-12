package models;

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

@Table(name="amquestioncategory")
@NamedQueries({
    @NamedQuery(
            name = "ScoreIdSelectData",
            query = "SELECT a FROM AmQuestionCategory as a WHERE a.score_id = :score_id"
            )
})
@Entity
public class AmQuestionCategory {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "score_id",nullable = false)
    private AmScoreRegist score_id;

    @Column(name = "technology",nullable = false)
    private Double technology;

    @Column(name = "management",nullable = false)
    private Double management;

    @Column(name = "strategy",nullable = false)
    private Double strategy;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public AmScoreRegist getScore_id() {
        return score_id;
    }

    public void setScore_id(AmScoreRegist score_id) {
        this.score_id = score_id;
    }

    public Double getTechnology() {
        return technology;
    }

    public void setTechnology(Double technology) {
        this.technology = technology;
    }

    public Double getManagement() {
        return management;
    }

    public void setManagement(Double management) {
        this.management = management;
    }

    public Double getStrategy() {
        return strategy;
    }

    public void setStrategy(Double strategy) {
        this.strategy = strategy;
    }


}
