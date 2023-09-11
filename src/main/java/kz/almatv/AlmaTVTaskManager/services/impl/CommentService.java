package kz.almatv.AlmaTVTaskManager.services.impl;

import java.util.List;
import kz.almatv.AlmaTVTaskManager.dto.CommentDto;
import kz.almatv.AlmaTVTaskManager.mappers.CommentMapper;
import kz.almatv.AlmaTVTaskManager.models.Comment;
import kz.almatv.AlmaTVTaskManager.repositories.CommentRepository;
import kz.almatv.AlmaTVTaskManager.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentService {

  @Autowired
  public CommentRepository commentRepository;
  @Autowired
  public UserService userService;

  public void addCommentToBd(Comment comment) {
    commentRepository.save(comment);
  }

  public List<CommentDto> getCommentsByChannelId(Long id) {
    List<Comment> comments = commentRepository.findAllByChannelErrId(id);
    List<CommentDto> commentDto = CommentMapper.INSTANCE.toList(comments);
    return commentDto;
  }


}
