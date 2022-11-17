<script setup lang="ts">
import type { UserForm } from 'api/users';
import { reactive } from 'vue';

const form = reactive({
  email: '',
  password: '',
  rememberMe: true,
} as UserForm);

const emit = defineEmits<{
  (event: 'toggle-mode'): void;
  (event: 'submit', values: UserForm): void;
}>();
</script>

<template>
  <form
    class="flex flex-col"
    @submit.prevent="emit('submit', form)"
  >
    <base-title class="mb-4">
      Iniciar Sesión
    </base-title>
    <base-input
      v-model="form.email"
      label="Correo electrónico"
      name="email"
      type="email"
      class="mb-4"
      required
    />
    <base-input
      v-model="form.password"
      label="Contraseña"
      type="password"
      name="password"
      class="mb-4"
      required
    />
    <base-checkbox
      v-model="form.rememberMe"
      class="mb-4"
      label="Mantenerse conectado"
      name="remember_me"
    />
    <base-button
      class="mb-4 self-center"
    >
      Iniciar sesión
    </base-button>

    <p class="text-center">
      ¿No tienes una cuenta?
      <button
        type="button"
        class="text-cyan-500 underline"
        @click="emit('toggle-mode')"
      >
        Registrate aquí
      </button>
    </p>
  </form>
</template>
