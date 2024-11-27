const VERSION = 'v1'

self.addEventListener('fetch', (event) => {
	event.respondWith(
		caches.open(VERSION).then((cache) =>
			cache.match(event.request).then((response) => {
				const fetchPromise = fetch(event.request).then((networkResponse) => {
					cache.put(event.request, networkResponse.clone())
					return networkResponse
				})
				return response || fetchPromise
			}),
		),
	)
})
