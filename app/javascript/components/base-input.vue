<script setup lang="ts">
import { useAttrs } from 'vue';

const props = withDefaults(
  defineProps<{
    type?: string
    label?: string
  }>(),
  {
    label: undefined,
    type: 'text',
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
    class="flex flex-col"
    :class="attrs.class"
  >
    <span class="text-base font-normal text-slate-700">{{ label }}</span>
    <input
      class="rounded border-slate-200 bg-white focus:ring-indigo-600"
      v-bind="attrsWithoutClasses"
      :type="props.type"
      @input="emit('update:modelValue', ($event.target as HTMLInputElement).value)"
    >
  </label>
</template>
