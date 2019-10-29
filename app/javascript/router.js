import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from './views/home/app.vue'
import Settings from './views/settings/app.vue'

Vue.use(VueRouter)

export default new VueRouter({
  mode: 'history',
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home,
    },
    {
      path: '/settings',
      name: 'settings',
      component: Settings
    },
  ]
})
