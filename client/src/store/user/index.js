const userModule = {
  state: {
    loggedIn: false
  },
  actions: {
    ["LOGIN"](context) {
      context.commit("LOGIN");
    }
  },
  mutations: {
    ["LOGIN"](state) {
      state.loggedIn = true;
    }
  }
};

export default userModule;
