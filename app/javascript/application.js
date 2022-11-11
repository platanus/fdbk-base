import { createApp } from 'vue';
import TheHeader from './components/the-header.vue';
import './css/application.css';

document.addEventListener('DOMContentLoaded', () => {
  const app = createApp({
    components: {
      TheHeader,
    },
  });
  app.mount('#vue-app');

  return app;
});
