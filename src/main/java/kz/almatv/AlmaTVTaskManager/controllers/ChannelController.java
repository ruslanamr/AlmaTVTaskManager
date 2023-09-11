package kz.almatv.AlmaTVTaskManager.controllers;

import java.time.LocalDateTime;
import java.util.List;
import kz.almatv.AlmaTVTaskManager.models.ChannelErrorsStrName;
import kz.almatv.AlmaTVTaskManager.services.ChannelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/channelreportRest")
public class ChannelController {

  @Autowired
  public ChannelService channelService;

  @GetMapping
  public List<ChannelErrorsStrName> channelErrors(
      @RequestParam LocalDateTime date_in,
      @RequestParam LocalDateTime date_out) {
    return channelService.getChannelReport(date_in, date_out);
  }
}
