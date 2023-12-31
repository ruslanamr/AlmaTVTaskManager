package kz.almatv.AlmaTVTaskManager.models;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.security.core.GrantedAuthority;

@Entity
@Table(name = "roles")
@Getter
@Setter
@ToString
public class Role implements GrantedAuthority {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;
  private String name;

  @Override
  public String getAuthority() {
    return name;
  }
}
