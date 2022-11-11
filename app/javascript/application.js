import { createApp } from 'vue';
import './css/application.css';

document.addEventListener('DOMContentLoaded', () => {
  const app = createApp({
    components: { App },
  });
  app.mount('#vue-app');

  return app;
});
