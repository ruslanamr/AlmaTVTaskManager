package kz.almatv.AlmaTVTaskManager.dto;

import java.time.LocalDateTime;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CommentDto {
  private Long id;
  private UserDto user;
  private Long channelErrId;
  private String commentText;
  private LocalDateTime dateTime;
}
