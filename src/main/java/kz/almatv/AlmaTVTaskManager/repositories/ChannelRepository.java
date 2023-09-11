package kz.almatv.AlmaTVTaskManager.repositories;

import java.util.List;
import kz.almatv.AlmaTVTaskManager.models.Channel;
import kz.almatv.AlmaTVTaskManager.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ChannelRepository extends JpaRepository <Channel, Long> {
  List<Channel> findByUser(User user);
}
