package kz.almatv.AlmaTVTaskManager.mappers;

import java.util.List;
import kz.almatv.AlmaTVTaskManager.dto.CommentDto;
import kz.almatv.AlmaTVTaskManager.models.Comment;
import org.mapstruct.Builder;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

@Mapper(builder = @Builder(disableBuilder = true))
public interface CommentMapper {
  CommentMapper INSTANCE = Mappers.getMapper(CommentMapper.class);
  CommentDto to (Comment comment);
  List<CommentDto> toList(List<Comment> comments);
}
