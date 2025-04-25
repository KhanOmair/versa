'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "f9f4bc587873f6dc17ce7a3c12f5974c",
"version.json": "7385e1aaf5578f50a7a4137bb23c44e2",
"index.html": "9b70296b16563a558d64db3d00288169",
"/": "9b70296b16563a558d64db3d00288169",
"CNAME": "824e05fe3b10c03355b31686d4c89749",
"images/card.png": "892cb3a6a0127abf6f5789f488f6fb67",
"images/targets.mind": "4a3de31cebce55995567984b86c08998",
"main.dart.js": "7ef0f20087ef3835fbd7d4af5f662d32",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"models/voiceover.m4a": "d2a48c5f8ceb0e2cc9f760afd7fdc864",
"models/botanim.glb": "0412b02f8c2b866aa0917d9bb7734289",
"favicon.png": "1aa34834b3e270a812a1eace8b5cb212",
"icons/Icon-192.png": "d641c4a9c2121a043b0d65d3767c47ff",
"icons/Icon-maskable-192.png": "d641c4a9c2121a043b0d65d3767c47ff",
"icons/Icon-maskable-512.png": "666a1b1f4596a99d572fc10fd86c9a44",
"icons/Icon-512.png": "666a1b1f4596a99d572fc10fd86c9a44",
"manifest.json": "32ec1946708f9b68cab343b1e86e49ea",
"assets/web/CNAME": "824e05fe3b10c03355b31686d4c89749",
"assets/web/favicon.png": "1aa34834b3e270a812a1eace8b5cb212",
"assets/AssetManifest.json": "d196d12c08a42604842425da6fc06651",
"assets/NOTICES": "c6310a5f88d1cab03664107a3a3f06e9",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "8a2990dff467d99bfe4cb8a686710dd8",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "788e15fe35e3194d5629001f2a81c61a",
"assets/fonts/MaterialIcons-Regular.otf": "8761dab84ab2285f6fb9496d1a12663e",
"assets/assets/images/services2.png": "a9a8e38837e6ed4a967af0dfb7a08630",
"assets/assets/images/versa_logo.png": "1aa34834b3e270a812a1eace8b5cb212",
"assets/assets/images/inventory_solutions.png": "2b392da8245dc338b56484db248e1d9e",
"assets/assets/images/services.png": "abd736c120efc8b224625186da3164b8",
"assets/assets/images/e-commerce.png": "c445a0ca470e3fded0dda27605202e61",
"assets/assets/images/office_solutions.jpg": "ea6a69431f39b0d575361048c7b7a2cf",
"assets/assets/images/instaLogo.png": "43383fc52fac898cfe607b3cf5f95733",
"assets/assets/images/4.png": "4e6840bc204729925333323cc8fa9491",
"assets/assets/images/2.png": "b972bad2853b33dafffea988a149f795",
"assets/assets/images/3.png": "9ca04c11bce278778d705db95f62c427",
"assets/assets/images/1.png": "e5a5b986727649b53caeffeb92b39f2d",
"assets/assets/images/bg.png": "f8708bee72710ef632c097274b5f1277",
"arDemo.html": "80390a07cc955d38592fb12f6219df0d",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
