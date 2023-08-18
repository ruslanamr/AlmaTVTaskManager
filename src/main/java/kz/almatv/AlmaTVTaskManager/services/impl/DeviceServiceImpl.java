package kz.almatv.AlmaTVTaskManager.services.impl;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import kz.almatv.AlmaTVTaskManager.models.Device;
import kz.almatv.AlmaTVTaskManager.models.DeviceError;
import kz.almatv.AlmaTVTaskManager.models.DeviceType;
import kz.almatv.AlmaTVTaskManager.repositories.DeviceErrorRepository;
import kz.almatv.AlmaTVTaskManager.repositories.DeviceRepository;
import kz.almatv.AlmaTVTaskManager.repositories.DeviceTypeRepository;
import kz.almatv.AlmaTVTaskManager.services.DeviceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DeviceServiceImpl implements DeviceService {
  @Autowired
  public DeviceRepository deviceRepository;
  @Autowired
  public DeviceTypeRepository deviceTypeRepository;
  @Autowired
  public DeviceErrorRepository deviceErrorRepository;

  @Override
  public List<Device> getDeviceList() {
    return deviceRepository.findAll();
  }

  @Override
  public Device getDeviceById(Long id) {
    return deviceRepository.findById(id).orElse(null);
  }

  @Override
  public void addDevice(Device device) {
    deviceRepository.save(device);
  }

  @Override
  public void updateDevice(Device device) {
    deviceRepository.save(device);
  }

  @Override
  public void deleteDeviceById(Long id) {
    deviceRepository.deleteById(id);
  }

  @Override
  public List<DeviceType> getDeviceTypeList() {
    return deviceTypeRepository.findAll();
  }

  @Override
  public void addDeviceType(DeviceType deviceType) {
    deviceTypeRepository.save(deviceType);
  }

  @Override
  public List<DeviceError> getDeviceErrorList() {
    return deviceErrorRepository.findAll();
  }

  @Override
  public DeviceError getDeviceErrorById(Long id) {
    return deviceErrorRepository.findById(id).orElse(null);
  }

  @Override
  public void addDeviceError(DeviceError deviceError) {
    deviceError.setStatus("В процессе");
    LocalDateTime currentDateTime = LocalDateTime.now();
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
    String formattedDateTime = currentDateTime.format(formatter);
    deviceError.setDateTimeLog(formattedDateTime);
    deviceErrorRepository.save(deviceError);
  }

  @Override
  public void updateDeviceError(Long id, String status, String description) {
    DeviceError deviceError = getDeviceErrorById(id);
    deviceError.setStatus(status);
    deviceError.setDescription(description);
    deviceErrorRepository.save(deviceError);
  }

  @Override
  public void deleteDeviceErrorById(Long id) {
    deviceErrorRepository.deleteById(id);
  }

  @Override
  public int countDeviceErrInProcess() {
    int count = 0;
    List<DeviceError> deviceErrors = getDeviceErrorList();
    for(DeviceError d : deviceErrors){
      if(d.getStatus().equals("В процессе")){
        count ++;
      }
    }
    return count;
  }
}
