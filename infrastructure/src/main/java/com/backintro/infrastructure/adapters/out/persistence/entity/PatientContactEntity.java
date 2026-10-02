package com.backintro.infrastructure.adapters.out.persistence.entity;

import jakarta.persistence.*;
import lombok.*;
import java.util.UUID;
import java.time.LocalDateTime;
import java.time.LocalDate;
import java.math.BigDecimal;

@Entity
@Table(name = "patient_contacts")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PatientContactEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private UUID id;

    @Column(name = "contact_id")
    private UUID contactId;

    @Column(name = "patient_id")
    private UUID patientId;

    @Column(name = "is_primary_contact")
    private Boolean isPrimaryContact;

    @Column(name = "is_emergency_contact")
    private Boolean isEmergencyContact;

    @Column(name = "relationship_type_id")
    private UUID relationshipTypeId;

}