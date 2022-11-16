<script setup lang="ts">
import type { FeedbackSession } from 'api/feedback-sessions';

interface Props {
  type: 'provider' | 'receiver';
  session: FeedbackSession,
}

const props = defineProps<Props>();
</script>

<template>
  <div class="flex flex-row items-center gap-6 bg-white p-4 shadow">
    <span class="text-lg text-slate-800">
      {{ type === 'provider' ? props.session.receiver.name : props.session.provider.name }}
    </span>
    <span class="text-sm text-slate-500">{{ props.session.sessionDate }}</span>
    <button class="ml-auto flex h-6 w-6 items-center justify-center rounded-full bg-slate-100">
      <inline-svg
        :src="require('images/icons/dots-vertical.svg')"
        class="h-4 w-4 fill-indigo-900"
      />
    </button>
  </div>
</template>
