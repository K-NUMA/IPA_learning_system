package models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Table(name="amquestioncategory")
@Entity
public class AmQuestionCategory {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "score_id",nullable = false)
    private AmScoreRegist score_id;

    @Column(name = "basic_theory",nullable = false)
    private Integer basic_theory;

    @Column(name = "com_system",nullable = false)
    private Integer com_system;

    @Column(name = "tech_elements",nullable = false)
    private Integer tech_elements;

    @Column(name = "pm",nullable = false)
    private Integer pm;

    @Column(name = "sm",nullable = false)
    private Integer sm;

    @Column(name = "system_st",nullable = false)
    private Integer system_st;

    @Column(name = "business_st",nullable = false)
    private Integer business_st;

    @Column(name = "co_legal",nullable = false)
    private Integer co_legal;

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

    public Integer getBasic_theory() {
        return basic_theory;
    }

    public void setBasic_theory(Integer basic_theory) {
        this.basic_theory = basic_theory;
    }

    public Integer getCom_system() {
        return com_system;
    }

    public void setCom_system(Integer com_system) {
        this.com_system = com_system;
    }

    public Integer getTech_elements() {
        return tech_elements;
    }

    public void setTech_elements(Integer tech_elements) {
        this.tech_elements = tech_elements;
    }

    public Integer getPm() {
        return pm;
    }

    public void setPm(Integer pm) {
        this.pm = pm;
    }

    public Integer getSm() {
        return sm;
    }

    public void setSm(Integer sm) {
        this.sm = sm;
    }

    public Integer getSystem_st() {
        return system_st;
    }

    public void setSystem_st(Integer system_st) {
        this.system_st = system_st;
    }

    public Integer getBusiness_st() {
        return business_st;
    }

    public void setBusiness_st(Integer business_st) {
        this.business_st = business_st;
    }

    public Integer getCo_legal() {
        return co_legal;
    }

    public void setCo_legal(Integer co_legal) {
        this.co_legal = co_legal;
    }

}
