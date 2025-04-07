// module.exports = {
//     plugins: [
//       require('@tailwindcss/postcss7-compat'),
//       require('autoprefixer'),
//       require('cssnano')({
//         preset: 'default',
//       }),
//       require('@fullhuman/postcss-purgecss')({
//         content: ['./resume.html'],  // Adjust paths based on your project
//         defaultExtractor: content => content.match(/[\w-/:]+(?<!:)/g) || [],
//       })
//     ],
//   }


const tailwindcss = require('@tailwindcss/postcss');
const autoprefixer = require('autoprefixer');
const cssnano = require('cssnano');

module.exports = {
  plugins: [
    tailwindcss,
    autoprefixer,
    cssnano({
      preset: 'default',
    }),
  ],
};



    
  

  