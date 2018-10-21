import Vue from 'vue/dist/vue.esm'
import Router from 'vue-router'
import HomeTop from '../components/HomeTop.vue'
import UserList from '../components/UserList.vue'

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
      name: 'UserList',
      component: UserList
    }
  ]
})
