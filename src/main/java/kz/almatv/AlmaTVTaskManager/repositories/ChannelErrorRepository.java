package kz.almatv.AlmaTVTaskManager.repositories;

import java.time.LocalDateTime;
import java.util.List;
import kz.almatv.AlmaTVTaskManager.models.ChannelError;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface ChannelErrorRepository extends JpaRepository<ChannelError, Long> {

  @Query("select che from ChannelError che where che.dateTimeLog between :dateIn and :dateOut ")
  List<ChannelError> reportByDate(LocalDateTime dateIn, LocalDateTime dateOut);
}
