self.addEventListener('install', function(event) {
  console.log('Service Worker instalado');
  event.waitUntil(
    caches.open('my-cache').then(function(cache) {
      return cache.addAll([
        '/',
        '/index.html',
        '/assets/css/style.css',
        '/assets/js/script.js',
        '/assets/js/sw.js',
        '/assets/imgs/favicon.png',
        '/assets/imgs/icon.png',
        '/assets/imgs/icon-large.png'
      ]);
    })
  );
});

self.addEventListener('activate', function(event) {
  console.log('Service Worker ativado');
});

self.addEventListener('fetch', function(event) {
  console.log('Interceptando requisições', event.request);
  event.respondWith(
    caches.match(event.request).then(function(response) {
      return response || fetch(event.request);
    })
  );
});
