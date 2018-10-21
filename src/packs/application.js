/* eslint no-console:0 */
import Vue from 'vue/dist/vue.esm'
import router from '../javascripts/router'
import UserHeader from '../javascripts/components/layout/UserHeader.vue'
import UserSignIn from '../javascripts/components/users/SignIn.vue'
import UserSignUp from '../javascripts/components/users/SignUp.vue'

// リセットcssとか読み込む用
import './style.scss'

new Vue({
  router,
  components: {
    UserHeader,
    UserSignIn,
    UserSignUp
  },
}).$mount('#app')
