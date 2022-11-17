import api from './index';

export interface User {
  id: number;
  email: string;
  name?: string;
}

export interface UserForm extends User {
  passwordConfirmation?: string;
  password: string;
  rememberMe?: boolean;
}

export default {
  login(email: string, password: string, remember: boolean) {
    const path = '/users/sign_in';

    return api({
      method: 'post',
      url: path,
      data: {
        user: {
          email,
          password,
          rememberMe: remember,
        },
      },
    });
  },
  register(user: UserForm) {
    const path = '/users';

    return api({
      method: 'post',
      url: path,
      data: {
        user,
      },
    });
  },
};
