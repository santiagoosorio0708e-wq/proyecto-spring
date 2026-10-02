package com.backintro.infrastructure.adapters.out.persistence.entity;

import jakarta.persistence.*;
import lombok.*;
import java.util.UUID;
import java.time.LocalDateTime;
import java.time.LocalDate;
import java.math.BigDecimal;

@Entity
@Table(name = "risk_assessments")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RiskAssessmentEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private UUID id;

    @Column(name = "encounter_id")
    private UUID encounterId;

    @Column(name = "risk_level_id")
    private UUID riskLevelId;

    @Column(name = "suicidal_ideation")
    private Boolean suicidalIdeation;

    @Column(name = "suicide_plan")
    private Boolean suicidePlan;

    @Column(name = "suicide_intent")
    private Boolean suicideIntent;

    @Column(name = "self_harm")
    private Boolean selfHarm;

    @Column(name = "harm_to_others")
    private Boolean harmToOthers;

    @Column(name = "risk_factors", columnDefinition = "TEXT")
    private String riskFactors;

    @Column(name = "protective_factors", columnDefinition = "TEXT")
    private String protectiveFactors;

    @Column(name = "clinical_actions", columnDefinition = "TEXT")
    private String clinicalActions;

    @Column(name = "observations", columnDefinition = "TEXT")
    private String observations;

    @Column(name = "assessed_at")
    private LocalDateTime assessedAt;

    @Column(name = "assessed_by")
    private UUID assessedBy;

}