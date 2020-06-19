const modalModule = {
  state: {
    isOpen: true
  },
  actions: {
    ["modalOpen"](context) {
      context.commit("modalOpen");
    },
    ["modalClose"](context) {
      context.commit("modalClose");
    }
  },
  mutations: {
    ["modalOpen"](state) {
      state.isOpen = true;
    },
    ["modalClose"](state) {
      state.isOpen = false;
    }
  }
};

export default modalModule;
