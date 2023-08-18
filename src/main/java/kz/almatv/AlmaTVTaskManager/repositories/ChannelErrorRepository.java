package kz.almatv.AlmaTVTaskManager.repositories;

import kz.almatv.AlmaTVTaskManager.models.ChannelError;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface ChannelErrorRepository extends JpaRepository<ChannelError, Long> {

}
