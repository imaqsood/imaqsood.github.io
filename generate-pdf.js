const { chromium } = require('playwright');
const fs = require('fs');
const path = require('path');

(async () => {
  const browser = await chromium.launch();  // Fast and headless by default
  const page = await browser.newPage();

  // Load HTML file content
  const htmlPath = path.resolve(__dirname, 'resume.html');
  const htmlContent = fs.readFileSync(htmlPath, 'utf8');

  await page.setContent(htmlContent, { waitUntil: 'domcontentloaded' });

  await page.pdf({
    path: 'output.pdf',
    format: 'A4',
    printBackground: true,
    margin: { top: '0.5in', right: '0.5in', bottom: '0.5in', left: '0.5in' }
  });

  await browser.close();
  console.log('✅ PDF generated successfully!');
})();
