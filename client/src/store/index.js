import Vue from "vue";
import Vuex from "vuex";

import userModule from "./user";
import modalModule from "./modal";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {},
  mutations: {},
  actions: {},
  modules: {
    userModule,
    modalModule
  }
});
