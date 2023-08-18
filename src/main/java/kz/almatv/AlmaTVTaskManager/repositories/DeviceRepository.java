package kz.almatv.AlmaTVTaskManager.repositories;

import kz.almatv.AlmaTVTaskManager.models.Device;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DeviceRepository extends JpaRepository<Device, Long> {

}
