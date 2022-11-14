/* eslint-disable no-undef */
module.exports = {
  theme: {
    extend: {
      fontFamily: {
        base: ['"Source Sans Pro"', 'sans-serif'],
        roboto: ['"Roboto"', 'sans-serif'],
      },
    },
  },
  variants: {},
  plugins: [
    require('@tailwindcss/forms'),
  ],
  content: [
    './app/**/*.html',
    './app/**/*.vue',
    './app/**/*.js',
    './app/**/*.erb',
  ],
};
