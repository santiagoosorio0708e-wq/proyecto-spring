package com.backintro.infrastructure.adapters.out.persistence.entity;

import jakarta.persistence.*;
import lombok.*;
import java.util.UUID;
import java.util.List;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Table(name = "treatments")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TreatmentEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private UUID id;

    // 4.3.1 y 4.3.3 @ManyToOne
    // Ejemplo práctico de la teoría aplicado a nuestro dominio:
    // Un tratamiento pertenece a un paciente (equivalente a Producto -> Categoría)
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "patient_id")
    private PatientEntity patient;

    // 4.3.1 y 4.3.3 @ManyToOne
    // Un tratamiento también es asignado por un profesional.
    // Esto ilustra la asociación de una "entidad intermedia" para el concepto de @ManyToMany (4.3.5)
    // entre Patient y Professional.
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "professional_id")
    private ProfessionalEntity professional;

    @Column(name = "start_date", nullable = false)
    private LocalDate startDate;

    @Column(name = "end_date")
    private LocalDate endDate;

    @Column(nullable = false, length = 20)
    private String status;

    @Column(name = "created_at", updatable = false)
    private LocalDateTime createdAt;

    @Column(name = "updated_at")
    private LocalDateTime updatedAt;

    // 4.3.4 @OneToOne
    // Ejemplo práctico de la teoría: Treatment <-> ChatConversation (equivalente a Usuario <-> Perfil)
    // Un tratamiento tiene exactamente una conversación de chat asociada (o ninguna).
    @OneToOne(mappedBy = "treatment", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private ChatConversationEntity chatConversation;

    @OneToMany(mappedBy = "treatment", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<MedicalNoteEntity> medicalNotes;

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
