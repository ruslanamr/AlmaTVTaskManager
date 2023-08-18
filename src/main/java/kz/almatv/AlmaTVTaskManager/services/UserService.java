package kz.almatv.AlmaTVTaskManager.services;

import java.util.List;
import kz.almatv.AlmaTVTaskManager.models.Role;
import kz.almatv.AlmaTVTaskManager.models.User;

public interface UserService {
  List<User> getUserList();
  User getUserById(Long id);
  String addUser(User user, String re_password);
  String updateUser(User user, String re_password);
  void deleteUserById(Long id);

  List<Role> getListRole();
  Role getRoleById(Long id);

  String updateUserPasswor(Long id, String password, String new_password, String re_new_password);

}
