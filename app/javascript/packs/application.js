/* eslint no-console:0 */
import Vue from 'vue/dist/vue.esm'
import router from '../router'

import UserHeader from '../components/layout/UserHeader.vue'

new Vue({
  router,
  components: {
    UserHeader
  },
}).$mount('#app')
