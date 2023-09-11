package kz.almatv.AlmaTVTaskManager.services.impl;

import java.io.FileOutputStream;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import kz.almatv.AlmaTVTaskManager.dto.ChannelDto;
import kz.almatv.AlmaTVTaskManager.mappers.ChannelErrorMapper;
import kz.almatv.AlmaTVTaskManager.models.Channel;
import kz.almatv.AlmaTVTaskManager.models.ChannelError;
import kz.almatv.AlmaTVTaskManager.models.ChannelErrorsStrName;
import kz.almatv.AlmaTVTaskManager.models.User;
import kz.almatv.AlmaTVTaskManager.repositories.ChannelErrorRepository;
import kz.almatv.AlmaTVTaskManager.repositories.ChannelRepository;
import kz.almatv.AlmaTVTaskManager.repositories.CommentRepository;
import kz.almatv.AlmaTVTaskManager.services.ChannelService;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

@Service
public class ChannelServiceImpl implements ChannelService {

  @Autowired
  public ChannelRepository channelRepository;
  @Autowired
  public ChannelErrorRepository channelErrorRepository;
  @Autowired
  public CommentRepository commentRepository;

  @Override
  public List<Channel> getChannelList() {
    return channelRepository.findAll(Sort.by("name"));
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
    return channelErrorRepository.findAll(Sort.by("status").and(Sort.by("id").descending()));
  }

  @Override
  public ChannelError getChannelErrorById(Long id) {
    return channelErrorRepository.findById(id).orElse(null);
  }

  @Override
  public void addChannelError(ChannelError channelError) {
    LocalDateTime currentDateTime = LocalDateTime.now();
    channelError.setDateTimeLog(currentDateTime);
    channelErrorRepository.save(channelError);
  }

  @Override
  public void updateChannelError(Long id, String status, String description) {
    ChannelError channelError = getChannelErrorById(id);
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
    for (ChannelError che : channelErrors) {
      if (che.getStatus().equals("В процессе")) {
        count++;
      }
    }

    return count;
  }

  @Override
  public List<Channel> getChannelListByUser(User user) {
    return channelRepository.findByUser(user);
  }

  @Override
  public List<ChannelErrorsStrName> getChannelReport(LocalDateTime dateIn, LocalDateTime dateOut) {
    List<ChannelError> channelErrors = channelErrorRepository.reportByDate(dateIn, dateOut);

    List<ChannelErrorsStrName> channelErrorsStrNames = ChannelErrorMapper.INSTANCE.toList(
        channelErrors);

    for (ChannelErrorsStrName ch : channelErrorsStrNames) {
      List<ChannelDto> channelsname = ch.getChannels();

      List<String> strName = new ArrayList<>();
      for (ChannelDto channel : channelsname) {
        strName.add(channel.getName());
      }
      ch.setChannelsStr(strName.toString().replace("[", "").replace("]", ""));
    }

    try (Workbook workbook = new XSSFWorkbook()) {
      Sheet sheet = workbook.createSheet("Sheet 1");

      int rowNum = 1;
      for (ChannelErrorsStrName data : channelErrorsStrNames) {
        Row row = sheet.createRow(rowNum++);
        if (data instanceof ChannelErrorsStrName) {
          Cell cell0 = row.createCell(0);
          cell0.setCellValue(((ChannelErrorsStrName) data).getId());

          Cell cell1 = row.createCell(1);
          cell1.setCellValue(((ChannelErrorsStrName) data).getName());

          Cell cell3 = row.createCell(2);
          cell3.setCellValue(((ChannelErrorsStrName) data).getDateTime());

          Cell cell4 = row.createCell(3);
          cell4.setCellValue(((ChannelErrorsStrName) data).getDuration());

          Cell cell5 = row.createCell(4);
          cell5.setCellValue(((ChannelErrorsStrName) data).getType());

          Cell cell6 = row.createCell(5);
          cell6.setCellValue(((ChannelErrorsStrName) data).getStatus());

          Cell cell7 = row.createCell(6);
          cell7.setCellValue(((ChannelErrorsStrName) data).getDescription());

          Cell cell8 = row.createCell(7);

          cell8.setCellValue(((ChannelErrorsStrName) data).getChannelsStr());

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
      headerCell3.setCellValue("Продолжительность");
      headerCell3.setCellStyle(boldCellStyle);
      sheet.setColumnWidth(3, 7000);

      Cell headerCell4 = headerRow.createCell(4);
      headerCell4.setCellValue("Тип");
      headerCell4.setCellStyle(boldCellStyle);
      sheet.setColumnWidth(4, 10000);

      Cell headerCell5 = headerRow.createCell(5);
      headerCell5.setCellValue("Статус");
      headerCell5.setCellStyle(boldCellStyle);
      sheet.setColumnWidth(5, 5000);

      Cell headerCell6 = headerRow.createCell(6);
      headerCell6.setCellValue("Описание");
      headerCell6.setCellStyle(boldCellStyle);
      sheet.setColumnWidth(6, 20000);

      Cell headerCell7 = headerRow.createCell(7);
      headerCell7.setCellValue("Каналы");
      headerCell7.setCellStyle(boldCellStyle);
      sheet.setColumnWidth(7, 10000);

      try (FileOutputStream fileOut = new FileOutputStream("ChannelErrors.xlsx")) {
        workbook.write(fileOut);
      }
    } catch (IOException e) {
      e.printStackTrace();
    }
    return channelErrorsStrNames;
  }


}
