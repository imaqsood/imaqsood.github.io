const fs = require('fs');
const path = require('path');
const { minify } = require('html-minifier-terser');

// Read your HTML file
const htmlPath = path.resolve(__dirname, 'resume.html');  // Use resume.html as input
const htmlContent = fs.readFileSync(htmlPath, 'utf8');

// Minify HTML
(async () => {
  try {
    const minifiedHTML = await minify(htmlContent, {
      collapseWhitespace: true,
      removeComments: true,
      removeRedundantAttributes: true,
      removeEmptyAttributes: true,
      minifyJS: true,
      minifyCSS: true,
      useShortDoctype: true,
      removeOptionalTags: true,
      continueOnParseError: true,
      caseSensitive: true,
      keepClosingSlash: true,
      ignoreCustomComments: [/^!/],
      processScripts: ['text/html'],
      decodeEntities: true,
      conservativeCollapse: true,
      html5: true
    });

    fs.writeFileSync('minified-resume.html', minifiedHTML);
    console.log('✅ HTML Minified Successfully!');
  } catch (error) {
    console.error('❌ Error during minification:', error.message);
  }
})();
