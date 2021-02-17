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
    private Double basic_theory;

    @Column(name = "com_system",nullable = false)
    private Double com_system;

    @Column(name = "tech_elements",nullable = false)
    private Double tech_elements;

    @Column(name = "develop_tech",nullable = false)
    private Double develop_tech;

    @Column(name = "pm",nullable = false)
    private Double pm;

    @Column(name = "sm",nullable = false)
    private Double sm;

    @Column(name = "system_st",nullable = false)
    private Double system_st;

    @Column(name = "business_st",nullable = false)
    private Double business_st;

    @Column(name = "co_legal",nullable = false)
    private Double co_legal;

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

    public Double getBasic_theory() {
        return basic_theory;
    }

    public void setBasic_theory(Double basic_theory) {
        this.basic_theory = basic_theory;
    }

    public Double getCom_system() {
        return com_system;
    }

    public void setCom_system(Double com_system) {
        this.com_system = com_system;
    }

    public Double getTech_elements() {
        return tech_elements;
    }

    public void setTech_elements(Double tech_elements) {
        this.tech_elements = tech_elements;
    }

    public Double getDevelop_tech() {
        return develop_tech;
    }

    public void setDevelop_tech(Double develop_tech) {
        this.develop_tech = develop_tech;
    }

    public Double getPm() {
        return pm;
    }

    public void setPm(Double pm) {
        this.pm = pm;
    }

    public Double getSm() {
        return sm;
    }

    public void setSm(Double sm) {
        this.sm = sm;
    }

    public Double getSystem_st() {
        return system_st;
    }

    public void setSystem_st(Double system_st) {
        this.system_st = system_st;
    }

    public Double getBusiness_st() {
        return business_st;
    }

    public void setBusiness_st(Double business_st) {
        this.business_st = business_st;
    }

    public Double getCo_legal() {
        return co_legal;
    }

    public void setCo_legal(Double co_legal) {
        this.co_legal = co_legal;
    }



}
