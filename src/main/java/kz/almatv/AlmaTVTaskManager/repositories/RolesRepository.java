package kz.almatv.AlmaTVTaskManager.repositories;

import kz.almatv.AlmaTVTaskManager.models.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RolesRepository extends JpaRepository<Role, Long> {

}
