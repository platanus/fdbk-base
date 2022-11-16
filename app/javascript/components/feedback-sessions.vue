<script setup lang="ts">
import type { FeedbackSession } from 'api/feedback-sessions';
import FeedbackSessionItem from './feedback-sessions-item.vue';

interface Props {
  initialSessions: FeedbackSession[],
  initialType: 'provider' | 'receiver',
}

const props = defineProps<Props>();

const tabClasses = {
  inactive: 'border-b-4 border-transparent text-slate-500',
  active: `border-b-4 border-indigo-500 text-indigo-500 font-semibold
    bg-gradient-to-b from-white via-white to-indigo-100`,
};
</script>

<template>
  <div>
    <div class="flex">
      <button
        class="flex h-8 items-center justify-center px-3 md:h-14 md:text-lg"
        :class="tabClasses.active"
      >
        Entrego feedback
      </button>
      <button
        class="flex h-8 items-center justify-center px-3 md:h-14 md:text-lg"
        :class="tabClasses.inactive"
      >
        Me entregan feedback
      </button>
    </div>
    <div class="bg-slate-100 px-3 py-5">
      <feedback-session-item
        v-for="session in props.initialSessions"
        :key="session.id"
        :type="props.initialType"
        :session="session"
      />
    </div>
  </div>
</template>
