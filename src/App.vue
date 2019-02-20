<template>
  <div class="id_wrapper">
    <app-header></app-header>
    <router-view></router-view>
    <app-footer></app-footer>
  </div>
</template>

<script>
import appHeader from './components/public/Header.vue'
import appFooter from './components/public/Footer.vue'

export default {
  name: 'App',
  data () {
    return {
      searching: false
    }
  },
  components: {
    'app-header': appHeader,
    'app-footer': appFooter
  },
  methods: {
    async funcInApp () {
      console.log('funcInApp......')
    }
  }
}
</script>

<style>
  #id_wrapper {
    min-height: 100%;
    position: relative;
    margin: 0px;
    padding: 0px;
 }
</style>