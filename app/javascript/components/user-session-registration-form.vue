<script setup lang="ts">
import type { UserForm } from 'api/users';
import { reactive } from 'vue';

const form = reactive({
  name: '',
  email: '',
  password: '',
  passwordConfirmation: '',
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
      Crear Cuenta
    </base-title>
    <base-input
      v-model="form.name"
      label="Nombre"
      name="name"
      class="mb-4"
      required
    />
    <base-input
      v-model="form.email"
      label="Correo electrónico"
      name="email"
      class="mb-4"
      type="email"
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
    <base-input
      v-model="form.passwordConfirmation"
      label="Confirmar Contraseña"
      type="password"
      name="passwordConfirmation"
      class="mb-4"
      required
    />
    <base-button
      class="mb-4 self-center"
    >
      Crear Cuenta
    </base-button>

    <p class="text-center">
      ¿Ya tienes una cuenta?
      <button
        type="button"
        class="text-cyan-500 underline"
        @click="emit('toggle-mode')"
      >
        Inicia sesión aquí
      </button>
    </p>
  </form>
</template>
