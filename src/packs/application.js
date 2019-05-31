/* eslint no-console:0 */
import Vue from 'vue/dist/vue.esm'
import ActionCable from 'actioncable'
import router from '../javascripts/router'
import MainHeader from '../javascripts/components/layout/Header.vue'
import MainFooter from '../javascripts/components/layout/Footer.vue'
import MainView from '../javascripts/screens/main.vue';
import LoginView from '../javascripts/screens/Login.vue'
import UserSignIn from '../javascripts/components/users/SignIn.vue'
import UserSignUp from '../javascripts/components/users/SignUp.vue'
import UserSaveImage from '../javascripts/components/users/SaveImage.vue'
import SurveyScreen from '../javascripts/screens/SurveyScreen.vue'


Vue.prototype.$cable  = ActionCable.createConsumer('http://localhost:5000/cable')

new Vue({
  router,
  components: {
    MainView,
    MainHeader,
    MainFooter,
    LoginView,
    UserSignIn,
    UserSignUp,
    UserSaveImage,
    SurveyScreen,
  },
}).$mount('#app')
