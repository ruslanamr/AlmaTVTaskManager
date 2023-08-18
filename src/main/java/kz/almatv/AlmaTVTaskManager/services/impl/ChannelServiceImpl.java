package kz.almatv.AlmaTVTaskManager.services.impl;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Locale;
import kz.almatv.AlmaTVTaskManager.models.Channel;
import kz.almatv.AlmaTVTaskManager.models.ChannelError;
import kz.almatv.AlmaTVTaskManager.repositories.ChannelErrorRepository;
import kz.almatv.AlmaTVTaskManager.repositories.ChannelRepository;
import kz.almatv.AlmaTVTaskManager.services.ChannelService;
import lombok.ToString;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChannelServiceImpl implements ChannelService {
  @Autowired
  public ChannelRepository channelRepository;
  @Autowired
  public ChannelErrorRepository channelErrorRepository;

  @Override
  public List<Channel> getChannelList() {
    return channelRepository.findAll();
  }

  @Override
  public Channel getChannelById(Long id) {
    return channelRepository.findById(id).orElse(null);
  }

  @Override
  public void addChannel(Channel channel) {
    channelRepository.save(channel);
  }

  @Override
  public void updateChannel(Channel channel) {
    channelRepository.save(channel);
  }

  @Override
  public void deleteChannelById(Long id) {
    channelRepository.deleteById(id);
  }

  @Override
  public List<ChannelError> getChannelErrors() {
    return channelErrorRepository.findAll();
  }

  @Override
  public ChannelError getChannelErrorById(Long id) {
    return channelErrorRepository.findById(id).orElse(null);
  }

  @Override
  public void addChannelError(ChannelError channelError) {
    channelError.setStatus("В процессе");
    LocalDateTime currentDateTime = LocalDateTime.now();
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
    String formattedDateTime = currentDateTime.format(formatter);
    channelError.setDateTimeLog(formattedDateTime);
    channelErrorRepository.save(channelError);
  }

  @Override
  public void updateChannelError(Long id, String status, String description) {
    ChannelError channelError =  getChannelErrorById(id);
    channelError.setStatus(status);
    channelError.setDescription(description);
    channelErrorRepository.save(channelError);
  }

  @Override
  public void deleteChannelErrorById(Long id) {
    channelErrorRepository.deleteById(id);
  }

  @Override
  public int getSummChannelErrorsInProcess() {
    int count = 0;
    List<ChannelError> channelErrors = getChannelErrors();
    for(ChannelError che  : channelErrors){
      if(che.getStatus().equals("В процессе")){
        count++;
      }
    }

    return count;
  }
}
