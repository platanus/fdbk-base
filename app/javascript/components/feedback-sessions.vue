<script setup lang="ts">
import { ref } from 'vue';
import api, { type FeedbackSession } from 'api/feedback-sessions';
import FeedbackSessionItem from './feedback-sessions-item.vue';

interface Props {
  initialSessions: FeedbackSession[],
  initialType: 'provider' | 'receiver',
}

const props = defineProps<Props>();

const currentType = ref(props.initialType);
const sessions = ref(props.initialSessions);

const tabClasses = {
  inactive: 'border-b-4 border-transparent text-slate-500',
  active: `border-b-4 border-indigo-500 text-indigo-500 font-semibold
    bg-gradient-to-b from-white via-white to-indigo-100`,
};

async function switchType(type: 'provider' | 'receiver') {
  currentType.value = type;
  const res = await api.index(type);
  sessions.value = res.data.feedbackSessions;
}
</script>

<template>
  <div>
    <div class="flex">
      <button
        class="flex h-8 items-center justify-center px-3 md:h-14 md:text-lg"
        :class="currentType === 'provider' ? tabClasses.active : tabClasses.inactive"
        @click="switchType('provider')"
      >
        Entrego feedback
      </button>
      <button
        class="flex h-8 items-center justify-center px-3 md:h-14 md:text-lg"
        :class="currentType === 'receiver' ? tabClasses.active : tabClasses.inactive"
        @click="switchType('receiver')"
      >
        Me entregan feedback
      </button>
    </div>
    <div class="bg-slate-100 px-3 py-5">
      <feedback-session-item
        v-for="session in sessions"
        :key="session.id"
        :type="currentType"
        :session="session"
      />
    </div>
  </div>
</template>
