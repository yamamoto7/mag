/* eslint no-console:0 */
import Vue from 'vue/dist/vue.esm'
import ActionCable from 'actioncable'
import router from '../javascripts/router'
import UserHeader from '../javascripts/components/layout/UserHeader.vue'
import UserFooter from '../javascripts/components/layout/UserFooter.vue'
import UserSignIn from '../javascripts/components/users/SignIn.vue'
import UserSignUp from '../javascripts/components/users/SignUp.vue'

Vue.prototype.$cable  = ActionCable.createConsumer('ws:localhost:3000/cable')

new Vue({
  router,
  components: {
    UserHeader,
    UserFooter,
    UserSignIn,
    UserSignUp
  },
}).$mount('#app')
