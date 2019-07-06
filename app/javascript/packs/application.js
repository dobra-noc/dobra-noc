import Vue from 'vue/dist/vue.esm'
import App from '../components/app.vue'
import { Icon }  from 'leaflet'
import 'leaflet/dist/leaflet.css'

document.addEventListener('DOMContentLoaded', () => {
  document.body.appendChild(document.createElement('app'))

  delete Icon.Default.prototype._getIconUrl;

  Icon.Default.mergeOptions({
      iconRetinaUrl: require('leaflet/dist/images/marker-icon-2x.png'),
      iconUrl: require('leaflet/dist/images/marker-icon.png'),
      shadowUrl: require('leaflet/dist/images/marker-shadow.png')
  });

  const app = new Vue({
    el: 'app',
    template: '<App/>',
    components: { App }
  })
})