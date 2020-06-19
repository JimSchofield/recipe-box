import Vue from "vue";
import VueRouter from "vue-router";

import store from "../store/index";

import Welcome from "../views/Welcome.vue";
import About from "../views/About.vue";
import Container from "../views/main/Container.vue";
import Dashboard from "../views/main/Dashboard.vue";
import Search from "../views/main/Search.vue";
import Browse from "../views/main/Browse.vue";
import Collections from "../views/main/Collections.vue";
import Add from "../views/modal/Add.vue";

Vue.use(VueRouter);

const routes = [
  {
    path: "/login",
    name: "Welcome",
    component: Welcome,
    meta: {
      authRequired: true
    }
  },
  {
    path: "/about",
    name: "About",
    component: About
  },
  {
    path: "/",
    component: Container,
    children: [
      {
        path: "",
        name: "Dashboard",
        component: Dashboard,
        meta: {
          authRequired: true
        }
      },
      {
        path: "/search",
        name: "Search ",
        component: Search,
        meta: {
          authRequired: true
        }
      },
      {
        path: "/browse",
        name: "Browse",
        component: Browse,
        meta: {
          authRequired: true
        }
      },
      {
        path: "/collections",
        name: "Collections",
        component: Collections,
        meta: {
          authRequired: true
        }
      },
      {
        path: "/add",
        name: "Add",
        component: Add,
        meta: {
          authRequired: true
        }
      }
    ]
  }
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes
});

router.beforeEach((to, from, next) => {
  if (to.matched.some(route => route.meta.authRequired)) {
    if (!store.state.userModule.loggedIn && to.path !== "/login") {
      return next({ path: "/login" });
    }
  }

  next();
});

export default router;
