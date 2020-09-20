<template>
  <div class="home">
    <img alt="Vue logo" src="../assets/logo.png">
    <Top msg="Welcome to Your Vue.js + TypeScript App"/>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import Top from '@/components/Top.vue' // @ is an alias to /src

export default Vue.extend({
  name: 'Home',
  components: {
    Top
  }
})
</script>
