<template>
  <div id="app">
    <router-view />
    <transition name="fade">
      <div id="modal" v-if="modalIsOpen">
        <p>Hey dere</p>
        <button @click="modalClose">Close Me Please</button>
      </div>
    </transition>
  </div>
</template>

<script>
import { mapActions, mapState } from "vuex";

export default {
  name: "App",
  computed: {
    ...mapState({ modalIsOpen: state => state.modalModule.isOpen })
  },
  methods: {
    ...mapActions(["modalClose"])
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
