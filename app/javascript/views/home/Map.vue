<template>
  <l-map
    :zoom="zoom"
    :center="center"
    style="width: 100%; height:400px"
  >
    <l-tile-layer
      :url="url"
      :attribution="attribution"
    />
    <l-marker
      v-for="marker in markers"
      :key="marker.id"
      :lat-lng="[marker.latitude, marker.longitude]"
      @click="sendLocationId(marker.id)"
    />
  </l-map>
</template>

<script>
  import { LMap, LTileLayer, LMarker } from "vue2-leaflet"

  export default {
    components: { LMap, LTileLayer, LMarker },
    methods: {
      sendLocationId(locationId) {
        this.$emit("location-id", locationId)
      }
    },
    data() {
      return {
        map: null,
        tileLayer: null,
        layers: [],
        zoom: 0,
        center: L.latLng(50.0523853, 19.9441151),
        url: "http://{s}.tile.osm.org/{z}/{x}/{y}.png",
        attribution:
          '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors',
        markers: []
      }
    },
    async mounted() {
      this.loaded = false
      try {
        await fetch(`http://${window.location.host}/api/v1/locations`)
          .then(response => response.json())
          .then(data => (this.markers = data));
        this.loaded = true
      } catch (e) {
        console.log(e)
      }
    }
  }
</script>
