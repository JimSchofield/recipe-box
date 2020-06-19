<template>
  <div class="container">
    <div class="container__sidebar">
      <Sidebar />
    </div>
    <router-view class="container__main"></router-view>
  </div>
</template>

<script>
import Sidebar from "./Sidebar.vue";

export default {
  name: "Container",
  components: {
    Sidebar
  }
};
</script>

<style lang="scss">
.container {
  display: grid;
  grid-template-columns: 200px auto;
  min-height: 100vh;
}
</style>
