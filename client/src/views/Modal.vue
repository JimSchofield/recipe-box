<template>
  <transition name="fade">
    <div id="modal" v-if="modalIsOpen">
      <component :is="ModalComponent" v-bind="modalProps"></component>
      <button @click="modalClose">Close Me Please</button>
    </div>
  </transition>
</template>

<script>
import { mapActions, mapState } from "vuex";

export default {
  name: "Modal",
  computed: {
    ...mapState({ 
      modalIsOpen: state => state.modalModule.isOpen,
      ModalComponent: state => state.modalModule.component,
      modalProps: state => state.modalModule.props
    })
  },
  methods: {
    ...mapActions(["modalClose"])
  }
};
</script>

<style lang="scss">
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
