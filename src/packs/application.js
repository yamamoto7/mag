/* eslint no-console:0 */
import Vue from 'vue/dist/vue.esm'
import ActionCable from 'actioncable'
import router from '../javascripts/router'
import MainHeader from '../javascripts/components/layout/Header.vue'
import MainFooter from '../javascripts/components/layout/Footer.vue'
import MainView from '../javascripts/screens/main.vue';
import UserSignIn from '../javascripts/components/users/SignIn.vue'
import UserSignUp from '../javascripts/components/users/SignUp.vue'

Vue.prototype.$cable  = ActionCable.createConsumer('ws:localhost:3000/cable')

new Vue({
  router,
  components: {
    MainView,
    MainHeader,
    MainFooter,
    UserSignIn,
    UserSignUp
  },
}).$mount('#app')
