// Load Active Admin's styles into Webpacker,
// see `active_admin.scss` for customization.
import "./stylesheets/active_admin.scss";

import "@activeadmin/activeadmin";

import '@fortawesome/fontawesome-free/css/all.css';
import 'arctic_admin';
import "activeadmin_addons"
import { createApp } from 'vue';
import AdminComponent from './components/admin-component.vue';

function onLoad() {
  if (document.getElementById('wrapper') !== null) {
    const app = createApp({
      mounted() {
        // We need to re-trigger DOMContentLoaded for ArcticAdmin after Vue replaces DOM elements
        window.document.dispatchEvent(new Event('DOMContentLoaded', {
          bubbles: true,
          cancelable: true,
        }));
      },
    });
    app.component('AdminComponent', AdminComponent);
    app.mount('#wrapper');
  }

  return null;
}

document.addEventListener('DOMContentLoaded', onLoad, { once: true });


