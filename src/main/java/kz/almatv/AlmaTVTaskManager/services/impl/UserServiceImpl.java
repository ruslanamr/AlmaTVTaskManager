package kz.almatv.AlmaTVTaskManager.services.impl;

import java.util.List;
import kz.almatv.AlmaTVTaskManager.models.Role;
import kz.almatv.AlmaTVTaskManager.models.User;
import kz.almatv.AlmaTVTaskManager.repositories.RolesRepository;
import kz.almatv.AlmaTVTaskManager.repositories.UserRepository;
import kz.almatv.AlmaTVTaskManager.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService, UserDetailsService {

  @Autowired
  public UserRepository userRepository;
  @Autowired
  public RolesRepository rolesRepository;
  @Autowired
  public PasswordEncoder passwordEncoder;

  @Override
  public List<User> getUserList() {
    return userRepository.findAll(Sort.by("surname"));
  }

  @Override
  public User getUserById(Long id) {
    return userRepository.findById(id).orElse(null);
  }

  @Override
  public String addUser(User user, String re_password) {
    User checkUser = userRepository.findByLogin(user.getLogin());
    if (checkUser != null) {
      return "addNewUser?loginErr";
    }
    if (!user.getPassword().equals(re_password)) {
      return "addNewUser?passwordErr";
    }
    user.setPassword(passwordEncoder.encode(re_password));
    userRepository.save(user);
    return "users?success";
  }

  @Override
  public String updateUser(User user, String re_password) {
    if (!user.getPassword().equals(re_password)) {
      return "users?passwordErr";
    }
    user.setPassword(passwordEncoder.encode(re_password));
    userRepository.save(user);
    return "users?success";
  }

  @Override
  public String updateUserPasswor(Long id, String password, String new_password,
      String re_new_password) {
    if (!new_password.equals(re_new_password)) {
      return "userEditPassword?re_pass_error";
    }
    User user = getUserById(id);
    if (!passwordEncoder.matches(password, user.getPassword())) {
      return "userEditPassword?pass_error";
    }

    user.setPassword(passwordEncoder.encode(new_password));
    userRepository.save(user);

    return "?success";
  }

  @Override
  public void deleteUserById(Long id) {
    userRepository.deleteById(id);
  }

  @Override
  public List<Role> getListRole() {
    return rolesRepository.findAll();
  }

  @Override
  public Role getRoleById(Long id) {
    return rolesRepository.findById(id).orElse(null);
  }

  @Override
  public UserDetails loadUserByUsername(String login) throws UsernameNotFoundException {
    User user = userRepository.findByLogin(login);

    if (user == null) {
      throw new UsernameNotFoundException("Пользователь не найден!");
    }
    return user;
  }

  @Override
  public List<User> getUserListEng(String pos) {
    return userRepository.findAllByPosition(pos);
  }
}
