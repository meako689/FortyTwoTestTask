module.exports = {
  extends: [
    'plugin:vue/vue3-recommended',
  ],
  rules: {
    'no-trailing-spaces': 1,
    'semi': 1,
    'quotes': [1, 'single'],
    'vue/max-attributes-per-line': 0,
    'vue/singleline-html-element-content-newline': 0,
    'vue/attribute-hyphenation': ['warn', 'always', {ignore: ['viewBox']}],
    'no-console': ['warn', {allow: ['warn', 'error', 'debug']}],
    'arrow-parens': 1,
    'curly': 'warn',
  }
};
