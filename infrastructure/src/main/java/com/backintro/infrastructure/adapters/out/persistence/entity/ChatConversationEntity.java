package com.backintro.infrastructure.adapters.out.persistence.entity;

import jakarta.persistence.*;
import lombok.*;
import java.util.UUID;
import java.time.LocalDateTime;

@Entity
@Table(name = "chat_conversations")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ChatConversationEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private UUID id;

    // 4.3.4 @OneToOne
    // Relación One-to-One desde el lado propietario.
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "treatment_id", unique = true)
    private TreatmentEntity treatment;

    @Column(name = "started_at", updatable = false)
    private LocalDateTime startedAt;

    @Column(name = "closed_at")
    private LocalDateTime closedAt;

    @PrePersist
    protected void onCreate() {
        startedAt = LocalDateTime.now();
    }
}
