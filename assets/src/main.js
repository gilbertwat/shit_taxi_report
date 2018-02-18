import Vue from 'vue'
import App from './App.vue'
import Vue2Leaflet from 'vue2-leaflet';
import axios from 'axios';

Vue.component('v-map', Vue2Leaflet.Map);
Vue.component('v-tilelayer', Vue2Leaflet.TileLayer);
Vue.component('v-marker', Vue2Leaflet.Marker);

new Vue({
  el: '#app',
  render: h => h(App)
})
