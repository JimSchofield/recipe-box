import router from "../../router/index";

const userModule = {
  state: {
    loggedIn: true
  },
  actions: {
    ["LOGIN"](context) {
      context.commit("LOGIN");
      router.push({ path: "/" });
    }
  },
  mutations: {
    ["LOGIN"](state) {
      state.loggedIn = true;
    }
  }
};

export default userModule;
