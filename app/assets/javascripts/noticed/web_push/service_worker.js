ENGINE_MOUNT_PATH = null
VERSION = 1

export function start(options) {
  ENGINE_MOUNT_PATH = options.mounted_path
}

self.addEventListener('push', event => {
    const data = event.data?.json() || {}
    console.log(`v${VERSION}: Received push`, data)

    event.waitUntil(
        self.registration.showNotification(data.title, {
            body: data.body,
            data: data,
        })
    )
})

self.addEventListener("notificationclick", event => {
    event.notification.close()
    console.log(`opening ${event.notification.data.url}`)

    event.waitUntil(
        self.clients.openWindow(event.notification.data.url)
    )
})

self.addEventListener('pushsubscriptionchange', async (event) => {
    const subscription = await self.registration.pushManager.getSubscription()
    await fetch(`${ENGINE_MOUNT_PATH}/subscriptions`, {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify(subscription),
    })
})