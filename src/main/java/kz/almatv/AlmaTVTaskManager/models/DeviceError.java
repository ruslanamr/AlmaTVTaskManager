package kz.almatv.AlmaTVTaskManager.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import java.time.LocalDateTime;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "device_errors")
@Getter
@Setter
@ToString
public class DeviceError {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;
  @ManyToOne
  private User user;
  @ManyToOne
  private Device device;
  private String name;
  private String dateTime;
  private String type;
  private String status;
  @Column(columnDefinition = "TEXT")
  private String description;
  private LocalDateTime dateTimeLog;


}
