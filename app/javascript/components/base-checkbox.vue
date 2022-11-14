<script setup lang="ts">
import { useAttrs } from 'vue';

const props = withDefaults(
  defineProps<{
    label?: string
  }>(),
  {
    label: undefined,
  },
);

const emit = defineEmits<{
  (event: 'update:modelValue', value: string): void;
}>();

const attrs = useAttrs();
const attrsWithoutClasses = Object.fromEntries(
  Object.entries(attrs).filter(([key]) => key !== 'class'),
);
</script>

<script lang="ts">
export default {
  inheritAttrs: false,
};
</script>

<template>
  <label
    class="flex items-center"
    :class="$attrs.class"
  >
    <input
      type="checkbox"
      class="mr-2 rounded border-slate-200 bg-white focus:ring-indigo-600"
      v-bind="attrsWithoutClasses"
      @input="emit('update:modelValue', ($event.target as HTMLInputElement).value)"
    >
    <span class="text-base font-normal text-slate-700">{{ props.label }}</span>
  </label>
</template>
