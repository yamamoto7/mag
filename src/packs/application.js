/* eslint no-console:0 */
import Vue from 'vue/dist/vue.esm'
import ActionCable from 'actioncable'
import router from '../javascripts/router'
import Header from '../javascripts/components/layout/Header.vue'
import Footer from '../javascripts/components/layout/Footer.vue'
import UserSignIn from '../javascripts/components/users/SignIn.vue'
import UserSignUp from '../javascripts/components/users/SignUp.vue'

Vue.prototype.$cable  = ActionCable.createConsumer('ws:localhost:3000/cable')

new Vue({
  router,
  components: {
    Header,
    Footer,
    UserSignIn,
    UserSignUp
  },
}).$mount('#app')
