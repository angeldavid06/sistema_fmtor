const CACHE_NAME = 'cache_fmtor_v2',
urlsToCache = [
    'https://fonts.googleapis.com/icon?family=Material+Icons',
    url+'/fmtor_1024.png',
    url+'/fmtor_512.png',
    url+'/fmtor_256.png',
    url+'/fmtor_128.png',
    url+'/fmtor_64.png',
    url+'/fmtor_32.png',
    url+'/fmtor_16.png'
]

self.addEventListener('install', e => {
    e.waitUntil(
        caches.open(CACHE_NAME)
        .then(cache => {
            return cache.addAll(urlsToCache)
            .then(() => self.skipWaiting())
        })
        .catch(err => console.log('Fallo el registro en cache', err))
    )
})

self.addEventListener('activate', e => {
    const cacheWhiteList = [CACHE_NAME]
    
    e.waitUntil(
        caches.keys()
        .then(cacheNames => {
            cacheNames.map(cacheName => {
                if(cacheWhiteList.indexOf(cacheName) === -1) {
                    return caches.delete(cacheName)
                }                
            })
        })
        .then(() => self.clients.claim())
    )
})

self.addEventListener('fetch', e => {
    e.respondWith(
        caches.match(e.request)
        .then(res => {
            if(res) {
                return res
            }
            return fetch(e.request)
        })
    )
})