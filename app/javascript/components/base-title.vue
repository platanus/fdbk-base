<script setup lang="ts">
interface Props {
  tag?: string,
}

withDefaults(defineProps<Props>(), {
  tag: 'h1',
});
</script>

<template>
  <component
    :is="tag"
    class="flex items-center gap-2 text-2xl font-normal md:text-3xl"
  >
    <slot />
  </component>
</template>
