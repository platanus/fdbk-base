<script setup lang="ts">
import users, { type UserForm } from 'api/users';
import { ref, watch } from 'vue';
import UserSessionRegistrationForm from './user-session-registration-form.vue';
import UserSessionLoginForm from './user-session-login-form.vue';

type Props = {
  mode: 'login' | 'register',
};
const props = withDefaults(
  defineProps<Props>(),
  {
    mode: 'login',
  },
);
const formError = ref('');
const deviseEndpoints = {
  login: '/users/sign_in',
  register: '/users/sign_up',
};

const internalMode = ref(props.mode);

watch(() => internalMode.value, () => {
  formError.value = '';
  window.history.replaceState({}, '', deviseEndpoints[internalMode.value]);
});

async function submitForm(values: UserForm) {
  try {
    if (internalMode.value === 'login') {
      await users.login(values.email, values.password, !!values.rememberMe);
    } else {
      await users.register(values);
    }
    window.location.href = '/';
  } catch (error) {
    const modeWord = internalMode.value === 'login' ? 'ingresar' : 'registrarse';
    formError.value = `Error al ${modeWord}, por favor revise su información e intente nuevamente.`;
  }
}
</script>

<template>
  <div class="mx-auto w-full max-w-xl border-slate-200 bg-right bg-no-repeat px-14 pb-14 pt-9 text-center md:rounded-3xl md:border">
    <div
      class="flex w-full flex-col justify-center text-left"
    >
      <user-session-login-form
        v-if="internalMode === 'login'"
        @toggle-mode="internalMode = 'register'"
        @submit="submitForm"
      />
      <user-session-registration-form
        v-else
        @toggle-mode="internalMode = 'login'"
        @submit="submitForm"
      />
      <p
        v-if="formError"
        class="mt-4 text-center text-red-500"
      >
        {{ formError }}
      </p>
    </div>
  </div>
</template>
