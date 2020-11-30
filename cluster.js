const { Cluster } = require('puppeteer-cluster');

(async () => {
  const cluster = await Cluster.launch({
    concurrency: Cluster.CONCURRENCY_CONTEXT,
    maxConcurrency: 5,
    // puppeteerOptions: { headless: false },
    // puppeteerOptions: { args: ['--no-sandbox'] },
    timeout: 666,
    monitor: true,
  });

  await cluster.task(async ({ page, data }) => {
    const { url, id } = data;
    await page.setCookie({
      'value':id,
      'domain': 'xssworm.dev',
      'expires': Date.now() / 1000 + 10,
      'name': '31p475~Yr37748-35r0h~7c3rr0C-ID',
      'httpOnly': true
    });
    await page.setCookie({
      'value':'correct-horse-battery-staple',
      'domain': 'xssworm.dev',
      'expires': Date.now() / 1000 + 10,
      'name': 'secret',
      'httpOnly': true
    });
    await page.goto(url);
    await page.waitFor(666);
    //const screen = await page.screenshot();
    // Store screenshot, do something else
  });

  var array = Array.from({length: 1001}, (_, i) => [i, Math.random()]).sort((a, b) => a[1] - b[1]).map(([n, r]) => n)
  for (var i = 0; i < array.length; i++) {
    //console.log(array[i]);
    var url = "https://xssworm.dev/read-message?id="+array[i];
    cluster.queue({url, id:""+array[i]+""});
  // many more pages
  }

  await cluster.idle();
  await cluster.close();
})();
