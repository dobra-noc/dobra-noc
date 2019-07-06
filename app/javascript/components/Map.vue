<template>
        <l-map :zoom="zoom" :center="center" style="width: 100%; height:400px">
            <l-tile-layer :url="url" :attribution="attribution"></l-tile-layer>
            <l-marker :lat-lng="marker"></l-marker>
        </l-map>
</template>

<script>
    import {LMap, LTileLayer, LMarker} from 'vue2-leaflet'

    export default {
        components: { LMap, LTileLayer, LMarker },
        data() {
            return {
                map: null,
                tileLayer: null,
                layers: [],
                zoom: 18,
                center: L.latLng(50.0523853, 19.9441151),
                url: 'http://{s}.tile.osm.org/{z}/{x}/{y}.png',
                attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors',
                marker: L.latLng(50.0523853, 19.9441151),
            }
        }
    }
</script>
