package kz.almatv.AlmaTVTaskManager.models;


import java.time.LocalDateTime;
import kz.almatv.AlmaTVTaskManager.dto.UserDto;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DeviceErrorStrName {

  private Long id;
  private UserDto user;
  private Device device;
  private String deviceStr;
  private String name;
  private String dateTime;
  private String type;
  private String status;
  private String description;
  private LocalDateTime dateTimeLog;


}
