package kz.almatv.AlmaTVTaskManager.mappers;

import kz.almatv.AlmaTVTaskManager.dto.UserDto;
import kz.almatv.AlmaTVTaskManager.models.User;
import org.mapstruct.Builder;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

@Mapper(builder = @Builder(disableBuilder = true))
public interface UserMapper {
  UserMapper INSTANCE = Mappers.getMapper(UserMapper.class);
  UserDto to (User user);
}
