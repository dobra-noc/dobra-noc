import Vue from 'vue'
import App from '../components/app.vue'
import router from '../router.js'
import { Icon }  from 'leaflet'
import 'leaflet/dist/leaflet.css'
import Router from 'vue-router'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'
import BootstrapVue from 'bootstrap-vue'

Vue.use(Router)
Vue.use(BootstrapVue)

document.addEventListener('DOMContentLoaded', () => {
  document.body.appendChild(document.createElement('app'))

  delete Icon.Default.prototype._getIconUrl;

  Icon.Default.mergeOptions({
      iconRetinaUrl: require('leaflet/dist/images/marker-icon-2x.png'),
      iconUrl: require('leaflet/dist/images/marker-icon.png'),
      shadowUrl: require('leaflet/dist/images/marker-shadow.png')
  })

  const app = new Vue({
    router,
    render: h => h(App)
  }).$mount('app')
})
