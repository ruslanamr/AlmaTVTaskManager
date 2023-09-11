package kz.almatv.AlmaTVTaskManager.controllers;

import java.time.LocalDateTime;
import java.util.List;
import kz.almatv.AlmaTVTaskManager.dto.CommentDto;
import kz.almatv.AlmaTVTaskManager.models.Comment;
import kz.almatv.AlmaTVTaskManager.services.impl.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/comments")
public class CommentController {

  @Autowired
  public CommentService commentService;


  @GetMapping
  public List<CommentDto> getListComment(@RequestParam Long id) {
    return commentService.getCommentsByChannelId(id);
  }

  @PostMapping
  public void addComment(@RequestBody Comment comment) {
    LocalDateTime currentDateTime = LocalDateTime.now();
    comment.setDateTime(currentDateTime);
    commentService.addCommentToBd(comment);
  }
}
