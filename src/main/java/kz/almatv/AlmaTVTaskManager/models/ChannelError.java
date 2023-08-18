package kz.almatv.AlmaTVTaskManager.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import java.util.List;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "channel_errors")
@Getter
@Setter
public class ChannelError {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;
  @ManyToOne
  private User user;
  private String name;
  private String dateTime;
  private String duration;
  private String type;
  @ManyToMany
  private List<Channel> channels;
  private String status;
  @Column(columnDefinition = "TEXT")
  private String description;
  private String dateTimeLog;

}
