/* eslint no-console:0 */
import Vue from 'vue/dist/vue.esm'
import router from './javascripts/router'
import UserHeader from './javascripts/components/layout/UserHeader.vue'

new Vue({
  router,
  components: {
    UserHeader
  },
}).$mount('#app')
