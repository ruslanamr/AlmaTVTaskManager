package kz.almatv.AlmaTVTaskManager.services;

import java.time.LocalDateTime;
import java.util.List;
import kz.almatv.AlmaTVTaskManager.models.Device;
import kz.almatv.AlmaTVTaskManager.models.DeviceError;
import kz.almatv.AlmaTVTaskManager.models.DeviceErrorStrName;
import kz.almatv.AlmaTVTaskManager.models.DeviceType;

public interface DeviceService {

  List<Device> getDeviceList();

  List<DeviceErrorStrName> getDeviceErrListDate(LocalDateTime dateIn, LocalDateTime dateOut);

  Device getDeviceById(Long id);

  void addDevice(Device device);

  void updateDevice(Device device);

  void deleteDeviceById(Long id);

  List<DeviceType> getDeviceTypeList();

  void addDeviceType(DeviceType deviceType);

  List<DeviceError> getDeviceErrorList();

  DeviceError getDeviceErrorById(Long id);

  void addDeviceError(DeviceError deviceError);

  void updateDeviceError(Long id, String status, String description);

  void deleteDeviceErrorById(Long id);

  int countDeviceErrInProcess();

}
