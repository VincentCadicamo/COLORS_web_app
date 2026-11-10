import js from "@eslint/js";
import globals from "globals";

export default [
  {
    // md5.js is a vendored third-party library (blueimp JavaScript-MD5), not our code.
    ignores: ["node_modules/**", "public/js/md5.js"],
  },

  js.configs.recommended,

  {
    // Front-end scripts are loaded with plain <script> tags, so they run as
    // classic scripts in the browser, not as ES modules.
    files: ["public/js/**/*.js"],
    languageOptions: {
      ecmaVersion: 2022,
      sourceType: "script",
      globals: {
        ...globals.browser,
      },
    },
    rules: {
      curly: "error",
      eqeqeq: ["error", "always"],
      "no-var": "error",
      "prefer-const": "error",
    },
  },

  {
    files: ["eslint.config.mjs"],
    languageOptions: {
      sourceType: "module",
      globals: {
        ...globals.node,
      },
    },
  },
];
