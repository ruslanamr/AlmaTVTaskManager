package kz.almatv.AlmaTVTaskManager.controllers;

import java.time.LocalDateTime;
import java.util.List;
import kz.almatv.AlmaTVTaskManager.models.DeviceErrorStrName;
import kz.almatv.AlmaTVTaskManager.services.DeviceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/deviceReportRest")
public class DeviceController {

  @Autowired
  public DeviceService deviceService;

  @GetMapping
  public List<DeviceErrorStrName> deviceErrors(
      @RequestParam LocalDateTime date_in,
      @RequestParam LocalDateTime date_out) {
    return deviceService.getDeviceErrListDate(date_in, date_out);
  }
}
