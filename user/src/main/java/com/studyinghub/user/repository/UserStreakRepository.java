package com.studyinghub.user.dao;

import com.studyinghub.user.entity.UserStreakEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface UserStreakRepository extends JpaRepository<UserStreakEntity, UUID> {
    List<UserStreakEntity> findByUser_UserId(UUID userId);
}