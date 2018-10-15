import Vue from 'vue/dist/vue.esm'
import Router from 'vue-router'
import HomeTop from '../components/HomeTop.vue'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'HomeTop',
      component: HomeTop
    }
  ]
})
