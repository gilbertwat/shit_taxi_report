<template>
  <div id="app">
    <form v-on:submit.prevent>
      <fieldset>
        <button type="button" v-on:click="allowLocation">迅速送出位置先</button>
      </fieldset>
      <fieldset>
        <label for="license_plate">
          條粉腸個車牌:
        </label>
        <input id="license_plate" name="license_plate" v-model="license_plate">
      </fieldset>
      <fieldset>
        <label for="type-rejected">又拒載我dllm:</label>
        <input id="type-rejected" type="radio" v-model="type" name="type" value="rejected">
        <label for="type-too-much-fare">又借啲E收多:</label>
        <input id="type-too-much-fare" type="radio" v-model="type" name="type" value="too_much_fare">
      </fieldset>
      <fieldset>
        <template v-if="isLocationReady()">
          <div id="mapid">
            <v-map :zoom=13 :center="[47.413220, -1.219482]">
              <v-tilelayer url="http://{s}.tile.osm.org/{z}/{x}/{y}.png"></v-tilelayer>
              <v-marker :lat-lng="[47.413220, -1.219482]"></v-marker>
            </v-map>
          </div>
        </template>
      </fieldset>
      <fieldset>
        <label for="lat">lat:</label>
        <input id="lat" type="number" v-model.number="lat" name="lat" step="0.000001">
      </fieldset>
      <fieldset>
        <label for="lon">lon:</label>
        <input id="lon" type="number" v-model.number="lon" name="lon" step="0.000001">
      </fieldset>
      <button v-bind:disabled="isLocationReady()" type="button" v-on:click="dllm">屌你老母</button>
    </form>
  </div>
</template>

<script>
  import axios from 'axios';
export default {
  name: 'app',
  data() {
    return {
      license_plate: "",
      type: "rejected",
      lat: NaN,
      lon: NaN,
      accuracy: NaN
    }
  },
  methods: {
    isLocationReady() {
      return !(isNaN(this.lat) || isNaN(this.lon));
    },
    showLoading() {
      console.log("攞緊喇知你燥")
    },
    hideLoading() {
      console.log("攞到喇催催催")
    },
    allowLocation() {
      this.showLoading();
      if (navigator && navigator.geolocation) {
        navigator.geolocation.getCurrentPosition((pos) => {
          this.hideLoading();
          console.log(this);
          console.log(pos);
          this.lat = pos.coords.latitude;
          this.lon = pos.coords.longitude;
          this.accuracy = pos.coords.accuracy;
        });
      }
    },
    dllm: function() {
      //validate(this);
      console.log(this);
      axios.post('./api/reports', {
        shit_taxi_report: {
          lat: this.lat,
          lon: this.lon,
          license_plate: this.license_plate,
          type: this.type
        }
      }).then((response) => {

      }).catch((error) =>{

      })
    }
  }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}

#mapid { height: 180px; }

label {
  font-size:2.3333rem;
}

h1, h2 {
  font-weight: normal;
}

ul {
  list-style-type: none;
  padding: 0;
}

li {
  display: inline-block;
  margin: 0 10px;
}

a {
  color: #42b983;
}
</style>
