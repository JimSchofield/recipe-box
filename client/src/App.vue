<template>
  <div id="app">
    <router-view />
    <Modal />
  </div>
</template>

<script>
import Modal from "./views/Modal.vue";

export default {
  name: "App",
  components: {
    Modal
  }
};
</script>

<style lang="scss">
body {
  margin: 0;
}

#app {
  font-family: "Open Sans";
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
}

#modal {
  background: lightgray;
  position: absolute;
  top: 0;
  left: 0;
  min-height: 300px;
  width: 100%;
}

.fade-enter-active,
.fade-leave-active {
  transition: opacity 300ms;
}

.fade-enter,
.fade-leave-to {
  opacity: 0;
}
</style>
