import Vue from 'vue/dist/vue.esm'
import Router from 'vue-router'
import HomeTop from '../components/HomeTop.vue'
import UserSign from '../components/UserSign.vue'

Vue.use(Router)

export default new Router({
  hashbang: false,
  mode: 'history',
  routes: [
    {
      path: '/examples',
      name: 'HomeTop',
      component: HomeTop
    },
    {
      path: '/',
      name: 'UserSign',
      component: UserSign
    }
  ]
})
