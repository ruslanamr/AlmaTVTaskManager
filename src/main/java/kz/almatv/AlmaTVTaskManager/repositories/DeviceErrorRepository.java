package kz.almatv.AlmaTVTaskManager.repositories;

import java.time.LocalDateTime;
import java.util.List;
import kz.almatv.AlmaTVTaskManager.models.DeviceError;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface DeviceErrorRepository extends JpaRepository<DeviceError, Long> {
  @Query("select che from DeviceError che where che.dateTimeLog between :dateIn and :dateOut ")
  List<DeviceError> reportDeviceByDate(LocalDateTime dateIn, LocalDateTime dateOut);
}
