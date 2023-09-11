package kz.almatv.AlmaTVTaskManager.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "channels")
@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Channel {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;
  private String name;
  @ManyToMany(fetch = FetchType.EAGER)
  private List<User> user;
  private String inAddress;
  private String outAddress;
  private String type;
  private String priority;
  @Column(columnDefinition = "TEXT")
  private String description;

}
