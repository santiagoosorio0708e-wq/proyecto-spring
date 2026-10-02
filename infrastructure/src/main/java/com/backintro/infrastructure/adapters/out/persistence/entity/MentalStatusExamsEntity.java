package com.backintro.infrastructure.adapters.out.persistence.entity;

import jakarta.persistence.*;
import lombok.*;
import java.util.UUID;
import java.time.LocalDateTime;
import java.time.LocalDate;
import java.math.BigDecimal;

@Entity
@Table(name = "mental_status_exams")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MentalStatusExamsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private UUID id;

    @Column(name = "encounter_id")
    private UUID encounterId;

    @Column(name = "appearance", columnDefinition = "TEXT")
    private String appearance;

    @Column(name = "behavior", columnDefinition = "TEXT")
    private String behavior;

    @Column(name = "attitude", columnDefinition = "TEXT")
    private String attitude;

    @Column(name = "consciousness", columnDefinition = "TEXT")
    private String consciousness;

    @Column(name = "orientation", columnDefinition = "TEXT")
    private String orientation;

    @Column(name = "attention", columnDefinition = "TEXT")
    private String attention;

    @Column(name = "memory", columnDefinition = "TEXT")
    private String memory;

    @Column(name = "speech", columnDefinition = "TEXT")
    private String speech;

    @Column(name = "mood", columnDefinition = "TEXT")
    private String mood;

    @Column(name = "affect", columnDefinition = "TEXT")
    private String affect;

    @Column(name = "thought_process", columnDefinition = "TEXT")
    private String thoughtProcess;

    @Column(name = "thought_content", columnDefinition = "TEXT")
    private String thoughtContent;

    @Column(name = "perception", columnDefinition = "TEXT")
    private String perception;

    @Column(name = "judgment", columnDefinition = "TEXT")
    private String judgment;

    @Column(name = "insight", columnDefinition = "TEXT")
    private String insight;

    @Column(name = "psychomotor_activity", columnDefinition = "TEXT")
    private String psychomotorActivity;

    @Column(name = "observations", columnDefinition = "TEXT")
    private String observations;

    @Column(name = "created_at", updatable = false)
    private LocalDateTime createdAt;

    @Column(name = "created_by")
    private UUID createdBy;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
    }

}