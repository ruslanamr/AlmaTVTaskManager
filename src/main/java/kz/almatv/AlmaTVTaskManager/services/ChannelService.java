package kz.almatv.AlmaTVTaskManager.services;


import java.time.LocalDateTime;
import java.util.List;
import kz.almatv.AlmaTVTaskManager.models.Channel;
import kz.almatv.AlmaTVTaskManager.models.ChannelError;
import kz.almatv.AlmaTVTaskManager.models.ChannelErrorsStrName;
import kz.almatv.AlmaTVTaskManager.models.User;

public interface ChannelService {

  List<ChannelErrorsStrName> getChannelReport(LocalDateTime dateIn, LocalDateTime dateOut);

  List<Channel> getChannelList();

  Channel getChannelById(Long id);

  void addChannel(Channel channel);

  void updateChannel(Channel channel);

  void deleteChannelById(Long id);

  List<ChannelError> getChannelErrors();

  ChannelError getChannelErrorById(Long id);

  void addChannelError(ChannelError channelError);

  void updateChannelError(Long id, String status, String description);

  void deleteChannelErrorById(Long id);

  int getSummChannelErrorsInProcess();

  List<Channel> getChannelListByUser(User user);

}
