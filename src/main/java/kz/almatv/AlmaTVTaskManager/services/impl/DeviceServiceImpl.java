package kz.almatv.AlmaTVTaskManager.services.impl;

import java.time.LocalDateTime;

import java.util.List;

import kz.almatv.AlmaTVTaskManager.mappers.DeviceErrorMapper;
import kz.almatv.AlmaTVTaskManager.models.Device;
import kz.almatv.AlmaTVTaskManager.models.DeviceError;
import kz.almatv.AlmaTVTaskManager.models.DeviceErrorStrName;
import kz.almatv.AlmaTVTaskManager.models.DeviceType;
import kz.almatv.AlmaTVTaskManager.repositories.DeviceErrorRepository;
import kz.almatv.AlmaTVTaskManager.repositories.DeviceRepository;
import kz.almatv.AlmaTVTaskManager.repositories.DeviceTypeRepository;
import kz.almatv.AlmaTVTaskManager.services.DeviceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import java.io.FileOutputStream;
import java.io.IOException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;


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
    return deviceRepository.findAll(Sort.by("name"));
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
    return deviceErrorRepository.findAll(Sort.by("status").and(Sort.by("id").descending()));
  }

  @Override
  public DeviceError getDeviceErrorById(Long id) {
    return deviceErrorRepository.findById(id).orElse(null);
  }

  @Override
  public void addDeviceError(DeviceError deviceError) {
    LocalDateTime currentDateTime = LocalDateTime.now();
    deviceError.setDateTimeLog(currentDateTime);
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
    for (DeviceError d : deviceErrors) {
      if (d.getStatus().equals("В процессе")) {
        count++;
      }
    }
    return count;
  }

  @Override
  public List<DeviceErrorStrName> getDeviceErrListDate(LocalDateTime dateIn, LocalDateTime dateOut) {
    List<DeviceError> deviceErrors = deviceErrorRepository.reportDeviceByDate(dateIn, dateOut);

    List<DeviceErrorStrName> deviceErrorStrNames = DeviceErrorMapper.INSTANCE.toList(deviceErrors);
    for (DeviceErrorStrName dv : deviceErrorStrNames) {
      dv.setDeviceStr(dv.getDevice().toString().replace("[", "").replace("]", ""));
    }

    try (Workbook workbook = new XSSFWorkbook()) {
      Sheet sheet = workbook.createSheet("Sheet 1");

      int rowNum = 1;
      for (DeviceErrorStrName data : deviceErrorStrNames) {
        Row row = sheet.createRow(rowNum++);
        if (data instanceof DeviceErrorStrName) {
          Cell cell0 = row.createCell(0);
          cell0.setCellValue(((DeviceErrorStrName) data).getId());
          Cell cell1 = row.createCell(1);
          cell1.setCellValue(((DeviceErrorStrName) data).getName());
          Cell cell3 = row.createCell(2);
          cell3.setCellValue(((DeviceErrorStrName) data).getDateTime());
          Cell cell4 = row.createCell(3);
          cell4.setCellValue(((DeviceErrorStrName) data).getStatus());
          Cell cell5 = row.createCell(4);
          cell5.setCellValue(((DeviceErrorStrName) data).getType());
          Cell cell6 = row.createCell(5);
          cell6.setCellValue(((DeviceErrorStrName) data).getDescription());
          Cell cell7 = row.createCell(6);
          cell7.setCellValue(((DeviceErrorStrName) data).getDeviceStr());

        }
      }
      Font boldFont = workbook.createFont();
      boldFont.setBold(true);
      CellStyle boldCellStyle = workbook.createCellStyle();

      boldCellStyle.setFont(boldFont);
      Row headerRow = sheet.createRow(0);
      Cell headerCell = headerRow.createCell(0);
      headerCell.setCellValue("Id");
      headerCell.setCellStyle(boldCellStyle);
      sheet.setColumnWidth(0, 3000);

      Cell headerCell1 = headerRow.createCell(1);
      headerCell1.setCellValue("Название");
      headerCell1.setCellStyle(boldCellStyle);
      sheet.setColumnWidth(1, 10000);

      Cell headerCell2 = headerRow.createCell(2);
      headerCell2.setCellValue("Дата и время");
      headerCell2.setCellStyle(boldCellStyle);
      sheet.setColumnWidth(2, 5000);

      Cell headerCell3 = headerRow.createCell(3);
      headerCell3.setCellValue("Статус");
      headerCell3.setCellStyle(boldCellStyle);
      sheet.setColumnWidth(3, 7000);

      Cell headerCell4 = headerRow.createCell(4);
      headerCell4.setCellValue("Тип");
      headerCell4.setCellStyle(boldCellStyle);
      sheet.setColumnWidth(4, 10000);

      Cell headerCell5 = headerRow.createCell(5);
      headerCell5.setCellValue("Описание");
      headerCell5.setCellStyle(boldCellStyle);
      sheet.setColumnWidth(5, 20000);

      Cell headerCell6 = headerRow.createCell(6);
      headerCell6.setCellValue("Девайс");
      headerCell6.setCellStyle(boldCellStyle);
      sheet.setColumnWidth(6, 20000);

      try (FileOutputStream fileOut = new FileOutputStream("DeviceErrors.xlsx")) {
        workbook.write(fileOut);
      }
    } catch (IOException e) {
      e.printStackTrace();
    }

    return deviceErrorStrNames;
  }
}
