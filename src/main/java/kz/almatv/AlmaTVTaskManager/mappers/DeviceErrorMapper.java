package kz.almatv.AlmaTVTaskManager.mappers;


import java.util.List;
import kz.almatv.AlmaTVTaskManager.models.DeviceError;
import kz.almatv.AlmaTVTaskManager.models.DeviceErrorStrName;
import org.mapstruct.Builder;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

@Mapper(builder = @Builder(disableBuilder = true))
public interface DeviceErrorMapper {

  DeviceErrorMapper INSTANCE = Mappers.getMapper(DeviceErrorMapper.class);
  List<DeviceErrorStrName> toList(List<DeviceError> deviceErrors);

}
