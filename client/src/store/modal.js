const modalModule = {
  state: {
    isOpen: false,
    component: null,
    props: undefined
  },
  actions: {
    ["modalOpen"](context, payload) {
      context.commit("modalOpen", payload);
    },
    ["modalClose"](context) {
      context.commit("modalClose");
    }
  },
  mutations: {
    ["modalOpen"](state, { component, props }) {
      state.isOpen = true;
      state.component = component;
      state.props = props;
    },
    ["modalClose"](state) {
      state.isOpen = false;
    }
  }
};

export default modalModule;
