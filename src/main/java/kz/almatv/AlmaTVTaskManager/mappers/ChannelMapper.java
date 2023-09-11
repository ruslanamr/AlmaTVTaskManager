package kz.almatv.AlmaTVTaskManager.mappers;

import java.util.List;
import kz.almatv.AlmaTVTaskManager.dto.ChannelDto;
import kz.almatv.AlmaTVTaskManager.models.Channel;
import org.mapstruct.Builder;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

@Mapper(builder = @Builder(disableBuilder = true))
public interface ChannelMapper {
  ChannelMapper INSTANCE = Mappers.getMapper(ChannelMapper.class);
  ChannelDto to (Channel channel);
  List<ChannelDto> toList(List<Channel> channels);
}
