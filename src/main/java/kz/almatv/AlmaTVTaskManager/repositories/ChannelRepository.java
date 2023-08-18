package kz.almatv.AlmaTVTaskManager.repositories;

import kz.almatv.AlmaTVTaskManager.models.Channel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ChannelRepository extends JpaRepository <Channel, Long> {

}
