/* eslint no-console:0 */
import 'onsenui/css/onsenui.css';
import 'onsenui/css/onsen-css-components.css';

import Vue from 'vue/dist/vue.esm'
import VueOnsen from 'vue-onsenui';
import router from '../javascripts/router'
import UserHeader from '../javascripts/components/layout/UserHeader.vue'
new Vue({
  router,
  components: {
    UserHeader
  },
}).$mount('#app')
