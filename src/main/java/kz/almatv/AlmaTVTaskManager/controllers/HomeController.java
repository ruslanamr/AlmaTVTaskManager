package kz.almatv.AlmaTVTaskManager.controllers;

import kz.almatv.AlmaTVTaskManager.models.Channel;
import kz.almatv.AlmaTVTaskManager.models.ChannelError;
import kz.almatv.AlmaTVTaskManager.models.Device;
import kz.almatv.AlmaTVTaskManager.models.DeviceError;
import kz.almatv.AlmaTVTaskManager.models.DeviceType;
import kz.almatv.AlmaTVTaskManager.models.Task;
import kz.almatv.AlmaTVTaskManager.models.User;
import kz.almatv.AlmaTVTaskManager.services.ChannelService;
import kz.almatv.AlmaTVTaskManager.services.DeviceService;
import kz.almatv.AlmaTVTaskManager.services.TaskService;
import kz.almatv.AlmaTVTaskManager.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {

  @Autowired
  public ChannelService channelService;
  @Autowired
  public UserService userService;
  @Autowired
  public DeviceService deviceService;
  @Autowired
  public TaskService taskService;


  @PreAuthorize("isAnonymous()")
  @GetMapping("/sign-in")
  public String signInPage() {
    return "/sign-in";
  }

  @PreAuthorize("isAuthenticated()")
  @GetMapping("/accessdenied")
  public String accessdenied(){
    return "/accessdenied";
  }

  @PreAuthorize("isAuthenticated()")
  @GetMapping("/")
  public String home(Model model) {
    model.addAttribute("countChannelErr", channelService.getSummChannelErrorsInProcess());
    model.addAttribute("countDeviceErr", deviceService.countDeviceErrInProcess());
    model.addAttribute("countTasks", taskService.countTascksInProcess());

    return "/home";
  }

  @PreAuthorize("isAuthenticated()")
  @GetMapping("/channels")
  public String channels(Model model) {
    model.addAttribute("channels", channelService.getChannelList());
    model.addAttribute("users", userService.getUserList());
    return "/channels";
  }

  @PreAuthorize("isAuthenticated()")
  @GetMapping("/channeldetails/{id}")
  public String channeldetails(Model model, @PathVariable Long id) {
    model.addAttribute("channel", channelService.getChannelById(id));
    model.addAttribute("users", userService.getUserList());
    return "/channeldetails";
  }

  @PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_ENGINEER')")
  @PostMapping("/addChannel")
  public String addChannel(Channel channel) {
    channelService.addChannel(channel);
    return "redirect:/channels";
  }
  @PreAuthorize("hasAnyRole('ROLE_ADMIN')")
  @PostMapping("/updateChannel")
  public String updateChannel(Channel channel) {
    channelService.updateChannel(channel);
    return "redirect:/channeldetails/" + channel.getId();
  }
  @PreAuthorize("hasAnyRole('ROLE_ADMIN')")
  @PostMapping("/deleteChannel/{id}")
  public String deleteChannel(@PathVariable Long id) {
    channelService.deleteChannelById(id);
    return "redirect:/channels";
  }

  @PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_ENGINEER')")
  @GetMapping("/devices")
  public String devices(Model model) {
    model.addAttribute("devices", deviceService.getDeviceList());
    model.addAttribute("devicetypes", deviceService.getDeviceTypeList());
    return "/devices";
  }
  @PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_ENGINEER')")
  @GetMapping("/addType")
  public String deviceTypeForm(){
    return "/devicetype";
  }

  @PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_ENGINEER')")
  @PostMapping("/addDevice")
  public String addDevice(Device device){
    deviceService.addDevice(device);
    return "redirect:/devices";
  }

  @PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_ENGINEER')")
  @PostMapping("/addDeviceType")
  public String deviceType(DeviceType deviceType){
    deviceService.addDeviceType(deviceType);
    return "redirect:/devices";
  }

  @PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_ENGINEER')")
  @GetMapping("/devicedetails/{id}")
  public String devicedetails(Model model, @PathVariable Long id) {
    model.addAttribute("device", deviceService.getDeviceById(id));
    model.addAttribute("devicetypes", deviceService.getDeviceTypeList());
    return "/devicedetails";
  }

  @PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_ENGINEER')")
  @PostMapping("/updateDevice")
  public String updateDevice(Device device) {
    deviceService.updateDevice(device);
    return "redirect:/devicedetails/" + device.getId();
  }

  @PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_ENGINEER')")
  @PostMapping("/deleteDevice/{id}")
  public String deleteDevice(@PathVariable Long id) {
    deviceService.deleteDeviceById(id);
    return "redirect:/devices";
  }

  @PreAuthorize("isAuthenticated()")
  @GetMapping("/channelErrors")
  public String channelErrors(Model model) {
    model.addAttribute("channelErrors", channelService.getChannelErrors());
    model.addAttribute("channels", channelService.getChannelList());
    model.addAttribute("users", userService.getUserList());
    return "/channelerrors";
  }

  @PreAuthorize("isAuthenticated()")
  @PostMapping("/addChannelError")
  public String addChannelError(ChannelError channelError){
    channelService.addChannelError(channelError);
    return "redirect:/channelErrors";
  }

  @PreAuthorize("isAuthenticated()")
  @GetMapping("/channelErrorDetail/{id}")
  public String channelErrorDetail(Model model, @PathVariable Long id) {
    model.addAttribute("error", channelService.getChannelErrorById(id));
    model.addAttribute("channels", channelService.getChannelList());
    model.addAttribute("users", userService.getUserList());
    return "/channelErrorDetail";
  }

  @PreAuthorize("isAuthenticated()")
  @PostMapping("/updateStatus")
  public String updateStatus(@RequestParam String description,
      @RequestParam String status, @RequestParam Long id){
    channelService.updateChannelError(id, status, description);
    return "redirect:/channelErrors";
  }

  @PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_ENGINEER')")
  @PostMapping("/deleteError/{id}")
  public String deleteError(@PathVariable Long id){
    channelService.deleteChannelErrorById(id);
    return "redirect:/channelErrors";
  }

  @PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_ENGINEER')")
  @GetMapping("/deviceErrors")
  public String deviceErrors(Model model){
    model.addAttribute("deviceError", deviceService.getDeviceErrorList());
    model.addAttribute("devices", deviceService.getDeviceList());
    model.addAttribute("users", userService.getUserList());
    return "/deviceErrors";
  }

  @PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_ENGINEER')")
  @PostMapping("/addDeviceError")
  public String addDeviceError(DeviceError deviceError){
    deviceService.addDeviceError(deviceError);
    return "redirect:/deviceErrors";
  }

  @PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_ENGINEER')")
  @GetMapping("/deviceErrorDetail/{id}")
  public String deviceErrorDetail(@PathVariable Long id, Model model){
    model.addAttribute("error", deviceService.getDeviceErrorById(id));
    return "/deviceErrorDetail";
  }

  @PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_ENGINEER')")
  @PostMapping("/updateErrorDeviceStatus")
  public String updateErrorDeviceStatus(@RequestParam String description,
      @RequestParam String status, @RequestParam Long id){
    deviceService.updateDeviceError(id, status, description);
    return "redirect:/deviceErrors";
  }

  @PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_ENGINEER')")
  @PostMapping("/deleteDeviceError/{id}")
  public String deleteDeviceError(@PathVariable Long id){
    deviceService.deleteDeviceErrorById(id);
    return "redirect:/deviceErrors";
  }

  @PreAuthorize("hasAnyRole('ROLE_ADMIN')")
  @GetMapping("/users")
  public String users(Model model){
    model.addAttribute("users", userService.getUserList());
    model.addAttribute("roles", userService.getListRole());
    return "/users";
  }

  @PreAuthorize("hasAnyRole('ROLE_ADMIN')")
  @GetMapping("/userdetails/{id}")
  public String userdetails(@PathVariable Long id, Model model){
    model.addAttribute("user", userService.getUserById(id));
    model.addAttribute("roles", userService.getListRole());
    return "/userdetails";
  }

  @PreAuthorize("hasAnyRole('ROLE_ADMIN')")
  @PostMapping("/addUser")
  public String addUser(User user, @RequestParam String re_password){
    String result = userService.addUser(user, re_password);
    return "redirect:/" + result;
  }

  @GetMapping("/userEditPassword")
  public String userEditPassword(){
    return "/userEditPassword";
  }

  @PostMapping("/userEditPassword")
  public String userEditPasswordPost(@RequestParam Long id, @RequestParam String password,
      @RequestParam String new_password, @RequestParam String re_new_password){
    String result = userService.updateUserPasswor(id, password, new_password, re_new_password);
    return "redirect:/" + result;
  }


  @PreAuthorize("hasAnyRole('ROLE_ADMIN')")
  @PostMapping("/updateUser")
  public String updateUser(User user, @RequestParam String re_password){
    String result = userService.updateUser(user, re_password);
    return "redirect:/" + result;
  }

  @PreAuthorize("hasAnyRole('ROLE_ADMIN')")
  @GetMapping("/addNewUser")
  public String addNewUser(Model model){
    model.addAttribute("roles", userService.getListRole());
    return "/addNewUser";
  }

  @PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_ENGINEER')")
  @GetMapping("/tasks")
  public String tasks(Model model){
    model.addAttribute("users", userService.getUserList());
    model.addAttribute("tasks", taskService.getTaskList());
    return "/tasks";
  }

  @PreAuthorize("hasAnyRole('ROLE_ADMIN')")
  @PostMapping("/addTask")
  public String addTask(Task task){
    taskService.addTask(task);
    return "redirect:/tasks";
  }

  @PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_ENGINEER')")
  @GetMapping("/taskdetails/{id}")
  public String taskdetails(@PathVariable Long id, Model model){
    model.addAttribute("users", userService.getUserList());
    model.addAttribute("task", taskService.getTaskById(id));
    return "/taskdetail";
  }

  @PreAuthorize("hasAnyRole('ROLE_ADMIN')")
  @PostMapping("/deleteTask/{id}")
  public String deleteTask(@PathVariable Long id){
    taskService.deleteTaskById(id);
    return "redirect:/tasks";
  }

  @PreAuthorize("hasAnyRole('ROLE_ADMIN')")

  @PostMapping("/updateTask")
  public String updateTask(Task task){
    taskService.updateTask(task);
    return "redirect:/tasks";
  }
  @PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_ENGINEER')")
  @PostMapping("/updateTasksStatus")
  public String updateTasksStatus(@RequestParam String status,
      @RequestParam String comment, @RequestParam Long id){
    taskService.updateTasksStatus(id, status, comment);
    return "redirect:/tasks";
  }

  @PreAuthorize("hasAnyRole('ROLE_ADMIN')")
  @PostMapping("/deleteUser/{id}")
  public String deleteUser(@PathVariable Long id){
    userService.deleteUserById(id);
    return "redirect:/users";
  }

}
