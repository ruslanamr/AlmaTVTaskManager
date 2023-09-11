package kz.almatv.AlmaTVTaskManager.repositories;

import java.util.List;
import kz.almatv.AlmaTVTaskManager.models.Comment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CommentRepository extends JpaRepository<Comment, Long> {

  List<Comment> findAllByChannelErrId(Long id);

}
