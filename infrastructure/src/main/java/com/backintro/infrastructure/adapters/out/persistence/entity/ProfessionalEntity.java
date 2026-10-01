package com.backintro.infrastructure.adapters.out.persistence.entity;

import jakarta.persistence.*;
import lombok.*;
import java.util.UUID;
import java.util.List;
import java.util.Set;
import java.time.LocalDateTime;

@Entity
@Table(name = "professionals")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ProfessionalEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "user_id", updatable = false, nullable = false)
    private UUID userId;

    @Column(name = "first_name", nullable = false, length = 50)
    private String firstName;

    @Column(name = "last_name", nullable = false, length = 50)
    private String lastName;

    @Column(name = "medical_license", length = 50, unique = true)
    private String medicalLicense;

    @Column(name = "profession_type_id")
    private Integer professionTypeId;

    @Column(length = 20)
    private String phone;

    @Column(length = 100, unique = true)
    private String email;

    @Column(name = "created_at", updatable = false)
    private LocalDateTime createdAt;

    @Column(name = "updated_at")
    private LocalDateTime updatedAt;

    // 4.3.2.1 Relación OneToMany Bidireccional
    // Un profesional tiene muchos tratamientos asignados
    @OneToMany(mappedBy = "professional", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<TreatmentEntity> treatments;

    // 4.3.6 @JoinTable en Relaciones Muchos a Muchos
    // Ejemplo: Profesional <-> Especialidad
    @ManyToMany
    @JoinTable(
        name = "professional_specialties",
        joinColumns = @JoinColumn(name = "professional_id"),
        inverseJoinColumns = @JoinColumn(name = "specialty_id")
    )
    private Set<SpecialtyEntity> specialties;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        updatedAt = LocalDateTime.now();
    }

    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
    }
}
