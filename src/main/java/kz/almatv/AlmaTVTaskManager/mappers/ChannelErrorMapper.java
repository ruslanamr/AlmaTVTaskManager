package kz.almatv.AlmaTVTaskManager.mappers;


import java.util.List;
import kz.almatv.AlmaTVTaskManager.models.ChannelError;
import kz.almatv.AlmaTVTaskManager.models.ChannelErrorsStrName;
import org.mapstruct.Builder;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

@Mapper(builder = @Builder(disableBuilder = true))
public interface ChannelErrorMapper {

  ChannelErrorMapper INSTANCE = Mappers.getMapper(ChannelErrorMapper.class);
  List<ChannelErrorsStrName> toList(List<ChannelError> channelError);

}
