package kz.almatv.AlmaTVTaskManager.models;

import java.time.LocalDateTime;
import java.util.List;
import kz.almatv.AlmaTVTaskManager.dto.ChannelDto;
import kz.almatv.AlmaTVTaskManager.dto.UserDto;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ChannelErrorsStrName {
  private Long id;
  private UserDto user;
  private String name;
  private String dateTime;
  private String duration;
  private String type;
  private List<ChannelDto> channels;
  private String channelsStr;
  private String status;
  private String description;
  private LocalDateTime dateTimeLog;
}
